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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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
        
        return cell
        
    }
}
