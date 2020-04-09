//
//  ViewController.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 05/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import Foundation
import UIKit

class TabsController: UIViewController {

    var viewPager: WormTabStrip!
    var titleLabel: UILabel!
    var userButton: UIButton!
    var menuButton: UIButton!
    
    var shopController: UIViewController!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        setUpViewPager()
        setUpTitle()
        setUpButtons()
    }
    
    func setUpElements() {
        view.backgroundColor = .primaryColor
        
        shopController = ShopController()
        addChild(shopController)
        shopController.didMove(toParent: self)
    }
    
    func setUpViewPager() {
        let frame =  CGRect(x: 0, y: 90, width: self.view.frame.size.width, height: self.view.frame.size.height - 90)
        viewPager = WormTabStrip(frame: frame)
        self.view.addSubview(viewPager)
        
        viewPager.delegate = self
        viewPager.eyStyle.wormStyel = .BUBBLE
        viewPager.eyStyle.isWormEnable = true
        viewPager.eyStyle.spacingBetweenTabs = 0
        viewPager.eyStyle.dividerBackgroundColor = .primaryColor
        viewPager.eyStyle.tabItemSelectedColor = .white
        viewPager.currentTabIndex = 1
        viewPager.buildUI()
    }
    
    func setUpTitle() {
        titleLabel = UILabel()
        titleLabel.text = "Tobi"
        titleLabel.textColor = .white
        titleLabel.font = .MandatoryPlaything(ofSize: 32)
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 48).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 1.8).isActive = true
    }
    
    func setUpButtons() {
        userButton = UIButton(type: .custom)
        userButton.tintColor = .secondaryColor
        userButton.setImage(UIImage(systemName: "person.circle"), for: .normal)
        userButton.setImage(UIImage(systemName: "person.circle.fill"), for: .highlighted)
        userButton.contentVerticalAlignment = .fill
        userButton.contentHorizontalAlignment = .fill
        view.addSubview(userButton)
        view.bringSubviewToFront(userButton)
        
        userButton.translatesAutoresizingMaskIntoConstraints = false
        userButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: -1).isActive = true
        userButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        userButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        userButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        menuButton = UIButton(type: .custom)
        menuButton.tintColor = .secondaryColor
        menuButton.setImage(UIImage(systemName: "line.horizontal.3.decrease"), for: .normal)
        menuButton.contentVerticalAlignment = .fill
        menuButton.contentHorizontalAlignment = .fill
        view.addSubview(menuButton)
        view.bringSubviewToFront(menuButton)
        
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: -2).isActive = true
        menuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        menuButton.widthAnchor.constraint(equalToConstant: 26).isActive = true
        menuButton.heightAnchor.constraint(equalToConstant: 26).isActive = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Tapped")
    }
}

extension TabsController: WormTabStripDelegate {
    func WTSNumberOfTabs() -> Int {
        3
    }
    
    func WTSViewOfTab(index: Int) -> UIView {
        index == 1 ? shopController.view : UIViewController().view
    }
    
    func WTSTitleForTab(index: Int) -> String {
        TabItems.titles[index]
    }
    
    func imageForTab(index: Int) -> UIImage {
        TabItems.images[index]!
    }
    
    func WTSReachedLeftEdge(panParam: UIPanGestureRecognizer) {
        
    }
    
    func WTSReachedRightEdge(panParam: UIPanGestureRecognizer) {
        
    }
}