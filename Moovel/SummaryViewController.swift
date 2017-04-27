//
//  SummaryViewController.swift
//  Moovel
//
//  Created by Nithin Reddy Gaddam on 4/26/17.
//  Copyright © 2017 Nithin Reddy Gaddam. All rights reserved.
//

import Foundation

import UIKit

class SummaryViewController: UIViewController {
    
    var user: User?
    var fare: Fare? {
        didSet {
            let price = Int((fare?.price)!)
            buyButton.setTitle("Buy 1 Ticket - $\(price)", for: .normal)
            
            let name = (user?.name)!
            
            let attributedText = NSMutableAttributedString(string: "\(name)\n", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
            attributedText.append(NSAttributedString(string: (fare?.description)!, attributes: [NSForegroundColorAttributeName: UIColor.lightGray, NSFontAttributeName: UIFont.systemFont(ofSize: 14)]))
            
            userLabel.attributedText = attributedText
        }
    }
    
    
    let buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(handleBuyButton), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        button.backgroundColor = .gray
        return button
    }()
    
    func handleBuyButton () {
        
    }
    
    let userLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines = 0
        return label
        
    }()
    
    let userLabel2: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines = 0
        return label
        
    }()
    
    let ticketNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
        
    }()
    
    let incrementButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(handleIncrementButton), for: .touchUpInside)
        return button
        
    }()
    
    
    let decrementButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(handleDecrementButton), for: .touchUpInside)
        return button
        
    }()
    
    func handleIncrementButton () {
        let num = Int(ticketNumberLabel.text!)! + 1
        ticketNumberLabel.text = "\(num)"
        let price = (fare?.price)! * Float(num)
        buyButton.setTitle("Buy \(num) Tickets - $\(price)", for: .normal)
    }
    
    func handleDecrementButton () {
        let num = Int(ticketNumberLabel.text!)! - 1
        if(num > 0){
            ticketNumberLabel.text = "\(num)"
            let price = (fare?.price)! * Float(num)
            buyButton.setTitle("Buy \(num) Tickets - $\(price)", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Confirm Selection"
    }
}
