//
//  MULDetailViewController.swift
//  KissKiss
//
//  Created by Victor Hong on 07/06/2017.
//  Copyright © 2017 Victor Hong. All rights reserved.
//

import UIKit

class MULDetailViewController: UIViewController, UITabBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //detailLabel.text = user
        
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "imageCell")
        tableView.register(UINib(nibName: "MakeupLookTableViewCell", bundle: nil), forCellReuseIdentifier: "makeupCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = 380
        
    }
    
    override func viewDidLayoutSubviews() {
        
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError("Expected the collection view to have a UICollectionViewFlowLayout") }
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize.width = self.view.bounds.size.width / 4
        layout.itemSize.height = self.view.bounds.size.height / 6
        
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if item.tag == 0 {
            print("recent")
            collectionView.isHidden = false
            tableView.isHidden = true
        } else {
            print("more")
            collectionView.isHidden = true
            tableView.isHidden = false
        }

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

extension MULDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as? ImageCollectionViewCell
        
        cell?.imageView.image = #imageLiteral(resourceName: "Barcode")
        
        return cell!
    }
}

extension MULDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
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

