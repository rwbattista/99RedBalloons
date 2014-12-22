//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Robert Battista on 12/18/14.
//  Copyright (c) 2014 Robert Battista. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var balloonLabel: UILabel!
    
    var balloons:[Balloon] = []
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createBalloons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func barButtonNextPressed(sender: UIBarButtonItem) {
        
            let balloon = balloons[currentIndex]
        
        self.myImageView.image = balloon.image
        self.balloonLabel.text = "\(balloon.number) balloons"
        
//            UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
//            
//            self.myImageView.image = balloon.image
//            self.balloonLabel.text = "\(balloon.number) balloons"
//            
//            }, completion: {
//                (finished: Bool) -> () in
//        })
        
            currentIndex += 1
        
    }
    
    @IBAction func barButtonResetPresses(sender: UIBarButtonItem) {
        currentIndex = 0
        
        self.myImageView.image = UIImage(named: "BerlinTVTower.jpg")
        self.balloonLabel.text = "Balloons"
    }
    
    
    func createBalloons () {
        for var balloonCount = 0; balloonCount <= 99; ++balloonCount {
          var balloon = Balloon()
          balloon.number = balloonCount
            
          let randomNumber = Int(arc4random_uniform(UInt32(4)))
            
            switch randomNumber {
            case 1:
                balloon.image = UIImage(named: "RedBalloon1.jpg")
            case 2:
                balloon.image = UIImage(named: "RedBalloon2.jpg")
            case 3:
                balloon.image = UIImage(named: "RedBalloon3.jpg")
            default:
                balloon.image = UIImage(named: "RedBalloon4.jpg")
            }
            
          self.balloons.append(balloon)
        }
          
    }
}

