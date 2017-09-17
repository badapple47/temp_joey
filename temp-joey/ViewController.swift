//
//  ViewController.swift
//  temp-joey
//
//  Created by Narat Suchartsunthorn on 9/13/17.
//  Copyright © 2017 Narat Suchartsunthorn. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let defaultManager: Alamofire.SessionManager = {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "10.34.250.12": .disableEvaluation
        ]

        
        return SessionManager(
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//
        let user = "dev"
        let password = "dev12345"
        

        
        var headers: HTTPHeaders = [:]
        
        if let authorizationHeader = Request.authorizationHeader(user: user, password: password) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        
        

        self.defaultManager.request("https://10.34.250.12/api/location/v2/clients/count", headers: headers).authenticate(user: user, password: password)

            .responseString { response in
                
                debugPrint(response)
                debugPrint(response.result)
                
//                            if let image = response.result.value {
//                                self.imageView.image = image
//
//                            }
                        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

