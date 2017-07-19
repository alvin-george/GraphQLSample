//
//  SecondViewController.swift
//  GraphQLSample
//
//  Created by apple on 18/07/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import Apollo
import Alamofire

class SecondViewController: UIViewController {
    
    var serverToken:String?
    var currentUsedId:String?
    
    var apolloWithToken:ApolloClient?
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileDetailsTextView: UITextView!
    @IBOutlet weak var fetchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @IBAction func fetchProfileClicked(_ sender: Any) {
        
        let tokenString = "Bearer " + serverToken!
        
        let new_apollo: ApolloClient = {
            let configuration = URLSessionConfiguration.default
            // Add additional headers as needed
            
            let headers: HTTPHeaders = [
                "Authorization": tokenString,
                "Content-Type": "application/graphql"]
            
            configuration.httpAdditionalHeaders = headers
            configuration.requestCachePolicy = .reloadIgnoringCacheData
            
            let url = URL(string: "http://52.88.217.19/graphql")!
            
            return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
        }()
        
        new_apollo.cacheKeyForObject = { $0["id"] }
                
        new_apollo.fetch(query: StudentProfileQuery()) { (result, error) in
            
            if let error = error {
                NSLog("Error while fetching query: \(error.localizedDescription)");
                self.profileDetailsTextView.text =  error.localizedDescription
            }
            guard let result = result else {
                NSLog("No query result");
                self.profileDetailsTextView.text = "No query result"
                return
            }
            
            if let errors = result.errors {
                NSLog("Errors in query result: \(errors)")
                
                self.profileDetailsTextView.text =  String(describing: errors)
                
            }
            
            guard let data = result.data else {
                
                NSLog("No query result data");
                
                return
            }
            
            
        }
        
    }
    
    @IBAction func fetchUsingAlamofireButtonClicked(_ sender: Any) {
        
        
        let tokenString = "Bearer " + serverToken!
        
        let headers: HTTPHeaders = [
            "Authorization": tokenString,
            "Content-Type": "application/json"
        ]
        
        
        let paraDict:Dictionary = ["query":"{\n  me {\n    ... on Student {\n      profile {\n        fullName\n      }\n    }\n  }\n}\n"]
        
        Alamofire.request(graphQLEndPoint, method: HTTPMethod.post, parameters: paraDict,encoding: JSONEncoding.default, headers: headers).responseJSON {
            response in
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    print(response.result.value!)
                    self.profileDetailsTextView.text = String(describing: response.result.value)
                }
                break
                
            case .failure(_):
                print(response.result.error)
                self.profileDetailsTextView.text = response.result.error! as! String
                break
            }
            
            debugPrint(response)
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
