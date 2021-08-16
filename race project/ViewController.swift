//
//  ViewController.swift
//  race project
//
//  Created by Герман Юрченко on 11/22/20.
//  Copyright © 2020 Herman Yurchanka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var menuOut = true
    
    @IBOutlet weak var menuViewOutlet: UIView!
    @IBOutlet weak var mainViewOutlet: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func settingsButtonAction(_ sender: UIButton) {
        menuOut = false
        
        if menuOut == false {
            UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
            self.menuViewOutlet.frame = CGRect(x: 0, y: 0, width: self.menuViewOutlet.frame.width, height: self.menuViewOutlet.frame.height)
        }, completion: nil)
        
        let darkBlur = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = view.frame
        mainViewOutlet.addSubview(blurView)
        
        }
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        menuOut = true
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
        self.menuViewOutlet.frame = CGRect(x: -262, y: 0, width: self.menuViewOutlet.frame.width, height: self.menuViewOutlet.frame.height)
            }, completion: nil)
            
        for subview in mainViewOutlet.subviews {
                      if subview is UIVisualEffectView {
                          subview.removeFromSuperview()
                      }
                  }
    }
}

