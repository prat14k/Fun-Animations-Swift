//
//  ViewController.swift
//  PopoutAnimation
//
//  Created by Prateek on 10/09/17.
//  Copyright © 2017 14K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainBtn: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    var btn1Center : CGPoint!
    var btn2Center : CGPoint!
    var btn3Center : CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        btn1Center = btn1.center
        btn2Center = btn2.center
        btn3Center = btn3.center
        
        btn1.center = mainBtn.center;
        btn2.center = mainBtn.center;
        btn3.center = mainBtn.center;

        btn1.alpha = 0.0
        btn2.alpha = 0.0
        btn3.alpha = 0.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func mainAction(_ sender: UIButton) {
        
        if(sender.tag == 0){
            sender.backgroundColor = UIColor.orange
            sender.tag = 1;
        
            
            UIView.animate(withDuration: 0.3) {
                
                self.btn1.alpha = 1.0
                self.btn1.center = self.btn1Center
                self.btn2.alpha = 1.0
                self.btn2.center = self.btn2Center
                self.btn3.alpha = 1.0
                self.btn3.center = self.btn3Center
            }
        
        
        }
        else{
            sender.backgroundColor = UIColor.clear
            sender.tag = 0;
            
            
            UIView.animate(withDuration: 0.3) {
                
                self.btn1.alpha = 0.0
                self.btn1.center = self.mainBtn.center
                self.btn2.alpha = 0.0
                self.btn2.center = self.mainBtn.center
                self.btn3.alpha = 0.0
                self.btn3.center = self.mainBtn.center
            }
            
            
        }
        
        
        
    }
    
    

    @IBAction func btn1Action(_ sender: UIButton) {
    
        
        if(sender.tag == 0){
            sender.backgroundColor = UIColor.orange
            sender.tag = 1;
        }
        else{
            sender.backgroundColor = UIColor.clear
            sender.tag = 0;
        }
        
    }
    @IBAction func btn2Action(_ sender: UIButton) {
        
        
        if(sender.tag == 0){
            sender.backgroundColor = UIColor.orange
            sender.tag = 1;
        }
        else{
            sender.backgroundColor = UIColor.clear
            sender.tag = 0;
        }
        
    }
    @IBAction func btn3Action(_ sender: UIButton) {
    
        
        if(sender.tag == 0){
            sender.backgroundColor = UIColor.orange
            sender.tag = 1;
        }
        else{
            sender.backgroundColor = UIColor.clear
            sender.tag = 0;
        }
    
    }
    
    
}

