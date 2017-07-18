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
    @IBOutlet weak var moveToProfileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
 
        disableMoveToProfileButton()
    }
    func disableMoveToProfileButton(){
        moveToProfileButton.isEnabled =  false
        moveToProfileButton.alpha = 0.3
    }
    func enableMoveToProfileButton(){
        moveToProfileButton.isEnabled =  true
        moveToProfileButton.alpha = 1.0
    }
    
   
    @IBAction func actionSignUp(_ sender: Any) {
        
        //query is like http- get  and mutation is like http-post
        
        let timeStamp = ""
        
        let signUpMutation = UserSignupMutation(fullName: (fullname.trimString()), emailId: (email.trimString()), mobileNumber: (mobile.trimString()), civilId: (civilId.trimString()), password: (password.trimString()), address: (address.trimString()), city: (city.trimString()), state: (state.trimString()), country: (country.trimString()), zipCode: (zipcode.trimString()), timeStamp: timeStamp, userCategory: "parent")
     
        
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
        
        let loginMutation = UserLoginMutation(civilId: "student123", password: "student123")
        
        apollo.perform(mutation: loginMutation) {  [weak self] result, error in
            DispatchQueue.main.async(execute: {() -> Void in
                
                print("Result :\(result)")
                
                let fullname = result?.data?.userLogin?.fullName
                
                self?.enableMoveToProfileButton()
                
                //here is the result
                self?.responseTextView.text = String(describing: result?.data?.userLogin)
                
                if let error = error {
                    print(error.localizedDescription)
                    self?.responseTextView.text = String(describing: error)
                    
                    return
                }
                
            })
            
        }

        
    }
    
    @IBAction func moveToProfileButtonClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "segueToSecondViewController", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

