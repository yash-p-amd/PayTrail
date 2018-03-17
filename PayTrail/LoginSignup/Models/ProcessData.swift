//
//  ProcessData.swift
//  PayTrail
//
//  Created by Yash Patel on 2018-02-15.
//  Copyright © 2018 Yash Patel. All rights reserved.
//

import Foundation
import UIKit

class ProcessData : NSObject
{
    //SalaryDetailsDict]
    public var WAGE = Double()
    public var REGULAR_WAGE = Double()
    public var OVERTIME_WAGE = Double()
    public var SICK_WAGE = Double()
    public var STATE_HOLIDAY_WAGE = Double()
    public var GROSS_INCOME = Double()
    public var CPP = Double()
    public var VACATION_PAY = Double()
    public var EMPLOYEMENT_INSURANCE = Double()
    public var FEDERAL_TAX = Double()
    public var PROVISIONAL_TAX = Double()
    public var TOTAL_DEDUCTION = Double()
    public var NET_AMOUNT = Double()
    
    //WorkDetailsDict
    public var REGULAR_HOURS = Double()
    public var RATE = Double()
    public var OVERTIME_HOURS = Double()
    public var STATE_HOLIDAY_HOURS = Double()
    public var SICK_HOURS = Double()
    public var WEEKS = Double()
    
    //ExtraVars
    public var YEAR_INCOME = Double()
    public var DISPLAY_WAGE = Double()
    public var DISPLAY_YEAR_INCOME = Double()
    public var DISPLAY_TOTAL_TAX = Double()

    init(getRegularHours:Double,getHourRate:Double,getOvertimeHours:Double,getStateHolidays:Double,getSickHours:Double,getWeeks:Double)
    {

        REGULAR_HOURS = getRegularHours
        RATE = getHourRate
        OVERTIME_HOURS = getOvertimeHours
        STATE_HOLIDAY_HOURS = getStateHolidays
        SICK_HOURS = getSickHours
        
        WEEKS = getWeeks

//        REGULAR_HOURS = 44.72
//        RATE = 14
//        OVERTIME_HOURS = 0
//        STATE_HOLIDAY_HOURS = 6.82
//        SICK_HOURS = 0
        

        
        REGULAR_WAGE = REGULAR_HOURS * RATE
        OVERTIME_WAGE = OVERTIME_HOURS * RATE * 1.5
        STATE_HOLIDAY_WAGE = STATE_HOLIDAY_HOURS * RATE
        SICK_WAGE = SICK_HOURS * RATE
        
        DISPLAY_WAGE = REGULAR_HOURS * RATE
        WAGE = REGULAR_WAGE + OVERTIME_WAGE + STATE_HOLIDAY_WAGE + SICK_WAGE
        VACATION_PAY = WAGE * 0.04
        
        GROSS_INCOME = WAGE + VACATION_PAY
        
//        let newGross = WAGE
        
        YEAR_INCOME = GROSS_INCOME * WEEKS
        
        CPP = (0.0495 * (YEAR_INCOME - 3500)) / WEEKS
        
        //Correct Var
        if CPP < 0.0
        {
            CPP = 0.0
        }
        
        EMPLOYEMENT_INSURANCE = (0.0166 * YEAR_INCOME)/WEEKS
        
        YEAR_INCOME = YEAR_INCOME - (VACATION_PAY * WEEKS)

        var R = Double()
        var K = Double()
        
        if YEAR_INCOME > 205842 {
            R = 33/100
            K = 20258
        }
        else if YEAR_INCOME > 144489
        {
            R = 29/100
            K = 12024
        }
        else if YEAR_INCOME > 93208
        {
            R = 26/100
            K = 7690
        }
        else if YEAR_INCOME > 46605
        {
            R = 20.5/100
            K = 2563
        }
        else if YEAR_INCOME > 0
        {
            R = 15/100
            K = 0
        }
        
        FEDERAL_TAX = (YEAR_INCOME * R) - K
        
        let personalTaxCredit = (11809 + (CPP * WEEKS) + (EMPLOYEMENT_INSURANCE * WEEKS) + 1195) * 0.15
        
        FEDERAL_TAX = (FEDERAL_TAX - personalTaxCredit) / WEEKS
        
        
        //Correct Var
        if FEDERAL_TAX < 0
        {
            FEDERAL_TAX = 0
        }
        
        
//        YEAR_INCOME = YEAR_INCOME + (VACATION_PAY * WEEKS)

        var V = Double()
        var KP = Double()
        
        if YEAR_INCOME > 220000
        {
            V = 13.16/100
            KP = 7188
        }
        else if YEAR_INCOME > 150000
        {
            V = 12.16/100
            KP = 4988
        }
        else if YEAR_INCOME > 85923
        {
            V = 11.16/100
            KP = 3488
        }
        else if YEAR_INCOME > 42960
        {
            V = 9.15/100
            KP = 1761
        }
        else if YEAR_INCOME > 0
        {
            V = 5.05/100
            KP = 0
        }
        
        PROVISIONAL_TAX = (YEAR_INCOME * V) - KP
        
        let personalTaxCreditNew = (10354 + (CPP * WEEKS) + (EMPLOYEMENT_INSURANCE * WEEKS)) * 0.0505
        
        PROVISIONAL_TAX = (PROVISIONAL_TAX - personalTaxCreditNew) / WEEKS
        
        //Correct Var
        if PROVISIONAL_TAX < 0
        {
            PROVISIONAL_TAX = 0
        }

        DISPLAY_TOTAL_TAX = PROVISIONAL_TAX + FEDERAL_TAX
        
        TOTAL_DEDUCTION = CPP + EMPLOYEMENT_INSURANCE + FEDERAL_TAX + PROVISIONAL_TAX
        NET_AMOUNT = GROSS_INCOME - TOTAL_DEDUCTION
        
        DISPLAY_YEAR_INCOME = NET_AMOUNT * 12
        
        
        
        let numberOfPoints:Double = 100
        
        
        
        
        //Decrease Points
        REGULAR_HOURS = Double(round(numberOfPoints * REGULAR_HOURS)/numberOfPoints)
        RATE = Double(round(numberOfPoints * RATE)/numberOfPoints)
        OVERTIME_HOURS = Double(round(numberOfPoints * OVERTIME_HOURS)/numberOfPoints)
        STATE_HOLIDAY_HOURS = Double(round(numberOfPoints * STATE_HOLIDAY_HOURS)/numberOfPoints)
        SICK_HOURS = Double(round(numberOfPoints * SICK_HOURS)/numberOfPoints)

        
        DISPLAY_WAGE = Double(round(numberOfPoints * DISPLAY_WAGE)/numberOfPoints)
        OVERTIME_WAGE = Double(round(numberOfPoints * OVERTIME_WAGE)/numberOfPoints)
        STATE_HOLIDAY_WAGE = Double(round(numberOfPoints * STATE_HOLIDAY_WAGE)/numberOfPoints)
        OVERTIME_WAGE = Double(round(numberOfPoints * OVERTIME_WAGE)/numberOfPoints)
        SICK_WAGE = Double(round(numberOfPoints * SICK_WAGE)/numberOfPoints)
        VACATION_PAY = Double(round(numberOfPoints * VACATION_PAY)/numberOfPoints)
        GROSS_INCOME = Double(round(numberOfPoints * GROSS_INCOME)/numberOfPoints)
        CPP = Double(round(numberOfPoints * CPP)/numberOfPoints)
        EMPLOYEMENT_INSURANCE = Double(round(numberOfPoints * EMPLOYEMENT_INSURANCE)/numberOfPoints)
        FEDERAL_TAX = Double(round(numberOfPoints * FEDERAL_TAX)/numberOfPoints)
        PROVISIONAL_TAX = Double(round(numberOfPoints * PROVISIONAL_TAX)/numberOfPoints)
        DISPLAY_TOTAL_TAX = Double(round(numberOfPoints * DISPLAY_TOTAL_TAX)/numberOfPoints)
        TOTAL_DEDUCTION = Double(round(numberOfPoints * TOTAL_DEDUCTION)/numberOfPoints)
        NET_AMOUNT = Double(round(numberOfPoints * NET_AMOUNT)/numberOfPoints)
     
        PROVISIONAL_TAX = Double(round(numberOfPoints * PROVISIONAL_TAX)/numberOfPoints)
        
        DISPLAY_YEAR_INCOME = Double(round(numberOfPoints * DISPLAY_YEAR_INCOME)/numberOfPoints)


    }
    
}
