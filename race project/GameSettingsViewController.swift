//
//  GameSettingsViewController.swift
//  race project
//
//  Created by Герман Юрченко on 11/28/20.
//  Copyright © 2020 Herman Yurchanka. All rights reserved.
//

import UIKit

class GameSettingsViewController: UIViewController {
    static var carImageNumber = 0
    static var obsImageNumber = 0
    
    var carImages = [UIImage]()
    var obstacleImages = [UIImage]()
    
    @IBOutlet weak var carSelectOutlet: UIImageView!
    @IBOutlet weak var obstacleSelectOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carImages.append(UIImage(named: "carOne")!)
        carImages.append(UIImage(named: "carTwo")!)
        carImages.append(UIImage(named: "carThree")!)
        
        obstacleImages.append(UIImage(named: "rock")!)
        obstacleImages.append(UIImage(named: "brick")!)
        
        carSelectOutlet.image = carImages[0]
        obstacleSelectOutlet.image = obstacleImages[0]
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToRootButton(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func carSelectLeftButton(_ sender: UIButton) {
        if carSelectOutlet.image == carImages[0] {
            carSelectOutlet.image = carImages[1]
            GameSettingsViewController.carImageNumber = 1
        } else if carSelectOutlet.image == carImages[1] {
            carSelectOutlet.image = carImages[2]
            GameSettingsViewController.carImageNumber = 2
        } else if carSelectOutlet.image == carImages[2] {
            carSelectOutlet.image = carImages[0]
            GameSettingsViewController.carImageNumber = 0
        }
    }
    
    @IBAction func carSelectRightButton(_ sender: UIButton) {
        if carSelectOutlet.image == carImages[0] {
            carSelectOutlet.image = carImages[2]
            GameSettingsViewController.carImageNumber = 2
        } else if carSelectOutlet.image == carImages[2] {
            carSelectOutlet.image = carImages[1]
            GameSettingsViewController.carImageNumber = 1
        } else if carSelectOutlet.image == carImages[1] {
            carSelectOutlet.image = carImages[0]
            GameSettingsViewController.carImageNumber = 0
        }
    }
    
    @IBAction func obstacleSelectLeftButton(_ sender: UIButton) {
        if obstacleSelectOutlet.image == obstacleImages[0] {
            obstacleSelectOutlet.image = obstacleImages[1]
            GameSettingsViewController.obsImageNumber = 1
        } else if obstacleSelectOutlet.image == obstacleImages[1] {
            obstacleSelectOutlet.image = obstacleImages[0]
            GameSettingsViewController.obsImageNumber = 0
        }
    }
    
    @IBAction func obstacleSelectRightButton(_ sender: UIButton) {
        if obstacleSelectOutlet.image == obstacleImages[1] {
            obstacleSelectOutlet.image = obstacleImages[0]
            GameSettingsViewController.obsImageNumber = 0
        } else if obstacleSelectOutlet.image == obstacleImages[0] {
            obstacleSelectOutlet.image = obstacleImages[1]
            GameSettingsViewController.obsImageNumber = 1
        }
    }
    
    
}
