
//
//  ImageViewController.swift
//  CacttusEdu
//
//  Created by Gent Berani on 4/25/18.
//  Copyright © 2018 CacttusEdu. All rights reserved.
//

import UIKit
import Kingfisher

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
    }
    
    private func loadImage(){
        //https://pbs.twimg.com/media/DJhuz4GW0AAMxKr.jpg
        let meritonPhotoURL = URL.init(string: "https://pbs.twimg.com/media/DJhuz4GW0AAMxKr.jpg")
        let shpendURL = URL.init(string: "https://pbs.twimg.com/profile_images/2593450980/v3sya17c7u6zxrchx5pq.jpeg")
        imageView.kf.setImage(with: shpendURL)
    }
}
