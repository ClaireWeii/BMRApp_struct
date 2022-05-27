//
//  ViewController.swift
//  BMRApp
//
//  Created by Wei Pan on 2022/5/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var exerciseTextField: UITextField!
    @IBOutlet weak var BMRLabel: UILabel!
    @IBOutlet weak var TDEELabel: UILabel!
    
    var amounts = [Amount]()
    var index = 0
    
    
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 設定活動量的個選項及數值
        let amount1 = Amount(description: "幾乎不運動", value: 1.2)
        amounts.append(amount1)
        let amount2 = Amount(description: "每週輕鬆的運動1-2天", value: 1.3)
        amounts.append(amount2)
        let amount3 = Amount(description: "每週中等強度的運動3-5天", value: 1.55)
        amounts.append(amount3)
        let amount4 = Amount(description: "每週高強度運動6-7天", value: 1.725)
        amounts.append(amount4)
        let amount5 = Amount(description: "勞力密集工作或每天訓練者", value: 1.9)
        amounts.append(amount5)
        

        // 設定 UIPickerView 的 delegate 及 dataSource
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // 將 UITextField 原先鍵盤的視圖更換成 UIPickerView
        exerciseTextField.inputView = pickerView
        // 設置 UITextField 預設的內容
        exerciseTextField.text = amounts[index].description
    }

    @IBAction func calculate(_ sender: Any) {
        let heightText = heightTextField.text!
        let weightText = weightTextField.text!
        let ageText = ageTextField.text!
        let height = Double(heightText)
        let weight = Double(weightText)
        let age = Double(ageText)
        if height != nil, weight != nil, age != nil {
            if genderSegmentedControl.selectedSegmentIndex == 0 {
                let BMR = 66.5 + (13.75*weight!) + (5.003*height!) - (6.755*age!)
                BMRLabel.text = String(format: "%.2f", BMR)
                //print(weight, height, age)
                if index == 0 {
                    let TDEE = BMR*amounts[0].value
                    TDEELabel.text = String(format: "%.2f", TDEE)
                }
                if index == 1{
                    let TDEE = BMR*amounts[1].value
                    TDEELabel.text = String(format: "%.2f", TDEE)
                }
                if index == 2{
                    let TDEE = BMR*amounts[2].value
                    TDEELabel.text = String(format: "%.2f", TDEE)
                }
                if index == 3{
                    let TDEE = BMR*amounts[3].value
                    TDEELabel.text = String(format: "%.2f", TDEE)
                }
                if index == 4{
                    let TDEE = BMR*amounts[4].value
                    TDEELabel.text = String(format: "%.2f", TDEE)
                }
            }else{
                let BMR = 655 + (9.563*weight!) + (1.850*height!) - (4.676*age!)
                BMRLabel.text = String(format: "%.2f", BMR)
                if index == 0 {
                    let TDEE = BMR*amounts[0].value
                    TDEELabel.text = String(format: "%.2f", TDEE)
                }
                if index == 1{
                    let TDEE = BMR*amounts[1].value
                    TDEELabel.text = String(format: "%.2f", TDEE)
                }
                if index == 2{
                    let TDEE = BMR*amounts[2].value
                    TDEELabel.text = String(format: "%.2f", TDEE)
                }
                if index == 3{
                    let TDEE = BMR*amounts[3].value
                    TDEELabel.text = String(format: "%.2f", TDEE)
                }
                if index == 4{
                    let TDEE = BMR*amounts[4].value
                    TDEELabel.text = String(format: "%.2f", TDEE)
                }
            }
            view.endEditing(true)
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        heightTextField.text = ""
        weightTextField.text = ""
        ageTextField.text = ""
        genderSegmentedControl.selectedSegmentIndex = 0
        exerciseTextField.text = amounts[0].description
        pickerView.selectRow(0, inComponent: 0, animated: true)
        BMRLabel.text = "0"
        TDEELabel.text = "0"
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // UIPickerView 有幾列可以選擇
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // UIPickerView 各列有多少行資料
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return amounts.count
    }
    // UIPickerView 每個選項顯示的資料
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return amounts[row].description
    }
    // UIPickerView 改變選擇後執行的動作
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        index = row
        exerciseTextField.text = amounts[row].description
        exerciseTextField.resignFirstResponder()
    }
}



