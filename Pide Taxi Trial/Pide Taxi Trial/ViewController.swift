//
//  ViewController.swift
//  Pide Taxi Trial
//
//  Created by Mickey Goga on 1/4/18.
//  Copyright © 2018 Magy Elias. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailErrorImageView: UIImageView!
    @IBOutlet weak var passwordErrorImageView: UIImageView!
    
    var email : String = "it@iotblue.net"
    var password : String = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTextFields()
    }
    
    // Designate this class as the text fields' delegate and set their keyboards while we're at it.
    func initializeTextFields() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInAction(_ sender: Any) {
//        if (emailTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! {
//            displayAlertMessage(messageToDisplay: "Field Required")
//        } else if  let emailAddress = emailTextField.text  {
//            if !isEmailValid(emailAddressString: emailAddress) {
//                displayAlertMessage(messageToDisplay: "Invalid email")
//            } else if !emailAddress.isEqual(email) {
//                displayAlertMessage(messageToDisplay: "Invalid email or password")
//            } else {
//                displayAlertMessage(messageToDisplay: "Sign In Successfully")
//            }
//        }
        print(emailTextField.text!)
        print(passwordTextField.text!)
        
        if (emailTextField.text?.isEmpty)! {
            displayAlertMessage(messageToDisplay: "Email Field Required")
            print("Email Field Required")
            emailErrorImageView.isHidden = false
        } else if (passwordTextField.text?.isEmpty)! {
            displayAlertMessage(messageToDisplay: "Password Field Required")
            print("Password Field Required")
            passwordErrorImageView.isHidden = false
        } else {
            let emailAddress = emailTextField.text!
            let passwordString = passwordTextField.text!
            if !isEmailValid(emailAddressString: emailAddress) {
                displayAlertMessage(messageToDisplay: "Invalid email")
                print("Invalid email")
                emailErrorImageView.isHidden = false
            } else if !emailAddress.isEqual(email) || !passwordString.isEqual(password) {
                displayAlertMessage(messageToDisplay: "Invalid email or password")
                print("Invalid email or password")
                emailErrorImageView.isHidden = false
                passwordErrorImageView.isHidden = false
            } else {
                displayAlertMessage(messageToDisplay: "Sign In Successfully")
                print("Sign In Successfully")
                emailErrorImageView.isHidden = true
                passwordErrorImageView.isHidden = true
            }
        }
    }

    func isEmailValid(emailAddressString : String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
//        print(emailAddressString)
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))

            if results.count == 0
            {
                print("return false")
                return false
            }
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            print("return false")
            return false
        }
        print("return true")
        return true
    }
    
//    func isPasswordValid(passwordString : String) -> Bool {
//        let
//    }
    
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
        }
        
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
    }
    
    // Dismiss the keyboard when the user taps the "Return" key or its equivalent while editing a text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
          nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
}
