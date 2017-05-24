//
//  SearchViewController.swift
//  KissKiss
//
//  Created by Victor Hong on 23/05/2017.
//  Copyright © 2017 Victor Hong. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searhBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!
    var searchResults = ["1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "SearhTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "searchCell")
        tableView.rowHeight = 60
    }
    
    // MARK: searchItem
    
    func searchItem(_ searchText: String) {
        
        // TODO update code
        
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

// MARK: - TableViewDelegate, TableViewDataSource

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return searchResults.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearhTableViewCell
        
        cell.itemLabel.text = "\(indexPath.row)"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let vc = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        //vc.stockSymbol = searchResults[indexPath.row].symbol!
        //navigationController?.pushViewController(vc, animated: true)
        //tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

// MARK: - SearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let length = searchText.characters.count
        
        if length > 0 {
            //searchStocks(searchText)
        } else {
            searchResults.removeAll()
            tableView.reloadData()
        }
        
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        
        searchBar.showsCancelButton = true
        tableView.reloadData()
        return true
        
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        
        searchBar.showsCancelButton = false
        tableView.reloadData()
        return true
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        
    }
    
    // MARK: - SearchBar keyboard
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(SearchViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SearchViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
        
    }
    
    func keyboardWillShow(_ sender: Notification) {
        if let userInfo = sender.userInfo {
            let keyboardHeight = (userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size.height
            tableViewBottomConstraint.constant = keyboardHeight
            UIView.animate(withDuration: 0.25, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
            
        }
        
    }
    
    func keyboardWillHide(_ sender: Notification) {
        if sender.userInfo != nil {
            tableViewBottomConstraint.constant = 0.0
            UIView.animate(withDuration: 0.25, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
        }
        
    }
}
