//
//  ImageViewController.swift
//  Landmark Image Book
//
//  Created by Kornet Project on 15/08/2017.
//  Copyright © 2017 Kornet Project. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = selectedLandmarkImage
        nameLabel.text = selectedLandmarkName
        // Do any additional setup after loading the view.
    }


}
