//
//  LoginViewController.swift
//  RestoProject
//
//  Created by Nitin Khandewral on 21/04/25.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var UsernameTxt: UITextField!
    
    
    @IBOutlet weak var PasswordTxt: UITextField!
    
    @IBAction func LoginBtn(_ sender: Any) {
        let username = UsernameTxt.text ?? ""
             let password = PasswordTxt.text ?? ""

             if username.isEmpty || password.isEmpty {
                 showAlert(message: "Please enter both username and password.")
             } else if username == "admin" && password == "1234" {
//                 showAlert(message: "Login successful!")
             } else {
                 showAlert(message: "Invalid credentials.")
             }
    }
    
    func showAlert(message: String) {
           let alert = UIAlertController(title: "Login", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default))
           present(alert, animated: true)
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
