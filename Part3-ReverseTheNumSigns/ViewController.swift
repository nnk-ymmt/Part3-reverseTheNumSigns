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



// 改善点

// カンマを追加する仕様変更があった場合、1000,2000を入力するとanswerLabelの数値がおかしくなる
// 数値は早い段階で数値として保持し、それをベースに変換していく
//if switch1.isOn {
//    label1.text = String.localizedStringWithFormat("%d", -num1)
//} else {
//    label1.text = String.localizedStringWithFormat("%d", num1)
//}
//if switch2.isOn {
//    label2.text = String.localizedStringWithFormat("%d", -num2)
//} else {
//    label2.text = String.localizedStringWithFormat("%d", num2)
//}

// 解答例(方法1推奨)

// 方法1
//let minus1: Int
//if switch1.isOn {
//    minus1 = -num1
//} else {
//    minus1 = num1
//}
//
//let minus2: Int
//if switch2.isOn {
//    minus2 = -num2
//} else {
//    minus2 = num2
//}
//
//let result = minus1 + minus2
//
//label1.text = "\(minus1)"
//label2.text = "\(minus2)"
//answerLabel.text = "\(result)"

// 方法2
//let minusArray = [(textField1, switch1), (textField2, switch2)].map { tf, sw in
//    (Int(tf.text ?? "") ?? 0) * (sw.isOn ? -1 : 1)
//}
//
//label1.text = "\(minusArray[0])"
//label2.text = "\(minusArray[1])"
//answerLabel.text = "\(minusArray.reduce(0, +))"

// 方法2'
// この場合textFieldではなくUserDefaultsに仕様変更する場合、1行目だけを変更すれば良い
//let numbers: [Int] = [textField1, textField2].map { Int($0.text ?? "") ?? 0 }
//let signs: [Int] = [switch1, switch2].map { $0.isOn ? -1 : 1 }
//let result: Int = zip(numbers, signs).map { $0.0 * $0.1 }.reduce(0, +)

// 方法3
//let input1: Int = Int(textField1.text ?? "") ?? 0
//let number1: Int
//if switch1.isOn {
//    number1 = input1 * -1
//} else {
//    number1 = input1
//}
//label1.text = String(number1)
//
//let input2: Int = Int(textField2.text ?? "") ?? 0
//let number2: Int
//if switch2.isOn {
//    number2 = input2 * -1
//} else {
//    number2 = input2
//}
//label2.text = String(number2)
//
//answerLabel.text = String(number1 + number2)

// 方法4
//let input1: Int = Int(textField1.text ?? "") ?? 0
//let number1: Int = switch1.isOn ? input1 * -1 : input1
//label1.text = String(number1)
//
//let input2: Int = Int(textField2.text ?? "") ?? 0
//let number2: Int = switch2.isOn ? input2 * -1 : input2
//label2.text = String(number2)
//
//answerLabel1.text = String(number1 + number2)

// 方法5
//@IBAction private func pushCalcButton(_ sender: Any) {
//    let numberWithSign1 = numberWithSign(textField: textField1, signSwitch: switch1)
//    textField1.text = String(numberWithSign1)
//    let numberWithSign2 = numberWithSign(textField: textField2, signSwitch: switch2)
//    textField2.text = String(numberWithSign2)
//    answerLabel.text = String(numberWithSign1 + numberWithSign2)
//}
//
//private func numberWithSign(textField: UITextField, signSwitch: UISwitch) -> Int {
//    let input: Int = Int(textField.text ?? "") ?? 0
//    if signSwitch.isOn {
//        return input * -1
//    } else {
//        return input
//    }
//}
