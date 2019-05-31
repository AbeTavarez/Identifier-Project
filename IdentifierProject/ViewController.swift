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
            
            guard let ciimage = CIImage(image: userPickedImage) else { fatalError("Could not convert UIImage to CImage")}

            detect(image: ciimage)
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    
    func detect(image: CIImage) {
        
    
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {fatalError("Loading CoreML Failed")}
        
        let request = VNCoreMLRequest(model: model) {(request,error) in
            
            guard let results = request.results as? [VNClassificationObservation] else {fatalError("Model failed to process image")
                
            }
            
        
            
            //prints array results
            print(results)
        }
     
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
        try! handler.perform([request])
        } catch {
            print(error)
        }
    }
    
    
    @IBAction func cameraTapped(_ sender: Any) {
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

}

