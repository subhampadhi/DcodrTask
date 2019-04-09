//
//  ChatScreenVC.swift
//  DcodrTask
//
//  Created by Subham Padhi on 09/04/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class ChatScreenVC: UIViewController, UITextFieldDelegate , UITableViewDelegate , UITableViewDataSource {
    
    var chatViewModel = [ChatViewModel]()
    
    
    lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Enter Message ....",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    var chatTable: UITableView = {
        let view = UITableView()
        view.separatorStyle = .none
        view.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1647058824, blue: 0.2117647059, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1647058824, blue: 0.2117647059, alpha: 1)
        setUpNavigationBar()
        setupInputComponents()
        getJson(url: Utils.GET_MESSAGES_API)
        
    }
    
    func setUpNavigationBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2431372549, green: 0.2549019608, blue: 0.3254901961, alpha: 1)
        let navLabel = UILabel()
        let navTitle = NSMutableAttributedString(string: "Welcome to Dev Chat", attributes:[
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.0, weight: UIFont.Weight.light)])
        navLabel.attributedText = navTitle
        self.navigationItem.titleView = navLabel
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
    }
    
    func getJson(url: String) {
        
        guard let url = URL(string:url) else {return}
        URLSession.shared.dataTask(with: url) { (data, response
            , error) in
            if let error = error {
                Utils.showAlert(title: "Oops", message: "\(error.localizedDescription)", presenter: self)
            }
            
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            do {
                let json:AnyObject =  try (JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0)) as? NSArray)!
                print(json)
                let decoder = JSONDecoder()
                let value = try decoder.decode([MessageResponse]?.self, from: data)
                for v in value! {
                    print(v.isSentByMe!)
                }
                self.chatViewModel = value?.map({return ChatViewModel(messageResponse: $0)}) ?? []
                DispatchQueue.main.async {
                    self.chatTable.reloadData()
                }
            } catch let err {
                Utils.showAlert(title: "Oops", message: "\(err.localizedDescription)", presenter: self)
            }
            }.resume()
    }
    
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.chatViewModel.count, section: 0)
            self.chatTable.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    var sendButton: UIButton = {
        
        let sendButton = UIButton(type: .system)
        sendButton.setTitle("Send", for: UIControl.State())
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.addTarget(self, action: #selector(handleSend), for: .touchUpInside)
        return sendButton
    }()
    
    
    func setupInputComponents() {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        chatTable.dataSource = self
        chatTable.delegate = self
        
        view.addSubview(containerView)
        view.addSubview(chatTable)
        
        chatTable.register(IncommingChatMessageCell.self, forCellReuseIdentifier: "incommingChatMessageCell")
        chatTable.register(OutgoingChatMessageCell.self, forCellReuseIdentifier: "outgoingChatMessageCell")
        
        
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 15).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant:-15).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
        containerView.layer.cornerRadius = 25
        containerView.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1647058824, blue: 0.2117647059, alpha: 1)
        
        chatTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        chatTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        chatTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        chatTable.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: -5).isActive = true
        
        containerView.addSubview(sendButton)
        
        sendButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        sendButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant:50).isActive = true
        
        
        
        containerView.addSubview(inputTextField)
        
        inputTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: 10).isActive = true
        inputTextField.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        inputTextField.trailingAnchor.constraint(equalTo: sendButton.trailingAnchor).isActive = true
        inputTextField.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
        let separatorLineView = UIView()
        separatorLineView.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
        separatorLineView.translatesAutoresizingMaskIntoConstraints = false
        separatorLineView.layer.borderWidth = 1
        
    }
    
    
    func getDateTime() -> String {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        let dateTime = formatter.string(from: currentDateTime)
        return dateTime
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var frame = tableView.frame.width * 0.75
        frame = frame - 30
        let size = Utils.calculateTextHeightForTableView(approxWidth: frame, string: chatViewModel[indexPath.row].text ?? "", fontName: "IBMPlexSans-Light", fontSize: 18)
        return size + 100
    }
    
    @objc func handleSend() {}
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        handleSend()
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = chatViewModel[indexPath.row]
        if message.is_sent_by_me! {
            let cell = tableView.dequeueReusableCell(withIdentifier: "outgoingChatMessageCell") as! OutgoingChatMessageCell
            cell.chatViewModel = message
            cell.selectionStyle = .none
            return cell
            
        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "incommingChatMessageCell") as! IncommingChatMessageCell
            cell.chatViewModel = message
            cell.selectionStyle = .none
            return cell
        }
    }
}

