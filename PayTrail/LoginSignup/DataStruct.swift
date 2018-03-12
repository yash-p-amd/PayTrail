//
//  DataStruct.swift
//  PayTrail
//
//  Created by Yash Patel on 2018-03-05.
//  Copyright © 2018 Yash Patel. All rights reserved.
//

import Foundation

struct DataStruct
{
    var temp = String()
    

    //Setter
    mutating func setMeth(tempvarr:String)
    {
        temp = tempvarr
        
        
    }
    
    func getMeth() -> String
    {
        return temp
    }
    
}
