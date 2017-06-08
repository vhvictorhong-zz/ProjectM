//
//  MakeupLookViewController.swift
//  KissKiss
//
//  Created by Victor Hong on 29/05/2017.
//  Copyright © 2017 Victor Hong. All rights reserved.
//

import UIKit

class MakeupLookViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "MakeupLookTableViewCell", bundle: nil), forCellReuseIdentifier: "makeupCell")
        tableView.showsVerticalScrollIndicator = false
        
        self.tableView.rowHeight = 380
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showMULDetailVC" {
            if let mulDetailVC = segue.destination as? MULDetailViewController {
                //mulDetailVC.user = "user"
            }
        }
    }
 

}

extension MakeupLookViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "makeupCell", for: indexPath) as! MakeupLookTableViewCell
        
        cell.userButton.addTarget(self, action: #selector(presentMULDetailVC), for: .touchUpInside)
        
        return cell
        
    }
    
    func presentMULDetailVC() {
        
        performSegue(withIdentifier: "showMULDetailVC", sender: self)
        
    }
    
}
