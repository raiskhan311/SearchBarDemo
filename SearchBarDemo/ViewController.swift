//
//  ViewController.swift
//  SearchBarDemo
//
//  Created by APPLE on 30/06/17.
//  Copyright © 2017 rsku. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {
    
    @IBOutlet weak var tbl_TableView: UITableView!
    
    @IBOutlet weak var SearchBar: UISearchBar!
    
    var searching:Bool! = false // this is for search is on or not that identifier
    var originalArray = [String]()
    var searchingDataArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        originalArray = ["Intex","Motorola", "Vivo", "Haier", "Samsung", "Nokia","Sony", "Apple","Mi","Micromax"]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching == true
        {
            return searchingDataArray.count
        }
        else
        {
            return originalArray.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if searching == true
        {
            cell.textLabel?.text = searchingDataArray[indexPath.row]
        }
        else
        {
            cell.textLabel?.text = originalArray[indexPath.row]
        }
        return cell
    }
    
    @objc(searchBar:textDidChange:) func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        searchingDataArray = originalArray.filter({(text) ->
            Bool in
            let temp: NSString = text as NSString
            let range = temp.range(of: searchText, options:
            NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if (searchingDataArray.count == 0)
        {
            searching = false
        }
        else
        {
            searching = true
        }
        self.tbl_TableView.reloadData()
    }
}

