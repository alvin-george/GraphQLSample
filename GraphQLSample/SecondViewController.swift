//
//  SecondViewController.swift
//  GraphQLSample
//
//  Created by apple on 18/07/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import Apollo

class SecondViewController: UIViewController {
    
    var serverToken:String?
    var currentUsedId:String?
    
    var apolloWithToken:ApolloClient?

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileDetailsTextView: UITextView!
    
    @IBOutlet weak var fetchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tokenString = "Bearer " +  serverToken!
        
        apolloWithToken = {
            let configuration = URLSessionConfiguration.default
            
            configuration.httpAdditionalHeaders = ["Authorization": tokenString]
            
            let url = URL(string: graphQLEndPoint)!
            
            print("new url : \(url)")
            
            return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
        }()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func fetchStudentProfileDetails(){
        
        let tokenString = "Bearer " +  serverToken!
        
        print(tokenString)

        let newApollo: ApolloClient = {
            let configuration = URLSessionConfiguration.default
            // Add additional headers as needed
            configuration.httpAdditionalHeaders = ["Authorization": tokenString]
            
            let url = URL(string: "http://52.88.217.19/graphql")!
            
            return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
        }()
        
        newApollo.cacheKeyForObject = { $0[self.currentUsedId!] }
        
        
        newApollo.fetch(query: StudentProfileQuery()) { (result, error) in
            
            self.profileDetailsTextView.text =  "Success"
            
            
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
    @IBAction func fetchProfileClicked(_ sender: Any) {
        
        self.fetchStudentProfileDetails()
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
