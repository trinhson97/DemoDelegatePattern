//
//  MasterTableViewController.swift
//  DemoDelegatePattern
//
//  Created by Son on 5/15/18.
//  Copyright © 2018 Son. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    var numbers: [Int] = Array(1...100)

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return numbers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)


        cell.textLabel?.text = "\(numbers[indexPath.row])"

        return cell
    }

 
    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as? DetailViewController
        
        detailViewController?.delegate = self
        
        if let indexPath = tableView.indexPathForSelectedRow {
            detailViewController?.number = numbers[indexPath.row]
        }
    }

}

// MARK: - DetailViewControllerDelegate
extension MasterTableViewController: DetailViewControllerDelegate {
    func callbackData(with number: Int?) {
        if number != nil {
            if let indexPath = tableView.indexPathForSelectedRow {
                numbers[indexPath.row] = number!
                tableView.reloadRows(at: [indexPath], with: .fade)
            }
        }
    }
}
