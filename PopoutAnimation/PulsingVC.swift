//
//  PulsingVC.swift
//  PopoutAnimation
//
//  Created by Prateek on 16/09/17.
//  Copyright © 2017 14K. All rights reserved.
//

import UIKit

class PulsingVC: UIViewController , UITextFieldDelegate{

    
    var originalPt = CGPoint.zero
    @IBOutlet weak var animationSwitch: UISwitch!
    @IBAction func closeBtn(_ sender: UIButton) {
        popupView.alpha = 0.0
    }
    @IBOutlet weak var popupView: UIVisualEffectView!
    
    @IBOutlet weak var shakyTF: ShakyTF!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupView.alpha = 0.0
        originalPt = popupView.center
        // Do any additional setup after loading the view.
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        shakyTF.shake()
    }

    
    @IBAction func openBtn(_ sender: UIButton) {
        
        
        if(animationSwitch.isOn){
        
            popupView.layer.anchorPoint = CGPoint(x:0.5,y:0)
            popupView.center.y = popupView.center.y - popupView.frame.size.height/2.0
            popupView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
            
        }
        else{
        
            popupView.transform = CGAffineTransform(scaleX: 0.3, y: 2)
        }
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
            
                self.popupView.transform = .identity
            
            })  { (finished) in
                self.popupView.center = self.originalPt
                
                self.popupView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        }
        
            popupView.alpha = 1.0
        
    }

}
