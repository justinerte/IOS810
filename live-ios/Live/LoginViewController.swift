//
//  LoginViewController.swift
//  Live
//
//  Created by 尔特 夏 on 12/21/16.
//  Copyright © 2016 io.ltebean. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;

        let myurl = URL(string: "\(Config.serverUrl)/login")
        var request = URLRequest(url: myurl!)
        request.httpMethod = "POST"
        let postString = "email=\(userEmail)&password=\(userPassword)"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request){
            (data, response, error) in
            guard error == nil else {
                print(error)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            
            //   print( String(data: data, encoding: String.Encoding.utf8))
            
            let json = try! JSONSerialization.jsonObject(with: data, options: [JSONSerialization.ReadingOptions.allowFragments])
            
            var myjson = json as? [String: Any]
            
            var isUserLogined = false
            
            if let parseJSON = myjson {
                var resultStatus = parseJSON["status"] as! String
                print("resultStatus: \(resultStatus) \n")
                if resultStatus == "succ"{
                    isUserLogined = true
                    
                    var userinfo = parseJSON["data"] as! [String: String]
                    
                    User.currentUser.id = userinfo["_id"]!
                    User.currentUser.sessionid =  userinfo["session_id"]!
                    User.currentUser.email = userinfo["email"]!
                    User.currentUser.nickname = userinfo["nickname"]!
                    
                }
                print("msg: \(parseJSON["msg"]) \n");

                if(isUserLogined == true){
                    
                    DispatchQueue.main.async {
                        //self.displayMaAlertMessage(userMessage: messageToDisplay)
                        self.performSegue(withIdentifier: "NavigationControllerView", sender: self)
                    }
                 
                }

            }
            
            
        }
        task.resume()
        
        
        
//        let userEmailStored = UserDefaults.standard.string(forKey:"userEmail");
//        let userPasswordStord = UserDefaults.standard.string(forKey:"userPassword");
//        
//        if(userEmail == userEmailStored){
//            if(userPassword == userPasswordStord){
//                //login is successfull
//                UserDefaults.standard.set(true,forKey:"isUserLoggedIn");
//                UserDefaults.standard.synchronize();
//                self.dismiss(animated: true, completion: nil);
//            }
//        }
        
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
