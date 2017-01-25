//
//  ShowSignature.swift
//  AASignatureView
//
//  Created by Engr. Ahsan Ali on 18/01/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

import UIKit

class ShowSignature: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var savedSignaure: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let image = savedSignaure {
            imageView.image = image
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
