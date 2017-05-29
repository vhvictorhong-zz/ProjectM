//
//  GestureViewController.swift
//  KissKiss
//
//  Created by Victor Hong on 29/05/2017.
//  Copyright © 2017 Victor Hong. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
    
    let swipeRightRec = UISwipeGestureRecognizer()
    let swipeLeftRec = UISwipeGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        swipeRightRec.addTarget(self, action: #selector(swipeRightDetected(_:)) )
        swipeRightRec.direction = .right
        self.view!.addGestureRecognizer(swipeRightRec)
        
        swipeLeftRec.addTarget(self, action: #selector(swipeLeftDetected(_:)) )
        swipeLeftRec.direction = .left
        self.view!.addGestureRecognizer(swipeLeftRec)
        
    }
    
    func swipeRightDetected(_ sender: UISwipeGestureRecognizer) {
        print("Right swipe")
    }
    
    func swipeLeftDetected(_ sender: UISwipeGestureRecognizer) {
        print("Left swipe")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
