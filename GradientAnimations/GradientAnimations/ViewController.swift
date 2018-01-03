//
//  ViewController.swift
//  GradientAnimations
//
//  Created by Prateek Sharma on 28/12/17.
//  Copyright © 2017 Prateek Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gradientImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 16, delay: 0, options: [.autoreverse , .curveLinear , .repeat], animations: {
            let x = -self.gradientImageView.bounds.size.width + self.view.frame.size.width
            
            self.gradientImageView.transform = CGAffineTransform(translationX: x, y: 0)
        }, completion: nil)
    }
    
    
}

