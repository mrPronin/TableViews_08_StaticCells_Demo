//
//  EditTableViewController.swift
//  PrettyIcons
//
//  Created by Aleksandr Pronin on 3/6/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit

class EditTableViewController: UITableViewController {

    // MARK: - Vars
    var icon: Icon?
    
    // MARK: - Outlets
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subtitleTextField: UITextField!
    @IBOutlet weak var ratingLabel: UILabel!
    
    // MARK: - UITableViewController
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        guard let icon = icon else {
            return
        }
        if let iconImage = icon.image {
            iconImageView.image = iconImage
        }
        titleTextField.text = icon.title
        subtitleTextField.text = icon.subtitle
        ratingLabel.text = String(icon.rating)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        guard let icon = icon else {
            return
        }
        if let iconImage = iconImageView.image {
            icon.image = iconImage
        }
        if let title = titleTextField.text {
            icon.title = title
        }
        if let subtitle = subtitleTextField.text {
            icon.subtitle = subtitle
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension EditTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}