//
//  CartController.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 19/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class CartController: TabController {
    
    var titleLabel: UILabel!
    var cartTableView: CartTableView!
    var totalLabel: UILabel!
    var checkoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitleLabel()
        setCheckoutButton()
        setTotalLabel()
        setSeperator()
        setCartTable()
        view.bringSubviewToFront(albumController.view)
    }
    
    func setTitleLabel() {
        titleLabel = UILabel()
        titleLabel.numberOfLines = 2
        titleLabel.font = .Jura(ofSize: 26, weight: "Bold")
        titleLabel.textColor = .primaryColor
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
    }

    func setCheckoutButton() {
        checkoutButton = UIButton()
        checkoutButton.layer.cornerRadius = 15
        checkoutButton.backgroundColor = .secondaryColor
        checkoutButton.setTitleColor(.myBackgroundColor, for: .normal)
        checkoutButton.titleLabel?.font = .Jura(ofSize: 18, weight: "Bold")
        checkoutButton.setTitle("Procceed to Checkout", for: .normal)
        view.addSubview(checkoutButton)
        
        checkoutButton.translatesAutoresizingMaskIntoConstraints = false
        checkoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32).isActive = true
        checkoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        checkoutButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.75).isActive = true
        checkoutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setTotalLabel() {
        totalLabel = UILabel()
        totalLabel.font = .Jura(ofSize: 20, weight: "Bold")
        totalLabel.textColor = .primaryColor
        view.addSubview(totalLabel)
        
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.bottomAnchor.constraint(equalTo: checkoutButton.topAnchor, constant: -8).isActive = true
        totalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setSeperator() {
        let seperator = UIView()
        seperator.backgroundColor = .primaryColor
        view.addSubview(seperator)
        
        seperator.translatesAutoresizingMaskIntoConstraints = false
        seperator.bottomAnchor.constraint(equalTo: totalLabel.topAnchor, constant: -8).isActive = true
        seperator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        seperator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        seperator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setCartTable() {
        cartTableView = CartTableView()
        cartTableView.delegate = self
        view.addSubview(cartTableView.view)
        
        cartTableView.view.translatesAutoresizingMaskIntoConstraints = false
        cartTableView.view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        cartTableView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        cartTableView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        cartTableView.view.bottomAnchor.constraint(equalTo: totalLabel.topAnchor, constant: -12).isActive = true
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.cartTableView.tableView.reloadData()
        }
        let totalPrice = CartManager.shared.totalPrice
        totalLabel.text = "Total \(cartItems.count) Items - $\(totalPrice)0"
        titleLabel.text = cartItems.count == 0 ? "Your Shopping Cart is Empty" : "Your Shopping Cart"
    }
}
