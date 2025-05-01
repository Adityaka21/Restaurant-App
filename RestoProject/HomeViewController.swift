import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!

    let snacks = ["Chips", "Nachos", "Fries", "Spring Rolls", "Garlic Bread"]
    let drinks = ["Cola", "Lemonade", "Iced Tea", "Milkshake", "Mojito"]
    let desserts = ["Cake", "Ice Cream", "Brownie", "Cupcake", "Cheesecake"]

    // Image mapping for each item
    let itemImages: [String: String] = [
        "Chips": "chips",
        "Nachos": "nachos",
        "Fries": "fries",
        "Spring Rolls": "spring_rolls",
        "Garlic Bread": "garlic_bread",
        "Cola": "cola",
        "Lemonade": "lemonade",
        "Iced Tea": "iced_tea",
        "Milkshake": "milkshake",
        "Mojito": "mojito",
        "Cake": "cake",
        "Ice Cream": "ice_cream",
        "Brownie": "brownie",
        "Cupcake": "cupcake",
        "Cheesecake": "cheesecake"
    ]

    var currentItems: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        updateItems()
    }

    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        updateItems()
    }

    func updateItems() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            currentItems = snacks
        case 1:
            currentItems = drinks
        case 2:
            currentItems = desserts
        default:
            currentItems = []
        }
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodcell", for: indexPath)
        let item = currentItems[indexPath.row]
        cell.textLabel?.text = item
        if let imageName = itemImages[item] {
            cell.imageView?.image = UIImage(named: imageName)
        } else {
            cell.imageView?.image = nil
        }
        return cell
    }
}
