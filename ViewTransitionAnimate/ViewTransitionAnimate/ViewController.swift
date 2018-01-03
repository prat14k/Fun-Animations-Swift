//
//  ViewController.swift
//  ViewTransitionAnimate
//
//  Created by Prateek Sharma on 30/12/17.
//  Copyright © 2017 Prateek Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(flipCard(_:)))
        tapGesture1.numberOfTapsRequired = 1
        view1.addGestureRecognizer(tapGesture1)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(flipCard(_:)))
        tapGesture2.numberOfTapsRequired = 1
        view2.addGestureRecognizer(tapGesture2)
    }
    
    @objc func flipCard(_ sender : UIGestureRecognizer){
        
        var fromView : UIView!
        var toView : UIView!
        
        
        if sender.view?.tag == 1 {
            fromView = view1
            toView = view2
        }
        else if sender.view?.tag == 2 {
            fromView = view2
            toView = view1
        }
        
        UIView.transition(from: fromView, to: toView, duration: 0.5, options: [.transitionFlipFromRight ,.showHideTransitionViews], completion: nil)
    }
}

