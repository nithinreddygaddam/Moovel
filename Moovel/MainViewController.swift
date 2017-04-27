//
//  MainViewController.swift
//  Moovel
//
//  Created by Nithin Reddy Gaddam on 4/26/17.
//  Copyright © 2017 Nithin Reddy Gaddam. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    static let cellId = "cellId"
    
    var users: [User] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUsers()
        
        navigationItem.title = "Select Rider"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: MainViewController.cellId)
    }
    
    func createUsers(){
        let u1 = User(name: "Adult", subText: "")
        let u2 = User(name: "Child", subText: "Ages 8-17")
        let u3 = User(name: "Senior", subText: "Ages 60+")
        users.append(u1)
        users.append(u2)
        users.append(u3)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainViewController.cellId, for: indexPath)
        
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.subText

        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard self.tableView.cellForRow(at: indexPath) != nil else { return }
        
        let tempUser = users[indexPath.row]
        
        let fareController = FareViewController()
        fareController.user = tempUser
        navigationController?.pushViewController(fareController, animated: true)
    }
    
}
