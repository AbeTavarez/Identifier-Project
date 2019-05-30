//
//  ViewController.swift
//  IdentifierProject
//
//  Created by Efren Abraham Tavarez on 5/30/19.
//  Copyright © 2019 Efren Abraham Tavarez. All rights reserved.
//

import UIKit
import CoreML
import Vision


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
  
    @IBOutlet var cameraImageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            cameraImageView.image = userPickedImage

            
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func cameraTapped(_ sender: Any) {
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

}

