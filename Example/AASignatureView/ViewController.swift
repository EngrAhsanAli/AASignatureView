//
//  ViewController.swift
//  AASignatureView
//
//  Created by Engr. Ahsan Ali on 01/01/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

import UIKit
import AASignatureView

class ViewController: UIViewController {
    
    @IBOutlet weak var signatureView: AASignatureView!
    
    var savedSignaure: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearSignature(_ sender: UIButton) {
        self.signatureView.clear()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "show" {
            let destVC = segue.destination as! ShowSignature
            destVC.savedSignaure = savedSignaure
        }

    }
    
    
    @IBAction func saveSignature(_ sender: UIButton) {
        
        if let image = signatureView.signature {
            savedSignaure = image
            self.performSegue(withIdentifier: "show", sender: self)
        }
    }
    
}


