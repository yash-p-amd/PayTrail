//
//  LiveTaxRates.swift
//  PayTrail
//
//  Created by Yash Patel on 2018-03-14.
//  Copyright © 2018 Yash Patel. All rights reserved.
//

import UIKit
import SwiftyJSON
import SystemConfiguration


typealias SuccessScenario = () -> Void
typealias FailScenario = (String) -> Void

class LiveTaxRates: NSObject {

    
    private let url: String = "https://randomuser.me/api/?results=30&seed=alfredo&nat=us,ca,br"
    public static let sharedInstance = LiveTaxRates()

    
    override init() {

        //fetchListInfo(onSuccess: onSuccessScenario, onFail: onFailScenario)
    
    }
    

    
    func fetchListInfo(onSuccess: @escaping SuccessScenario, onFail: @escaping FailScenario) {
        
        guard let urlRequest = URL(string: url) else {
            onFail("Not possible to create the URL object")
            return
        }
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            if let error = error {
                onFail(error.localizedDescription)
            } else {
                guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200
                    else {
                        onFail("Error on fetch.")
                        return
                }
                
                if let data = data {
                    //self.list = try! self.convertToUsers(withData: data)
                    try! self.convertToUsers(withData: data)
                    onSuccess()
                } else {
                    onFail("Data is null")
                }
            }
        })
        
        task.resume()
    }
    
    private func convertToUsers(withData ddata: Data) throws -> [PersonZip] {
        
        var tempList = [PersonZip]()
        
        
        let newJson = try JSON(data: ddata)
        
        print(newJson["results"][0]["email"])
        
        if let userName = newJson["results"][0]["email"].string
        {
            print(userName)
        }
        else
        {
            print(newJson["results"]["email"])
        }
        
        print(newJson["results"].count)
        
        for newJsonAgain in newJson["results"]
        {
            print(newJsonAgain.1["email"])
        }
        
        
        
//        let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
//        if let results = json["results"] as? [[String:Any]]{
//            for jsonPerson in results {
//                guard let email = jsonPerson["email"] as? String,
//                    let names = jsonPerson["name"] as? [String:Any],
//                    let firstName = names["first"] as? String,
//                    let lastName = names["last"] as? String,
//                    let locations = jsonPerson["location"] as? [String: Any],
//                    let street = locations["street"] as? String,
//                    let city = locations["city"] as? String,
//                    let state = locations["state"] as? String,
//                    let postcode = locations["postcode"] as? Int,
//                    let cell = jsonPerson["cell"] as? String,
//                    let pictures = jsonPerson["picture"] as? [String: Any],
//                    let imageLarge = pictures["large"] as? String
//                    else {
//                        print("Not possible to find the email and first name.")
//                        break
//                }
//
//                tempList.append(PersonZip(firstName: firstName, lastName: lastName, street: street, city: city, state: state, postcode: postcode, email: email, cell: cell, pictureUrl: imageLarge))            }
//        } else {
//            print("No results tag found in response JSON.")
//        }
        
        return tempList
    }
    
}
