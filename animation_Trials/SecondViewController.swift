//
//  SecondViewController.swift
//  animation_Trials
//
//  Created by Aleyna  Ceylan on 10/10/21.
//

import UIKit

class SecondViewController: UIViewController {

    // Labels defined.
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    // Images defined.
    @IBOutlet weak var eric1: UIImageView!
    @IBOutlet weak var eric2: UIImageView!
    @IBOutlet weak var eric3: UIImageView!
    @IBOutlet weak var eric4: UIImageView!
    @IBOutlet weak var eric5: UIImageView!
    @IBOutlet weak var eric6: UIImageView!
    @IBOutlet weak var eric7: UIImageView!
    @IBOutlet weak var eric8: UIImageView!
    @IBOutlet weak var eric9: UIImageView!
    
    // trackScore variable is defined to count the score.
    var trackScore = 0
    var highScore = 0
    
    // onPageTimer is created to limit elapsed time of each game.
    var onPageTimer = Timer()
    var counter = 0
    var hideTimer = Timer()
    
    // ericArray is created to do disappearing animation.
    var ericArray = [UIImageView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The current trackScore value will be displayed as a score value.
        scoreLabel.text = "Score: \(trackScore)"
        
        let savedScore = UserDefaults.standard.object(forKey: "highScore")
        
        if savedScore == nil{
            highScore = 0
            highScoreLabel.text = "HighScore: \(highScore)"
        } else {
            highScore = savedScore as! Int
            highScoreLabel.text = "HighScore: \(highScore)"

        }
        
        // Images became responsive for user's interaction.
        eric1.isUserInteractionEnabled = true
        eric2.isUserInteractionEnabled = true
        eric3.isUserInteractionEnabled = true
        eric4.isUserInteractionEnabled = true
        eric5.isUserInteractionEnabled = true
        eric6.isUserInteractionEnabled = true
        eric7.isUserInteractionEnabled = true
        eric8.isUserInteractionEnabled = true
        eric9.isUserInteractionEnabled = true
        
        ericArray = [eric1, eric2, eric3, eric4, eric5, eric6, eric7, eric8, eric9]
        
        // UITapGestureRecognizer is added to add action on each click on images.
        let record1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let record2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let record3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let record4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let record5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let record6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let record7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let record8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let record9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        // addGestureRecognizer is added to recognize user's clicks on images.
        eric1.addGestureRecognizer(record1)
        eric2.addGestureRecognizer(record2)
        eric3.addGestureRecognizer(record3)
        eric4.addGestureRecognizer(record4)
        eric5.addGestureRecognizer(record5)
        eric6.addGestureRecognizer(record6)
        eric7.addGestureRecognizer(record7)
        eric8.addGestureRecognizer(record8)
        eric9.addGestureRecognizer(record9)
        
        // Timer operations.
        counter = 10
        timerLabel.text = String(counter)
        onPageTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(hideEric), userInfo: nil, repeats: true)
        
        // calling hideEric function.
        hideEric()
    }
    
    // increaseScore finction is created to increase score vlaue after each user action on images.
    @objc func increaseScore(){
        trackScore += 1
        scoreLabel.text = "Score: \(trackScore)"
    }
    //HighScore Operations - Add a new highscore value.

    
    
    
    // Alert Operations
    @objc func countDown(){
        counter -= 1
        timerLabel.text = "\(counter)"
        
        if counter == 0{
            if self.trackScore > self.highScore {
                self.highScore = self.trackScore
                highScoreLabel.text = "HighScore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highScore")
            }
            onPageTimer.invalidate()
            hideTimer.invalidate()
            
            let alertMessage = UIAlertController(title: "Time is Up", message: "Do you wanna play again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) {
                (UIAlertAction) in
                
                self.trackScore = 0
                self.scoreLabel.text = "Score: \(self.trackScore)"
                self.counter = 10
                self.timerLabel.text = "\(self.counter)"
                
                self.onPageTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(self.hideEric), userInfo: nil, repeats: true)
            }
            
            alertMessage.addAction(okButton)
            alertMessage.addAction(replayButton)
            self.present(alertMessage, animated: true, completion: nil)
        }
            
    }
    
    @objc func hideEric(){
        
        for eric in ericArray{
            eric.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(ericArray.count-1)))
        ericArray[random].isHidden = false
    }
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


