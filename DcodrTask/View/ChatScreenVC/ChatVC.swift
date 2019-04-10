//
//  ChatVC.swift
//  DcodrTask
//
//  Created by Subham Padhi on 09/04/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class ChatVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        view.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1647058824, blue: 0.2117647059, alpha: 1)
        setUpViews()
    }
    
    func setUpNavigationBar() {
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2431372549, green: 0.2549019608, blue: 0.3254901961, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Dev Chats"
        titleLabel.font = UIFont.systemFont(ofSize: 17.0, weight: UIFont.Weight.light)
        titleLabel.textColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
        navigationItem.titleView = titleLabel
    }
    
    var openChatButton: UIButton = {
        
        let sendButton = UIButton(type: .system)
        sendButton.setTitle("Click Here", for: UIControl.State())
        sendButton.titleLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        sendButton.addTarget(self, action: #selector(handleOnClick), for: .touchUpInside)
        return sendButton
    }()
    
    @objc func handleOnClick() {
        let vc = ChatScreenVC()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setUpViews() {
        
        view.addSubview(openChatButton)
        openChatButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        openChatButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        openChatButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        openChatButton.widthAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
        openChatButton.layer.cornerRadius = 5
    }
}
