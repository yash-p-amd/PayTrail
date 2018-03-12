//
//  CollectData.swift
//  PayTrail
//
//  Created by Yash Patel on 2018-02-14.
//  Copyright © 2018 Yash Patel. All rights reserved.
//

import UIKit

class CollectData: UIViewController {
    
    var weekOptions = ["Weekly", "Bi-weekly"]

    var pickerView = UIPickerView()

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.selectRow(0, inComponent: 0, animated: false)
        getWeeks.inputView = pickerView
        getWeeks.text = weekOptions[pickerView.selectedRow(inComponent: 0)]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    @IBOutlet weak var getRegularHours: UITextField!
    @IBOutlet weak var getHourRate: UITextField!
    @IBOutlet weak var getOvertimeHours: UITextField!
    @IBOutlet weak var getStateHolidays: UITextField!
    @IBOutlet weak var getSickHours: UITextField!
    @IBOutlet weak var getWeeks: UITextField!
    

    
    
    @IBAction func switchOvertimeHours(_ sender: UISwitch) {
        
        getOvertimeHours.isEnabled = sender.isOn
        if sender.isOn == false
        {
            getOvertimeHours.text = ""
        }
        
    }
    
    @IBAction func switchStateHolidays(_ sender: UISwitch) {
        
        getStateHolidays.isEnabled = sender.isOn
        if sender.isOn == false
        {
            getStateHolidays.text = ""
        }
    }
    
    @IBAction func switchSickHours(_ sender: UISwitch) {
        
        getSickHours.isEnabled = sender.isOn
        if sender.isOn == false
        {
            getSickHours.text = ""
        }
    }
    
    @IBAction func buttonProcessData(_ sender: UIButton) {
        
        var weeks = Double()
        if pickerView.selectedRow(inComponent: 0) == 0
        {
            weeks = 52
        }
        else
        {
            weeks = 26
        }

        let holdProcessedData = ProcessData(getRegularHours: NSString(string: self.getRegularHours.text!).doubleValue, getHourRate: NSString(string: self.getHourRate.text!).doubleValue, getOvertimeHours: NSString(string: self.getOvertimeHours.text!).doubleValue, getStateHolidays: NSString(string: self.getStateHolidays.text!).doubleValue, getSickHours: NSString(string: self.getSickHours.text!).doubleValue, getWeeks: weeks)

        
        let DisplayData: DisplayData = storyboard?.instantiateViewController(withIdentifier: "DisplayDataID") as! DisplayData
        DisplayData.calculatedData = holdProcessedData
        self.navigationController?.pushViewController(DisplayData, animated: true)
        
    }
}

extension CollectData:UITextFieldDelegate
{
    public func textFieldDidBeginEditing(_ textField: UITextField) // became first responder
    {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        textField.resignFirstResponder()
        
    }

    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        
        if textField == getRegularHours || textField == getHourRate || textField == getOvertimeHours || textField == getStateHolidays || textField == getSickHours
        {
            let countdots = (textField.text?.components(separatedBy: ".").count)! - 1
            if countdots > 0 && string == "."
            {
                return false
            }
            if string != ""
            {
                let name_reg = "[0.0-9.0]"
                let name_test = NSPredicate(format: "SELF MATCHES %@", name_reg)
                if name_test.evaluate(with: string) == false
                {
                    return false
                }
                else
                {
                    return true
                }
            }
            else
            {
                return true
            }
        }
        return false
    }
    
}

extension CollectData : UIPickerViewDataSource, UIPickerViewDelegate
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weekOptions.count
    }

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return weekOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        getWeeks.text = weekOptions[row]
    }

}

