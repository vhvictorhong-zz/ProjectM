//
//  BarcodeViewController.swift
//  KissKiss
//
//  Created by Victor Hong on 24/05/2017.
//  Copyright © 2017 Victor Hong. All rights reserved.
//

import UIKit
import BarcodeScanner

class BarcodeViewController: BarcodeScannerController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Barcode"
        
        let controller = self
        controller.codeDelegate = self
        controller.errorDelegate = self
        controller.dismissalDelegate = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.reset(animated: true)
        
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

extension BarcodeViewController: BarcodeScannerCodeDelegate {
    
    func barcodeScanner(_ controller: BarcodeScannerController, didCaptureCode code: String, type: String) {
        
        //for product in singleton.products {
            //if (product.title == code){
              //  let productViewController = setThemeVC()
                //productViewController.load(with: product) { success, error in
                  //  self.singleton.scannedProducts.append(product)
                    //if (error == nil) {
                      //  self.navigationController?.pushViewController(productViewController, animated: true)
                    //}
                //}
                //return
                
            //} else {
                //print ("No such prduct found")
            //}
        //}
        
    }
}

extension BarcodeViewController: BarcodeScannerErrorDelegate {
    
    func barcodeScanner(_ controller: BarcodeScannerController, didReceiveError error: Error) {
        print(error)
    }
}

extension BarcodeViewController: BarcodeScannerDismissalDelegate {
    
    func barcodeScannerDidDismiss(_ controller: BarcodeScannerController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
