//
//  DisplayData.swift
//  PayTrail
//
//  Created by Yash Patel on 2018-02-26.
//  Copyright © 2018 Yash Patel. All rights reserved.
//

import UIKit

class DisplayData: UITableViewController {

    
    var titlesForSection = ["Work Details","Salary Details"]
    public var calculatedData: ProcessData? = nil

    
    @IBOutlet var dataTable: UITableView!
    

    
    var SalaryDetailsDict =
        [   ["title":"Wage","data":"data","color":"green"],
            ["title":"Overtime Wage","data":"data","key":"OVERTIME_WAGE","color":"green"],
            ["title":"State Holiday Wage","data":"data","key":"STATE_HOLIDAY_WAGE","color":"green"],
            ["title":"E/S Wage","data":"data","key":"STATE_HOLIDAY_WAGE","color":"green"],
            ["title":"Vacation Pay","data":"data","key":"VACATION_PAY","color":"green"],
            ["title":"Gross Income","data":"data","key":"GROSS_INCOME","color":"green"],
            ["title":"CPP (Pension Plan)","data":"data","key":"CPP","color":"red"],
            ["title":"Employement Insurance","data":"data","key":"EMPLOYEMENT_INSURANCE","color":"red"],
            ["title":"Tax","data":"data","key":"DISPLAY_TOTAL_TAX","color":"red"],
            ["title":"     Federal Tax","data":"data","key":"FEDERAL_TAX","color":"grayred"],
            ["title":"     Provisional Tax","data":"data","key":"PROVISIONAL_TAX","color":"grayred"],
            ["title":"Total Deduction","data":"data","key":"TOTAL_DEDUCTION","color":"red"],
            ["title":"Net Amount","data":"data","key":"NET_AMOUNT","color":"green"],
            ["title":"Year Income","data":"data","key":"DISPLAY_YEAR_INCOME","color":"no"] ]

    

    var WorkDetailsDict =
        [   ["title":"Regular Hours","data":"data","key":"REGULAR_HOURS"],
            ["title":"Rate","data":"data","key":"RATE"],
            ["title":"Overtime Hours","data":"data","key":"OVERTIME_HOURS"],
            ["title":"State Hours","data":"data","key":"STATE_HOURS"],
            ["title":"E/S Hours","data":"data","key":"ES_HOURS"] ]
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        

      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        WorkDetailsDict[0]["data"] = String(calculatedData!.REGULAR_HOURS)
        WorkDetailsDict[1]["data"] = String(calculatedData!.RATE)
        WorkDetailsDict[2]["data"] = String(calculatedData!.OVERTIME_HOURS)
        WorkDetailsDict[3]["data"] = String(calculatedData!.STATE_HOLIDAY_HOURS)
        WorkDetailsDict[4]["data"] = String(calculatedData!.SICK_HOURS)
        

        SalaryDetailsDict[0]["data"] = String(calculatedData!.DISPLAY_WAGE)
        SalaryDetailsDict[1]["data"] = String(calculatedData!.OVERTIME_WAGE)
        SalaryDetailsDict[2]["data"] = String(calculatedData!.STATE_HOLIDAY_WAGE)
        SalaryDetailsDict[3]["data"] = String(calculatedData!.SICK_WAGE)
        SalaryDetailsDict[4]["data"] = String(calculatedData!.VACATION_PAY)
        SalaryDetailsDict[5]["data"] = String(calculatedData!.GROSS_INCOME)
        SalaryDetailsDict[6]["data"] = String(calculatedData!.CPP)
        SalaryDetailsDict[7]["data"] = String(calculatedData!.EMPLOYEMENT_INSURANCE)
        SalaryDetailsDict[8]["data"] = String(calculatedData!.DISPLAY_TOTAL_TAX)
        SalaryDetailsDict[9]["data"] = String(calculatedData!.FEDERAL_TAX)
        SalaryDetailsDict[10]["data"] = String(calculatedData!.PROVISIONAL_TAX)
        SalaryDetailsDict[11]["data"] = String(calculatedData!.TOTAL_DEDUCTION)
        SalaryDetailsDict[12]["data"] = String(calculatedData!.NET_AMOUNT)
        SalaryDetailsDict[13]["data"] = String(calculatedData!.DISPLAY_YEAR_INCOME)
        
        
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0
        {
            return WorkDetailsDict.count
        }
        else if section == 1
        {
            return SalaryDetailsDict.count
        }
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titlesForSection[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:DisplayDataCell = self.tableView.dequeueReusableCell(withIdentifier: "DisplayDataCellIden", for: indexPath) as! DisplayDataCell


        if indexPath.section == 0
        {
            cell.title.text = WorkDetailsDict[indexPath.row]["title"]
            cell.data.text = WorkDetailsDict[indexPath.row]["data"]
        }
        else
        {
            cell.title.text = SalaryDetailsDict[indexPath.row]["title"]
            cell.data.text = String(SalaryDetailsDict[indexPath.row]["data"]! + " $")
        }
        
        if indexPath.section == 1 {
            
            if SalaryDetailsDict[indexPath.row]["color"] == "green" {
                cell.data.textColor = UIColor(red:0.27, green:0.62, blue:0.26, alpha:1.0)
            }
            else if SalaryDetailsDict[indexPath.row]["color"] == "red" {
                cell.data.textColor = UIColor.red
            }
            else if SalaryDetailsDict[indexPath.row]["color"] == "grayred" {
                cell.title.textColor = UIColor.gray
                cell.data.textColor = UIColor(red:1.00, green:0.26, blue:0.26, alpha:1.0)
            }
            
            
        }
        
        
        
//        if indexPath.section == 1
//        {
//            if (indexPath.row >= 6 && indexPath.row <= 10 )
//            {
//                cell.data.textColor = UIColor.red
//
//
//                if (indexPath.row == 9 || indexPath.row == 10)
//                {
//                    cell.title.textColor = UIColor.gray
//                    cell.data.textColor = UIColor(red:1.00, green:0.26, blue:0.26, alpha:1.0)
//
////                    cell.title.font = UIFont.systemFont(ofSize: cell.title.font.pointSize - 1)
////                    cell.data.font = UIFont.systemFont(ofSize: cell.title.font.pointSize - 1)
//                    cell.title.font = UIFont.systemFont(ofSize: 15)
//                    cell.data.font = UIFont.systemFont(ofSize: 15)
//                    //cell.title.font = cell.title.font.pointSize - 10
//
//                }
//            }
//            else if (indexPath.row >= 0 && indexPath.row <= 5 || indexPath.row == 11)
//            {
//                cell.data.textColor = UIColor(red:0.27, green:0.62, blue:0.26, alpha:1.0)
//
//                //For UICOLOR code
//                //http://uicolor.xyz/#/rgb-to-ui
//
//            }
//
//        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }

}


