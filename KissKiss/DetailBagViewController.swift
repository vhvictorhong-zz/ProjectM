//
//  DetailBagViewController.swift
//  KissKiss
//
//  Created by Victor Hong on 24/05/2017.
//  Copyright © 2017 Victor Hong. All rights reserved.
//

import UIKit

class DetailBagViewController: UIViewController {

    var list = [["Eyeshadow", "Eyeliner", "Eyebrow definers", "Mascara", "Eyelashes"],
                ["Lipstick", "Lip Gloss", "Lip liner"],
                ["Foundation", "Powder", "Blush/Bronzer", "Highlight/Contour", "Concealer"]]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "SearhTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "searchCell")
        
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

extension DetailBagViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearhTableViewCell
        
        cell.itemLabel.text = list[0][indexPath.row]
        
        return cell
        
    }
    
}
