//
//  AuthorViewController.swift
//  BullsEye
//
//  Created by Juan Manuel Gentili on 26/04/2020.
//  Copyright © 2020 Juan Manuel Gentili. All rights reserved.
//

import UIKit

class AuthorViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        makeImageViewRounded()
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    func makeImageViewRounded() {
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.clipsToBounds = true
    }
}
