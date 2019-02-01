//
//  DetailViewController.swift
//  favoriteCity
//
//  Created by Shubham Srivastava on 1/29/19.
//  Copyright © 2019 Shubham Srivastava. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var StateTextField: UITextField!
    @IBOutlet weak var PopulationtextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    var detailItem: City? {
        didSet {
            // Update the view.
            configureView()
        }
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let city = self.detailItem {
            if cityTextField != nil {
                cityTextField.text = city.name
                StateTextField.text = city.state
                PopulationtextField.text = String(city.population)
                imageView.image = UIImage(data: city.image)
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        if let city = self.detailItem{
            city.name = cityTextField.text!
            city.state = StateTextField.text!
            city.population = Int(PopulationtextField.text!)!
        }
    }

}

