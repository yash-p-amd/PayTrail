//
//  LoginSignup.swift
//  PayTrail
//
//  Created by Yash Patel on 2018-02-14.
//  Copyright © 2018 Yash Patel. All rights reserved.
//

import UIKit

class LoginSignup: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        
        LiveTaxRates.sharedInstance.fetchListInfo(onSuccess: onSuccessScenario, onFail: onFailScenario)

        
    }
    
    private func onSuccessScenario() {
        DispatchQueue.main.async {
            //self.collectionView.reloadData()
        }
    }
    
    private func onFailScenario(errorMessage: String) {
        print(errorMessage)
    }
 
}
