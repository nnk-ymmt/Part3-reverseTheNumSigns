//
//  ViewController.swift
//  Part3-ReverseTheNumSigns
//
//  Created by 山本ののか on 2020/08/21.
//  Copyright © 2020 Nonoka Yamamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var textField1: UITextField!
    @IBOutlet private weak var textField2: UITextField!
    
    @IBOutlet private weak var switch1: UISwitch!
    @IBOutlet private weak var switch2: UISwitch!
    
    @IBOutlet private weak var plusButton: UIButton!
    
    @IBOutlet private weak var label1: UILabel!
    @IBOutlet private weak var label2: UILabel!
    
    @IBOutlet private weak var answerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBAction private func add(_ sender: Any) {
        
        guard let num1 = Int(textField1.text ?? ""),
            let num2 = Int(textField2.text ?? "") else { return }
        
        if switch1.isOn {
            label1.text = "-\(num1)"
        } else {
            label1.text = "\(num1)"
        }
        if switch2.isOn {
            label2.text = "-\(num2)"
        } else {
            label2.text = "\(num2)"
        }
        
        let sum = (Int(label1.text ?? "") ?? 0) + (Int(label2.text ?? "") ?? 0)
        answerLabel.text = "\(sum)"
    }
}

