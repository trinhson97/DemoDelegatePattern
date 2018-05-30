
//
//  DetailViewController.swift
//  DemoDelegatePattern
//
//  Created by Son on 5/15/18.
//  Copyright © 2018 Son. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate: class {
    func callbackData(with number: Int?)
}

class DetailViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    var number: Int?
    
    weak var delegate: DetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if number != nil {
            nameTextField.text = "\(number!)"
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveData(_ sender: UIBarButtonItem) {
        if let text = nameTextField.text {
            delegate?.callbackData(with: Int(text))
        }
        navigationController?.popViewController(animated: true)
    }

}
