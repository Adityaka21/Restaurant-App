//
//  PranCartViewController.swift
//  RestoProject
//
//  Created by Nitin Khandewral on 27/04/25.
//

import UIKit

class PranCartViewController: UIViewController {

    @IBOutlet weak var Quantity1: UITextField!
    @IBOutlet weak var Quantity2: UITextField!
    @IBOutlet weak var Totallbl: UILabel!
    
    // Variables to store the prices
    let price1 = 65
    let price2 = 100
    var totalAmount = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Optional: Set default values
        Totallbl.text = "₹0"
    }

    @IBAction func TotalBtn(_ sender: Any) {
        // Safely get quantities from the text fields
        let qty1 = Int(Quantity1.text ?? "") ?? 0
        let qty2 = Int(Quantity2.text ?? "") ?? 0
        
        // Calculate the total
        totalAmount = (qty1 * price1) + (qty2 * price2)
        
        // Update the total label
        Totallbl.text = "₹\(totalAmount)"
    }
    
    @IBAction func ProccedtoPaybtn(_ sender: Any) {
        // Check if total amount is greater than 0
        if totalAmount > 0 {
            // Show an alert confirming payment
            let alert = UIAlertController(title: "Payment", message: "Proceeding to pay ₹\(totalAmount)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            // If total is 0, ask user to calculate total first
            let alert = UIAlertController(title: "No Amount", message: "Please calculate the total first.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

}
