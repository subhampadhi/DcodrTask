//
//  TabBarController.swift
//  DcodrTask
//
//  Created by Subham Padhi on 09/04/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        tabBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
    }
    
    func setupTabs() {
        
        //let layout = UICollectionViewFlowLayout()
        let messagesViewController = ChatVC()
        let recentGroupsNavController = UINavigationController(rootViewController: messagesViewController)
        recentGroupsNavController.tabBarItem.title = "Dev Chat"
       // recentGroupsNavController.tabBarItem.image = #imageLiteral(resourceName: "MESSAGE_ICON")
        
        
        let searchViewController = QuestionAnswerVC()
        let searchNavController = UINavigationController(rootViewController: searchViewController)
        searchNavController.tabBarItem.title = "Q & A"
       // searchNavController.tabBarItem.image = #imageLiteral(resourceName: "SEARCH_ICON")
        
        
        let settingsViewController = ThreadsVC()
        let settingsNavController = UINavigationController(rootViewController: settingsViewController)
        settingsNavController.tabBarItem.title = "Threads"
      //  settingsNavController.tabBarItem.image = #imageLiteral(resourceName: "SETTINGS_ICON")
        
        let codeViewController = CodeVC()
        let codeNavController = UINavigationController(rootViewController: codeViewController)
        codeNavController.tabBarItem.title = "Code"
        //  settingsNavController.tabBarItem.image = #imageLiteral(resourceName: "SETTINGS_ICON")
        
        
        var allViewControllers = [UIViewController]()
        
        
        allViewControllers.append(recentGroupsNavController)
        allViewControllers.append(searchNavController)
        allViewControllers.append(settingsNavController)
        allViewControllers.append(codeNavController)
        
        self.viewControllers = allViewControllers
        
        selectedIndex = 0
    }
    
    
    
    
}
