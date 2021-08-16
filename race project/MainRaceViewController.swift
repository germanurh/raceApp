//
//  MainRaceViewController.swift
//  race project
//
//  Created by Герман Юрченко on 11/22/20.
//  Copyright © 2020 Herman Yurchanka. All rights reserved.
//

import UIKit

class MainRaceViewController: UIViewController {
    
    var timerMain: Timer? = nil
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var rockRight: UIImageView!
    @IBOutlet weak var rockLeft: UIImageView!
    @IBOutlet weak var shrubRight: UIImageView!
    @IBOutlet weak var shrubLeft: UIImageView!
    @IBOutlet weak var viewBorderRight: UIView!
    @IBOutlet weak var viewBorderLeft: UIView!
    @IBOutlet weak var carOutlet: UIImageView!
    @IBOutlet weak var stripOne: UIView!
    @IBOutlet weak var stripTwo: UIView!
    @IBOutlet weak var stripThree: UIView!
    @IBOutlet weak var stripFour: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        задаем начальные координаты полос
        firstCoordinates()
//        создали анимацию полос
        stripeAnimations()
//        создали таймер для проверки столкновений и алерта
        timer()
//        проверка на столкноаение
        animationsForCrash()
        carImageInGame()
        obsImageInGame()
        
    }
    
    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        guard let gestureView = sender.view else {
          return
        }

        gestureView.center = CGPoint(
          x: gestureView.center.x + translation.x,
          y: carOutlet.center.y)

        sender.setTranslation(.zero, in: view)
    }
    
    
    @IBAction func onBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    func stripeAnimations() {
        UIView.animate(withDuration: 3, delay: 0, options: [.repeat], animations: {
            self.stripOne.center = CGPoint(x: self.stripOne.center.x, y: 1200)
        }, completion: nil)
        UIView.animate(withDuration: 3, delay: 0.75, options: [.repeat], animations: {
            self.stripTwo.center = CGPoint(x: self.stripTwo.center.x, y: 1200)
        }, completion: nil)
        UIView.animate(withDuration: 3, delay: 1.5, options: [.repeat], animations: {
            self.stripThree.center = CGPoint(x: self.stripThree.center.x, y: 1200)
        }, completion: nil)
        UIView.animate(withDuration: 3, delay: 2.25, options: [.repeat], animations: {
            self.stripFour.center = CGPoint(x: self.stripFour.center.x, y: 1200)
        }, completion: nil)
    }
    
    func animationsForCrash() {
        UIView.animate(withDuration: 4, delay: 0, options: [.repeat], animations: {
            self.shrubLeft.center = CGPoint(x: self.shrubLeft.center.x, y: 1200)
        }, completion: nil)
        UIView.animate(withDuration: 4, delay: 2, options: [.repeat], animations: {
            self.shrubRight.center = CGPoint(x: self.shrubRight.center.x, y: 1200)
        }, completion: nil)
        UIView.animate(withDuration: 4, delay: 1, options: [.repeat], animations: {
            self.rockLeft.center = CGPoint(x: self.rockLeft.center.x, y: 1200)
        }, completion: nil)
        UIView.animate(withDuration: 4, delay: 3, options: [.repeat], animations: {
            self.rockRight.center = CGPoint(x: self.rockRight.center.x, y: 1200)
        }, completion: nil)
    }
    
    func timer() {
        timerMain = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
            if  self.carOutlet.frame.intersects(self.viewBorderLeft.frame) == true || self.carOutlet.frame.intersects(self.viewBorderRight.frame) == true || self.rockRight.layer.presentation()?.frame.intersects(self.carOutlet.frame) == true || self.rockLeft.layer.presentation()?.frame.intersects(self.carOutlet.frame) == true {
//                self.rockOutlet.layer.presentation()?.frame.intersects(self.carOutlet.frame) == true
                self.alert()
                self.timerMain?.invalidate()
               
                UIView.animate(withDuration: 2) {
                    self.carOutlet.transform = CGAffineTransform(rotationAngle: (CGFloat(Double.pi))) 
                }
            }
        }
        
        timerMain?.fire()
    }
    
    func alert() {
        let alertController = UIAlertController(title: "GAME OVER!", message: "try again", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Go back", style: .default) { (_) in
            self.navigationController?.popViewController(animated: true)
        }
        
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    func firstCoordinates() {
        stripOne.center = CGPoint(x: stripOne.center.x, y: -200)
        stripTwo.center = CGPoint(x: stripTwo.center.x, y: -200)
        stripThree.center = CGPoint(x: stripThree.center.x, y: -200)
        stripFour.center = CGPoint(x: stripFour.center.x, y: -200)
        
        rockLeft.center = CGPoint(x: rockLeft.center.x, y: -200)
        rockRight.center = CGPoint(x: rockRight.center.x, y: -200)
        
        shrubLeft.center = CGPoint(x: shrubLeft.center.x, y: -200)
        shrubRight.center = CGPoint(x: shrubRight.center.x, y: -200)
    }
    
    func carImageInGame() {
        if GameSettingsViewController.carImageNumber == 0 {
            carOutlet.image = UIImage(named: "carOne")
        } else if GameSettingsViewController.carImageNumber == 1 {
            carOutlet.image = UIImage(named: "carTwo")
        } else if GameSettingsViewController.carImageNumber == 2 {
            carOutlet.image = UIImage(named: "carThree")
        }
    }
    
    func obsImageInGame() {
        if GameSettingsViewController.obsImageNumber == 0 {
            rockLeft.image = UIImage(named: "rock")
            rockRight.image = UIImage(named: "rock")
        } else if GameSettingsViewController.obsImageNumber == 1 {
            rockLeft.image = UIImage(named: "brick")
            rockRight.image = UIImage(named: "brick")
        }
    }
}
