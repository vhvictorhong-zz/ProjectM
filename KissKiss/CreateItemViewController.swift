//
//  CreateItemViewController.swift
//  KissKiss
//
//  Created by Victor Hong on 01/06/2017.
//  Copyright © 2017 Victor Hong. All rights reserved.
//

import UIKit
import WWCalendarTimeSelector

class CreateItemViewController: UIViewController, WWCalendarTimeSelectorProtocol {

    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var productSizeTextField: UITextField!
    @IBOutlet weak var productColourTextField: UITextField!
    @IBOutlet weak var productPriceTextField: UITextField!
    @IBOutlet weak var purchaseDateLabel: UILabel!
    @IBOutlet weak var expirationDateLabel: UILabel!
    
    var dateSelected: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    @IBAction func selectProductIconAction(_ sender: Any) {
        
        let productIconVC = ProductIconViewController()
        
        self.present(productIconVC, animated: true, completion: nil)
        
    }
    
    @IBAction func datePurchaseAction(_ sender: Any) {
        
        let datePurchaseSelector = WWCalendarTimeSelector.instantiate()
        datePurchaseSelector.delegate = self
        
        present(datePurchaseSelector, animated: true, completion: nil)
        
        if let date = dateSelected {
            purchaseDateLabel.text = date
        }
        
    }

    @IBAction func dateExpiryAction(_ sender: Any) {
        
        let dateExpirySelector = WWCalendarTimeSelector.instantiate()
        dateExpirySelector.delegate = self
        
        present(dateExpirySelector, animated: true, completion: nil)
        
        if let date = dateSelected {
            expirationDateLabel.text = date
        }
    }
    
    func WWCalendarTimeSelectorDone(_ selector: WWCalendarTimeSelector, date: Date) {
        
        print("Current date: \(date)")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.full
        let formatDate = dateFormatter.string(from: date)
        
        dateSelected = formatDate
        print("Format date: \(formatDate)")
        
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
