//
//  BagViewController.swift
//  KissKiss
//
//  Created by Victor Hong on 22/05/2017.
//  Copyright © 2017 Victor Hong. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI

class BagViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var imageArray = [#imageLiteral(resourceName: "eyesCA"), #imageLiteral(resourceName: "lipsCA"), #imageLiteral(resourceName: "faceCA")]
    
    var ref: FIRDatabaseReference!
    fileprivate var _refHandle: FIRDatabaseHandle!
    fileprivate var _authHandle: FIRAuthStateDidChangeListenerHandle!
    var user: FIRUser?
    var displayName = "Anonymous"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureAuth()
        
        collectionView.register(UINib(nibName: "BagCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "bagCell")
        
    }
    
    override func viewDidLayoutSubviews() {
        
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError("Expected the collection view to have a UICollectionViewFlowLayout") }
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize.width = self.view.bounds.size.width
        layout.itemSize.height = self.view.bounds.size.height / 3.2
        
    }
    
    // MARK: Config
    
    func configureAuth() {
        
        let provider: [FUIAuthProvider] = [FUIGoogleAuth()]
        FUIAuth.defaultAuthUI()?.providers = provider
        
        _authHandle = FIRAuth.auth()?.addStateDidChangeListener({ (auth: FIRAuth, user: FIRUser?) in
            
            //check if there is a current user
            if let activeUser = user {
                //check if the current app user is the current FIRUser
                if self.user != activeUser {
                    self.user = activeUser
                    self.signedInStatus(isSignedIn: true)
                    let name = user!.email!.components(separatedBy: "@")[0]
                    self.displayName = name
                }
            } else {
                //user must sign in
                self.signedInStatus(isSignedIn: false)
                self.loginSession()
            }
        })
        
    }
    
    func configureDatabase() {
        
        ref = FIRDatabase.database().reference()
        _refHandle = ref.child("user").child((user?.uid)!).observe(.childAdded) { (snapshot: FIRDataSnapshot) in
            
            let listSnapshot: FIRDataSnapshot! = snapshot
            let list = listSnapshot.value as! [String]
//            self.userList = list
//            
//            for list in self.userList {
//                StockManager.fetchStockForSymbol(symbol: list, completion: { (stock) in
//                    self.watchList[list] = stock
//                    self.tableView.reloadData()
//                })
//            }
            
        }
        
    }
    
    // MARK: Sign In and Out
    
    func signedInStatus(isSignedIn: Bool) {
        //signInButton.isEnabled = !isSignedIn
        //signOutButton.isEnabled = isSignedIn
        //        messagesTable.isHidden = !isSignedIn
        //        messageTextField.isHidden = !isSignedIn
        //        sendButton.isHidden = !isSignedIn
        //        imageMessage.isHidden = !isSignedIn
        
        if (isSignedIn) {
            //tableView.isHidden = true
            // remove background blur (will use when showing image messages)
//            tableView.rowHeight = UITableViewAutomaticDimension
//            tableView.estimatedRowHeight = 70
            
            //configureDatabase()
            //            configureStorage()
            //            configureRemoteConfig()
            //            fetchConfig()
            
        }
    }

    func loginSession() {
        let authViewController = FUIAuth.defaultAuthUI()!.authViewController()
        self.present(authViewController, animated: true, completion: nil)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
}
