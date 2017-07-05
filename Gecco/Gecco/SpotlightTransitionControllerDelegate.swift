//
//  SpotlightTransitionControllerDelegate.swift
//  Gecco
//
//  Created by zhangfanghui on 2017/7/4.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import UIKit

protocol SpotlightTransitionControllerDelegate: class {
    func spotlightTransitionWillPresent(_ controller: SpotlightTransitionController, transitionContext: UIViewControllerContextTransitioning)
    func spotlightTransitionWillDismiss(_ controller: SpotlightTransitionController, transitionContext: UIViewControllerContextTransitioning)
}

class SpotlightTransitionController: NSObject, UIViewControllerAnimatedTransitioning {
    var isPresent = false
    
    weak var delegate: SpotlightTransitionControllerDelegate?
    
    //返回动画的时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    //在进行切换时调用此方法
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresent {
            animateTransitionForPresent(transitionContext)
        } else {
            animateTransitionForDismiss(transitionContext)
        }
    }
    
    fileprivate func animateTransitionForPresent(_ transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let destination = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
                fatalError()
        }
        transitionContext.containerView.insertSubview(destination.view, aboveSubview: source.view)
        
        destination.view.alpha = 0
        
        source.viewWillDisappear(true)
        destination.viewWillAppear(true)
        
        let duration = transitionDuration(using: transitionContext)
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            transitionContext.completeTransition(true)
        }
        { // In transation
            UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions(),
                           animations: {
                            destination.view.alpha = 1.0
            },
                           completion: { _ in
                            destination.viewDidAppear(true)
                            source.viewDidDisappear(true)
            }
            )
            delegate?.spotlightTransitionWillPresent(self, transitionContext: transitionContext)
        }()
        CATransaction.commit()
    }
    
    fileprivate func animateTransitionForDismiss(_ transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let destination = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
                fatalError()
        }
        
        source.viewWillDisappear(true)
        destination.viewWillAppear(true)
        
        let duration = transitionDuration(using: transitionContext)
        
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            transitionContext.completeTransition(true)
        }
        { // In transation
            UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions(),
                           animations: {
                            source.view.alpha = 0.0
            },
                           completion: { _ in
                            destination.viewDidAppear(true)
                            source.viewDidDisappear(true)
            }
            )
            delegate?.spotlightTransitionWillDismiss(self, transitionContext: transitionContext)
        }()
        CATransaction.commit()
    }
    
    func animationEnded(_ transitionCompleted: Bool) {
    }
}
