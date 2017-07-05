//
//  ViewController.swift
//  Gecco
//
//  Created by zhangfanghui on 2017/7/4.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonPressed(_ sender: Any) {
        
        presentAnnotation()
    }
    
    func presentAnnotation() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Annotation") as! AnnotationViewController
        viewController.alpha = 0.5
        present(viewController, animated: true, completion: nil)
    }
}

