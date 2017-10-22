//
//  searchbarTVC.swift
//  PopoutAnimation
//
//  Created by Prateek on 16/09/17.
//  Copyright © 2017 14K. All rights reserved.
//

import UIKit

class searchbarTVC: UITableViewController , UISearchResultsUpdating , UISearchControllerDelegate{

    private var _tableDB : [String]?
    
    var searchContr = UISearchController()
    var resultsController = UITableViewController()
    var filteredArr = [String]()
    
    var tableDB : [String] {
        get  {
            
            if _tableDB == nil{
                _tableDB = [String]()
                var i = 0
                while(i<41) {
                    _tableDB?.append("Row \(i)")
                    i=i+1
                }
            }
          
          return _tableDB!
        }
        set {
           _tableDB = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchContr  = UISearchController(searchResultsController: resultsController)
        tableView.tableHeaderView = searchContr.searchBar
        resultsController.automaticallyAdjustsScrollViewInsets = false;
        resultsController.edgesForExtendedLayout = []
        searchContr.searchResultsUpdater = self
        searchContr.searchBar.returnKeyType = UIReturnKeyType.done
        searchContr.searchBar.setValue("Done", forKey:"_cancelButtonText")
        
        searchContr.delegate = self
        
        resultsController.tableView.delegate = self
        resultsController.tableView.dataSource = self

    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select")
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredArr = tableDB.filter({ (str) -> Bool in
            if(str.contains(searchContr.searchBar.text!)){
                return true
            }
            else{
                return false
            }
        })
        
        resultsController.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if(tableView == resultsController.tableView){
            return filteredArr.count
        }
        else{
            return tableDB.count
        }
        
    }
    
    
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if(tableView == resultsController.tableView){
            cell.textLabel?.text = filteredArr[indexPath.row]
        }
        else{
            cell.textLabel?.text = tableDB[indexPath.row]
        }
        return cell
    }
    
}
