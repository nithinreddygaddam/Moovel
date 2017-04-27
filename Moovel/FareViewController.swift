//
//  FareViewController.swift
//  Moovel
//
//  Created by Nithin Reddy Gaddam on 4/26/17.
//  Copyright © 2017 Nithin Reddy Gaddam. All rights reserved.
//

import UIKit

class FareViewController: UITableViewController {
    
    var user: User? {
        didSet {
            createFares()
        }
    }
    
    static let cellId = "cellId"
    
    var fares: [Fare] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Select Fare"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: MainViewController.cellId)
    }
    
    func createFares(){
        if(user?.name == "Adult"){
            let f1 = Fare(description: "2.5 Hour Ticket", price: 2.5)
            let f2 = Fare(description: "1 Day Pass", price: 5.0)
            let f3 = Fare(description: "30 Day Pass", price: 100)
            fares.append(f1)
            fares.append(f2)
            fares.append(f3)
        } else if (user?.name == "Child"){
            let f1 = Fare(description: "2.5 Hour Ticket", price: 1.5)
            let f2 = Fare(description: "1 Day Pass", price: 2.0)
            let f3 = Fare(description: "30 Day Pass", price: 40)
            fares.append(f1)
            fares.append(f2)
            fares.append(f3)
            
        } else if (user?.name == "Senior"){
            let f1 = Fare(description: "2.5 Hour Ticket", price: 1.0)
            let f2 = Fare(description: "1 Day Pass", price: 2.0)
            let f3 = Fare(description: "30 Day Pass", price: 40.0)
            fares.append(f1)
            fares.append(f2)
            fares.append(f3)
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fares.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainViewController.cellId, for: indexPath)
        
        let fare = fares[indexPath.row]
        cell.textLabel?.text = fare.description
        cell.detailTextLabel?.text = "$\(fare.price)"
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard self.tableView.cellForRow(at: indexPath) != nil else { return }
        let tempFare = fares[indexPath.row]
        let tempUser = user
        
        let summaryController = SummaryViewController()
        summaryController.user = tempUser
        summaryController.fare = tempFare
        navigationController?.pushViewController(summaryController, animated: true)
        
    }
    
}

