//
//  SignUpViewController.swift
//  RestoProject
//
//  Created by Nitin Khandewral on 21/04/25.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var NameTxt: UITextField!
    
    @IBOutlet weak var EmailTxt: UITextField!
    
//    @IBOutlet weak var PhoneTxt: UITextField!
    
    @IBOutlet weak var PasswordTxt: UITextField!
    
    
    @IBOutlet weak var ConfirmPassTxt: UITextField!
    
    
    @IBAction func SignUpBtn(_ sender: Any) {
        guard let name = NameTxt.text, !name.isEmpty,
                      let email = EmailTxt.text, !email.isEmpty,
//                      let phone = PhoneTxt.text, !phone.isEmpty,
                      let password = PasswordTxt.text, !password.isEmpty,
                      let confirmPassword = ConfirmPassTxt.text, !confirmPassword.isEmpty else {
                    showAlert(message: "All fields are required.")
                    return
                }

                // Simple validations
                guard isValidEmail(email) else {
                    showAlert(message: "Invalid email format.")
                    return
                }

                guard password == confirmPassword else {
                    showAlert(message: "Passwords do not match.")
                    return
                }

                // You can add your sign-up logic here (e.g., send data to a server)
//                showAlert(message: "Sign up successful!")
        
    }
    
    
    func showAlert(message: String) {
           let alert = UIAlertController(title: "Sign Up", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default))
           present(alert, animated: true)
       }
    
    func isValidEmail(_ email: String) -> Bool {
          // Basic email pattern
          let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
          let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
          return emailPredicate.evaluate(with: email)
      }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
