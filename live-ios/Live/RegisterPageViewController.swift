//
//  RegisterPageViewController.swift
//  Live
//
//  Created by 尔特 夏 on 12/20/16.
//  Copyright © 2016 io.ltebean. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let userPassword = userPasswordTextField.text;
        let userEmail = userEmailTextField.text;
        let userRepeatedPassword = repeatPasswordTextField.text;
        
        //Check for empty fields
        if((userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (userRepeatedPassword?.isEmpty)!){
            //Disp alert message
            return;        
        }
        
        
        // Store data
        
        // Dispaly alert message with confirmation
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
