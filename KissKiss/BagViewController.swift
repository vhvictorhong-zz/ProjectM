//
//  BagViewController.swift
//  KissKiss
//
//  Created by Victor Hong on 22/05/2017.
//  Copyright © 2017 Victor Hong. All rights reserved.
//

import UIKit

class BagViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var imageArray = [#imageLiteral(resourceName: "eyesCA"), #imageLiteral(resourceName: "lipsCA"), #imageLiteral(resourceName: "faceCA")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.register(UINib(nibName: "BagCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "bagCell")
        
    }
    
    override func viewDidLayoutSubviews() {
        
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError("Expected the collection view to have a UICollectionViewFlowLayout") }
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize.width = self.view.bounds.size.width
        layout.itemSize.height = self.view.bounds.size.height / 3.2
        
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

extension BagViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bagCell", for: indexPath) as? BagCollectionViewCell
        
        cell?.bagImageView.image = imageArray[indexPath.row]
        
        return cell!
    }
}
