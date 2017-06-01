//
//  Gesture.swift
//  KissKiss
//
//  Created by Victor Hong on 30/05/2017.
//  Copyright © 2017 Victor Hong. All rights reserved.
//

import Foundation
import UIKit

class Gesture: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    
    @objc func swipeLeftDetected(_ sender: UISwipeGestureRecognizer) {
        
        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = true
//            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
        }
        print("Left swipe")
    }
    
}
