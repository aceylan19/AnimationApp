//
//  ViewController.swift
//  animation_Trials
//
//  Created by Aleyna  Ceylan on 10/5/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var startPageImage: UIImageView!
    @IBOutlet weak var gameButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func gameButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "to2ndPage", sender: nil)
    }
    
    
    @IBAction func settingsButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "to3rdPage", sender: nil)
    }
}

