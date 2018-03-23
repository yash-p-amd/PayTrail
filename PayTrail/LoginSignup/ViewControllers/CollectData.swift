//
//  CollectData.swift
//  PayTrail
//
//  Created by Yash Patel on 2018-02-14.
//  Copyright © 2018 Yash Patel. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField

class CollectData: UIViewController {
    
    var weekOptions = ["Weekly", "Bi-weekly"]

    var pickerView = UIPickerView()

    var checkBool = Bool()

    @IBOutlet weak var textFieldView: UIView!
    
    @IBOutlet weak var tempTax: UIButton!
    
    @IBOutlet weak var overttimehoursleading: NSLayoutConstraint!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //self.view.endEditing(false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.selectRow(0, inComponent: 0, animated: false)
        getWeeks.inputView = pickerView
        getWeeks.text = weekOptions[pickerView.selectedRow(inComponent: 0)]
        getWeeks.allowsEditingTextAttributes = false
        getRegularHours.becomeFirstResponder()


        //Configure Animation Properties
        getOvertimeHours.transform = CGAffineTransform(translationX: -getOvertimeHours.frame.width, y: 0)
        getStateHolidays.transform = CGAffineTransform(translationX: -getStateHolidays.frame.width, y: 0)
        getSickHours.transform = CGAffineTransform(translationX: -getSickHours.frame.width, y: 0)
        
        textFieldView.layoutIfNeeded()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        
        if self.isBeingPresented || self.isMovingToParentViewController {
            // Perform an action that will only be done once
            
        }

 

        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        


        
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height

            buttonProcessDataUI.frame.size.height = keyboardHeight / 5
            buttonProcessDataUI.frame.size.width = view.frame.width
            buttonProcessDataUI.frame.origin = CGPoint(x: 0, y: (view.frame.height - keyboardHeight) - buttonProcessDataUI.frame.height)
            
        }
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
    @IBOutlet weak var buttonProcessDataUI: UIButton!
    
    @IBOutlet weak var switchOvertimeHoursUI: UISwitch!
    @IBOutlet weak var switchStateHolidaysUI: UISwitch!
    @IBOutlet weak var switchSickHoursUI: UISwitch!
    
    
    
    @IBAction func switchOvertimeHours(_ sender: UISwitch) {
        
        getOvertimeHours.isEnabled = sender.isOn
        if sender.isOn == false
        {
            getOvertimeHours.text = ""
            getRegularHours.becomeFirstResponder()
            animateTextFields(getTextFields: getOvertimeHours, out: true)
        }
        else
        {
            getOvertimeHours.becomeFirstResponder()
            animateTextFields(getTextFields: getOvertimeHours, out: false)
        }
    }
    
    @IBAction func switchStateHolidays(_ sender: UISwitch) {
        
        getStateHolidays.isEnabled = sender.isOn
        if sender.isOn == false
        {
            getStateHolidays.text = ""
            getRegularHours.becomeFirstResponder()
            animateTextFields(getTextFields: getStateHolidays, out: true)
        }
        else
        {
            getStateHolidays.becomeFirstResponder()
            animateTextFields(getTextFields: getStateHolidays, out: false)
        }
    }
    
    @IBAction func switchSickHours(_ sender: UISwitch) {
        
        getSickHours.isEnabled = sender.isOn
        if sender.isOn == false
        {
            getSickHours.text = ""
            getRegularHours.becomeFirstResponder()
            animateTextFields(getTextFields: getSickHours, out: true)
        }
        else
        {
            getSickHours.becomeFirstResponder()
            animateTextFields(getTextFields: getSickHours, out: false)
        }
    }
    
    func animateTextFields(getTextFields:UITextField, out:Bool)
    {
        if out
        {
            UIView.animate(withDuration: 0.3, delay: 0.0,
                           options: [.curveEaseInOut],
                           animations: {
                            getTextFields.center.x  -= self.textFieldView.bounds.width
            },
                           completion: nil
            )
        }
        else
        {
            UIView.animate(withDuration: 0.3, delay: 0.0,
                           options: [.curveEaseInOut],
                           animations: {
                            getTextFields.center.x  += self.textFieldView.bounds.width
            },
                           completion: nil
            )
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
        //textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        //textField.resignFirstResponder()
        
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

