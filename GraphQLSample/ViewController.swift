//
//  ViewController.swift
//  GraphQLSample
//
//  Created by apple on 27/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //hard coding parameters.
    var fullname = "User Name"
    var email = "sample@sample.com"
    var mobile = "720555555"
    var civilId = "037373"
    var password = "123"
    var address = "facebook office, 2nd street, USA"
    var city = "Palo Alto"
    var state = "California"
    var country = "United States of America"
    var zipcode = "1234"
    var timestamp = ""
    var usercategory = ""
    
    @IBOutlet var responseTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
   
    @IBAction func actionSignUp(_ sender: Any) {
        
        //query is like http- get  and mutation is like http-post
        
        let timeStamp = ""
        
        let signUpMutation = SignUpMutation(fullname: (fullname.trimString()), email: (email.trimString()), mobile: (mobile.trimString()), civilId: (civilId.trimString()), password: (password.trimString()), address: (address.trimString()), city: (city.trimString()), state: (state.trimString()), country: (country.trimString()), zipcode: (zipcode.trimString()), timestamp: timeStamp, usercategory: "parent")
     
        
        apollo.perform(mutation: signUpMutation) {  [weak self] result, error in
            DispatchQueue.main.async(execute: {() -> Void in
                
                print("Result :\(result)")
                
                let fullname = result?.data?.userSignup?.fullName
                
                
                
                //here is the result
                self?.responseTextView.text = String(describing: result?.data?.userSignup)
                
                if let error = error {
                    print(error.localizedDescription)
                    self?.responseTextView.text = String(describing: error)
                    
                    return
                }
                
                let token = result?.data?.userSignup?.token
                UserDefaults.standard.set(token, forKey: "token")
                
                print(token)
                
            })
            
        }
        
    }
    
    @IBAction func loginUserButtonClicked(_ sender: Any) {
        
        let loginMutation = LoginMutation(civilId: "student123", password: "student123")
        
        apollo.perform(mutation: loginMutation) {  [weak self] result, error in
            DispatchQueue.main.async(execute: {() -> Void in
                
                print("Result :\(result)")
                
                let fullname = result?.data?.userSignup?.fullName
                
                
                
                //here is the result
                self?.responseTextView.text = String(describing: result?.data?.userSignup)
                
                if let error = error {
                    print(error.localizedDescription)
                    self?.responseTextView.text = String(describing: error)
                    
                    return
                }
                
                let token = result?.data?.userSignup?.token
                UserDefaults.standard.set(token, forKey: "token")
                
                print(token)
                
            })
            
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

