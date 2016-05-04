//
//  ViewController.swift
//  SnapGame
//
//  Created by Bono on 3/16/16.
//  Copyright © 2016 Engene. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var snapButton: UIButton!
    
    var timer = NSTimer() // timer for countdown
    var timerInt = 0
    
    var imageTimer = NSTimer()
    var scoreInt = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 1. Initialize setting when the view loads up.
        
        timerInt = 20
        scoreInt = 0
        
        self.timerLabel.text = String(timerInt)
        self.scoreLabel.text = String(scoreInt)
        
        self.snapButton.enabled = false // snap button is disabled to prevent the user from hitting the button.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func startGame(sender: AnyObject) {
        
        if timerInt == 20 { // 2. This game can only start when the timer is set to 20.
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timerUpdate", userInfo: nil, repeats: true)
            
            self.startGameButton.enabled = false // 5. Now that the game has started, start button must be disabled.
            self.snapButton.enabled = true // 6. on the contrary, snap button must be enabled so that the user can play the game.
        }
        
        if timerInt == 0 { // 11. When the game has ended, reset the score and the timer.
            
            scoreInt = 0
            timerInt = 20
            
            self.timerLabel.text = String(timerInt)
            self.scoreLabel.text = String(scoreInt)
            
            // 13. As all the values have been initialized, change the button name from Restart to Start.
            self.startGameButton.setTitle("Start", forState: .Normal) // String? is an explicit optonal, but ! was not used. Why? Because the value was given explicitly("Start"). So there was no value to be unwrapped.
        }
    }
    
    func timerUpdate() { // 3. The timer calls this function every second.
        timerInt -= 1
        self.timerLabel.text = String(timerInt)
        
        let firstRandomNum = arc4random_uniform(6) // 5. 6 means numbers starting from 0 to 5
        
        switch (firstRandomNum) {
            
        case 0:
            self.imageView1.image = UIImage(named: "Car1.jpg")
            break
        case 1:
            self.imageView1.image = UIImage(named: "Car2.jpg")
            break
        case 2:
            self.imageView1.image = UIImage(named: "Car3.jpg")
            break
        case 3:
            self.imageView1.image = UIImage(named: "Car4.jpg")
            break
        case 4:
            self.imageView1.image = UIImage(named: "Car5.jpg")
            break
        case 5:
            self.imageView1.image = UIImage(named: "Car6.jpg")
            break
        default: break
        }
        
        let secondRandomNum = arc4random_uniform(6) // 6 means numbers starting from 0 to 5
        
        switch (secondRandomNum) {
            
        case 0:
            self.imageView2.image = UIImage(named: "Car1.jpg")
            break
        case 1:
            self.imageView2.image = UIImage(named: "Car2.jpg")
            break
        case 2:
            self.imageView2.image = UIImage(named: "Car3.jpg")
            break
        case 3:
            self.imageView2.image = UIImage(named: "Car4.jpg")
            break
        case 4:
            self.imageView2.image = UIImage(named: "Car5.jpg")
            break
        case 5:
            self.imageView2.image = UIImage(named: "Car6.jpg")
            break
        default: break
        }
        
        if timerInt == 0 {
            timer.invalidate() // 4. the timer must stop when it reaches 0.
            
            // 7. When the game ends 
            self.startGameButton.enabled = true
            self.snapButton.enabled = false
            
            // 12. Change the button name after the first game. 
            self.startGameButton.setTitle("Restart", forState: .Normal)
            
        }
        
    }
    
    
    @IBAction func snap(sender: AnyObject) {
        
        // 8. The user must press snap button when two images are the same.
        
        if self.imageView1.image == self.imageView2.image {
            
            // 9. Whenever the user hits the snap button, he gets 1 point
            scoreInt += 1
            self.scoreLabel.text = String(scoreInt)
        } else {
            
            // 10. If the user hits the snap button when the two images are not identifical, he loses 1 point.
            scoreInt -= 1
            self.scoreLabel.text = String(scoreInt)
        }
    }
    

}

