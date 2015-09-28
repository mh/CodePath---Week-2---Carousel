//
//  SigninViewController.swift
//  Carousel-Week2
//
//  Created by matt hunter on 9/28/15.
//  Copyright © 2015 matt hunter. All rights reserved.
//

import UIKit



class SigninViewController: UIViewController {

    
    @IBOutlet weak var signInFormView: UIView!
    var signInFormViewInitialY: CGFloat!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signInButtonView: UIButton!
    var signInButtonViewInitialY: CGFloat!
    
    
    
    let emailRequiredAlert = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .Alert)
    
    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
        // handle response here.
    }
    
    let signingInAlert = UIAlertController(title: nil, message: "Signing In...", preferredStyle: .Alert)
    let signInFailed = UIAlertController(title: "Sign In Failed", message: "Incorrect email or password.", preferredStyle: .Alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInFormViewInitialY = signInFormView.frame.origin.y
        signInButtonViewInitialY = signInButtonView.frame.origin.y
    
        emailRequiredAlert.addAction(OKAction)
        signInFailed.addAction(OKAction)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        _ = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        let animationDuration = durationValue.doubleValue
        let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        let animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            // Set view p   roperties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
        
        
        self.signInFormView.frame.origin = CGPoint(x: self.signInFormView.frame.origin.x, y: signInFormViewInitialY)
        self.signInButtonView.frame.origin = CGPoint(x: self.signInButtonView.frame.origin.x, y: signInButtonViewInitialY)
        
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        _ = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        let animationDuration = durationValue.doubleValue
        let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        let animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
        
        self.signInFormView.frame.origin = CGPoint(x: self.signInFormView.frame.origin.x, y: 20)
        self.signInButtonView.frame.origin = CGPoint(x: self.signInButtonView.frame.origin.x, y: 200)
    }
    
    
    @IBAction func tapAway(sender: AnyObject) {
        emailField.endEditing(true)
        passwordField.endEditing(true)
    
    }
    
    
    @IBAction func didSignIn(sender: AnyObject) {
        if emailField.text == "" && passwordField.text == ""{
            self.presentViewController(self.emailRequiredAlert, animated: true) {
            }
        }
        else {
            presentViewController(signingInAlert, animated: true, completion: nil)
            delay(1){
                self.signingInAlert.dismissViewControllerAnimated(true, completion: nil)
                self.checkCredentials(self.emailField.text!, password: self.passwordField.text!)
            }
        }
    }
    
    func checkCredentials (email: String, password: String){
        if email == "mh@mh.com" && password == "password" {
            performSegueWithIdentifier("toTutorialSegue", sender: self)
        }
        else {
            presentViewController(signInFailed, animated: true, completion: nil)
        }
        
        
    }

    @IBAction func didPressBackButton(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
