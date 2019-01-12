//
//  DetailViewController.swift
//  splitty
//
//  Created by Denis Nefedov on 12/01/2019.
//  Copyright © 2019 X. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var itemImageView: UIImageView!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemImageView.image = image
    }



}

