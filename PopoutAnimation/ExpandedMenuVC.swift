//
//  ExpandedMenuVC.swift
//  PopoutAnimation
//
//  Created by Prateek on 11/09/17.
//  Copyright © 2017 14K. All rights reserved.
//

import UIKit

class ExpandedMenuVC: UIViewController {

    
    @IBOutlet weak var toggleBtn: UIButton!
    @IBOutlet weak var darkFillView: UIView!
    @IBOutlet weak var expandingView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func toggleMenuAction(_ sender: UIButton) {
        
        if(sender.tag == 0){
            sender.tag = 1
            UIView.animate(withDuration: 1.0, animations: {
                
                self.darkFillView.transform = CGAffineTransform(scaleX: 11, y: 11);
                self.expandingView.transform = CGAffineTransform(translationX: 0, y: -75)
                self.toggleBtn.transform = CGAffineTransform(rotationAngle:CGFloat.pi);
            }) { (finished) in
                
            }
        }
        else{
            sender.tag = 0
            UIView.animate(withDuration: 1.0, animations: {
                
                self.darkFillView.transform = CGAffineTransform.identity;
                self.expandingView.transform = CGAffineTransform.identity
                self.toggleBtn.transform = CGAffineTransform.identity
            }) { (finished) in
                
            }
        }
        
        
        
    }

}
