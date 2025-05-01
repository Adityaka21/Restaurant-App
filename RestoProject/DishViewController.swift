//
//  DishViewController.swift
//  RestoProject
//
//  Created by Nitin Khandewral on 27/04/25.
//

import UIKit

class DishViewController: UIViewController {

    @IBOutlet weak var Quantity1: UITextField!
    @IBOutlet weak var Quantity2: UITextField!
    @IBOutlet weak var Totallbl: UILabel!
    
    // Prices
    let price1 = 280
    let price2 = 200
    var totalAmount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set default total
        Totallbl.text = "₹0"
    }
    
    @IBAction func Totalbtn(_ sender: Any) {
        // Get quantities from text fields safely
        let qty1 = Int(Quantity1.text ?? "") ?? 0
        let qty2 = Int(Quantity2.text ?? "") ?? 0
        
        // Calculate total amount
        totalAmount = (qty1 * price1) + (qty2 * price2)
        
        // Update label
        Totallbl.text = "₹\(totalAmount)"
    }
    
    @IBAction func ProccedToPay(_ sender: Any) {
        if totalAmount > 0 {
            let alert = UIAlertController(title: "Payment", message: "Proceeding to pay ₹\(totalAmount)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                // After payment, reset fields
                self.Quantity1.text = ""
                self.Quantity2.text = ""
                self.Totallbl.text = "Total: ₹0"
                self.totalAmount = 0
            }))
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "No Amount", message: "Please calculate the total first.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // You can pass the total amount to another screen here if needed
    }

}
