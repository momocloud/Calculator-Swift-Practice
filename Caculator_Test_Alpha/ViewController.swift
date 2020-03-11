//
//  ViewController.swift
//  Caculator_Test_Alpha
//
//  Created by 王鲲宇 on 2020/2/27.
//  Copyright © 2020 王鲲宇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var programCal = Cal()
    
    @IBOutlet weak var showLabel: UILabel!
    
    @IBOutlet var NumButton: [UIButton]!
    
    @IBOutlet var CalButton: [UIButton]!
    
    @IBAction func EquButtonAct(_ sender: UIButton) {
        if programCal.getNumOrCal(buttonIn: sender.currentTitle!) {
            showLabel.text = programCal.showString
            programCal.sum = 0
            programCal.showString = ""
        } else {
            showLabel.text = "请重新输入！"
            programCal.reInit()
        }
    }
    
    @IBAction func NumButtonAct(_ sender: UIButton) {
        programCal.showString.append(sender.currentTitle!)
        pushButton(errorString: "NumButtonAct ERROR!", sender)
    }
    
    @IBAction func CalButtonAct(_ sender: UIButton) {
        programCal.showString.append(sender.currentTitle!)
        pushButton(errorString: "CalButtonAct ERROR", sender)
    }
    
    func pushButton(errorString: String, _ sender: UIButton) {
        assert(programCal.getNumOrCal(buttonIn: sender.currentTitle!), errorString)
        showLabel.text = programCal.showString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

