//
//  ViewController.swift
//  DcodrTask
//
//  Created by Subham Padhi on 09/04/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setUpViews()
    }
    
    var openChatButton: UIButton = {
        
        let sendButton = UIButton(type: .system)
        sendButton.setTitle("Click Here", for: UIControl.State())
        sendButton.titleLabel?.textColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        sendButton.addTarget(self, action: #selector(handleOnClick), for: .touchUpInside)
        return sendButton
    }()
    
    @objc func handleOnClick() {
        
    }
    
    func setUpViews() {
        
        view.addSubview(openChatButton)
        openChatButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        openChatButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        openChatButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        openChatButton.widthAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
    }
    


}

