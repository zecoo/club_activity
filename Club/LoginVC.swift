//
//  LoginVC.swift
//  Club
//
//  Created by 张泽锟 on 2017/7/13.
//  Copyright © 2017年 张泽锟. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        username.delegate = self
        password.delegate = self
        
        // Adjust the radius of Login buttons
        loginButton.layer.cornerRadius = 3.0
        loginButton.layer.masksToBounds = true
        signUpButton.layer.cornerRadius = 3.0
        signUpButton.layer.masksToBounds = true
        
        // Details about textfeild
        username.placeholder = "username"
        password.placeholder = "password"
        password.isSecureTextEntry = true
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        if username.text == "w" && password.text == "w"{
            self.performSegue(withIdentifier: "login", sender: self)
        }
        else {
            viewDidDisappear(true)
        }
    }
    @IBAction func singUpTapped(_ sender: Any) {
        test()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let alertController = UIAlertController(title: "Message", message: "Error Info", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Sign up", style: .default){
            (UIAlertAction) in
            self.test()
        }
        let okAction = UIAlertAction(title: "Retry", style: .default){
            (UIAlertAction) in
            self.retry()
        }

        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func retry(){
        username.text = ""
        password.text = ""
        password.isSecureTextEntry = true
    }
    
    func test(){
        let alertController = UIAlertController(title: "Sign Up", message: "Please enter username and password", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addTextField { (textField:UITextField) in
            textField.placeholder = "username"
        }
        alertController.addTextField { (textField:UITextField) in
            textField.placeholder = "password"
            textField.isSecureTextEntry = true
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (UIAlertAction) in
            let login = alertController.textFields![0]
            let pwd = alertController.textFields![1]
            self.performSegue(withIdentifier: "login", sender: self)
            print("username：\(String(describing: login.text)) password：\(String(describing: pwd.text))")
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == username{
            password.becomeFirstResponder()
        }
        else if textField == password{
            password.becomeFirstResponder()
        }
        password.resignFirstResponder()
        return true
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        username.resignFirstResponder()
        password.resignFirstResponder()
    }
}
