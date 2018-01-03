//
//  ViewController2.swift
//  ViewTransitionAnimate
//
//  Created by Prateek Sharma on 30/12/17.
//  Copyright © 2017 Prateek Sharma. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var animatingView: UIView!
    var currentIndex : Int!
    let colors : [UIColor] = {
       return [UIColor.white , UIColor.black , UIColor.blue, UIColor.brown, UIColor.cyan, UIColor.darkGray, UIColor.green]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentIndex = -1
    }
    
    @IBAction func animateAction(_ sender: UIButton) {
        
        currentIndex = currentIndex + 1
        currentIndex = currentIndex % colors.count
        
        UIView.transition(with: animatingView, duration: 0.5, options: .transitionFlipFromBottom, animations: {
            self.animatingView.backgroundColor = self.colors[self.currentIndex]
        }, completion: nil)
        
    }
}
