//: Playground - noun: a place where people can play

import UIKit


public protocol SpotlightType {
    var frame: CGRect { get }
    var center: CGPoint { get }
    var path: UIBezierPath { get }
    var infinitesmalPath: UIBezierPath { get }
}

public extension SpotlightType {
    var center: CGPoint {
        return CGPoint(x: frame.midX, y: frame.midY)
    }
    
    var infinitesmalPath: UIBezierPath {
        return UIBezierPath(roundedRect: CGRect(origin: center, size: CGSize.zero), cornerRadius: 0)
    }
}

open class Spotlight {
    open class Oval: SpotlightType {
        open var frame: CGRect
        public init(frame: CGRect) {
            self.frame = frame
        }
        
        public convenience init(center: CGPoint, diameter: CGFloat) {
            let frame = CGRect(x: center.x - diameter / 2, y: center.y - diameter / 2, width: diameter, height: diameter)
            self.init(frame: frame)
        }
        
        public convenience init(view: UIView, margin: CGFloat) {
            let origin = view.superview!.convert(view.frame.origin, to: view.window!.screen.fixedCoordinateSpace)
            let center = CGPoint(x: origin.x + view.bounds.width / 2, y: origin.y + view.bounds.height / 2)
            let diameter = max(view.bounds.width, view.bounds.height) + margin * 2
            self.init(center: center, diameter: diameter)
        }
        
        open var path: UIBezierPath {
            return UIBezierPath(roundedRect: frame, cornerRadius: frame.width / 2)
        }
    }
    
    open class Rect: SpotlightType {
        open var frame: CGRect
        public init(frame: CGRect) {
            self.frame = frame
        }
        
        public init(center: CGPoint, size: CGSize) {
            let frame = CGRect(x: center.x - size.width / 2, y: center.y - size.height / 2, width: size.width, height: size.height)
            self.frame = frame
        }
        
        public init(view: UIView, margin: CGFloat) {
            let viewOrigin = view.superview!.convert(view.frame.origin, to: view.window!.screen.fixedCoordinateSpace)
            let origin = CGPoint(x: viewOrigin.x - margin, y: viewOrigin.y - margin)
            let size = CGSize(width: view.bounds.width + margin * 2, height: view.bounds.height + margin * 2)
            self.frame = CGRect(origin: origin, size: size)
        }
        
        open var path: UIBezierPath {
            return UIBezierPath(roundedRect: frame, cornerRadius: 0)
        }
    }
    
    open class RoundedRect: Rect {
        open var cornerRadius: CGFloat
        public init(center: CGPoint, size: CGSize, cornerRadius: CGFloat) {
            self.cornerRadius = cornerRadius
            super.init(center: center, size: size)
        }
        
        public init(view: UIView, margin: CGFloat, cornerRadius: CGFloat) {
            self.cornerRadius = cornerRadius
            super.init(view: view, margin: margin)
        }
        
        open override var path: UIBezierPath {
            return UIBezierPath(roundedRect: frame, cornerRadius: cornerRadius)
        }
    }
}

//Oval

    let oval = Spotlight.Oval(frame: CGRect(x: 100, y: 100, width: 150, height: 150))
    let layer = CAShapeLayer()
    layer.path = oval.path.cgPath
    layer.fillColor = UIColor.clear.cgColor
    layer.strokeColor = UIColor.black.cgColor

    let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
    view.layer.addSublayer(layer)
    view

    layer.removeFromSuperlayer()
    view
    //rect
let rect = Spotlight.Rect(frame: CGRect(x: 100, y: 100, width: 150, height: 150))
let layer_rect = CAShapeLayer()
layer_rect.path = rect.path.cgPath
layer_rect.fillColor = UIColor.clear.cgColor
layer_rect.strokeColor = UIColor.black.cgColor
view.layer.addSublayer(layer_rect)
view
layer_rect.removeFromSuperlayer()
view

//roundrect
//public init(center: CGPoint, size: CGSize, cornerRadius: CGFloat)

let roundrect = Spotlight.RoundedRect(center: CGPoint(x:100,y:100), size: CGSize(width: 100, height: 100), cornerRadius: 20)
let layer_roundrect = CAShapeLayer()
layer_roundrect.path = roundrect.path.cgPath
layer_roundrect.fillColor = UIColor.clear.cgColor
layer_roundrect.strokeColor = UIColor.black.cgColor
view.layer.addSublayer(layer_roundrect)
view


