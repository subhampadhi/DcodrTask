//
//  ChatScreenCells.swift
//  DcodrTask
//
//  Created by Subham Padhi on 09/04/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class IncommingChatMessageCell: UITableViewCell {
    
    var chatViewModel: ChatViewModel! {
        
        didSet {
            senderNameLabel.text = chatViewModel.user_name
            let image = URL(string: chatViewModel.user_image_url!)
            profileImage.kf.setImage(with:image)
            messageText.text = chatViewModel.text
        }
    }
    
    var profileImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.contentMode = UIView.ContentMode.scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.borderColor = #colorLiteral(red: 0.9411764706, green: 0.5019607843, blue: 0.5019607843, alpha: 1)
        view.layer.borderWidth = 1
        view.clipsToBounds = true
        return view
    }()
    
    var bubbleView : UIView = {
        
        let view =  UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.backgroundColor = #colorLiteral(red: 0.8039215686, green: 0.3607843137, blue: 0.3607843137, alpha: 1)
        return view
    }()
    
    var timeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "IBMPlexSans-SemiBoldItalic", size: 16)
        label.text = "9:30 AM"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    var senderNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "IBMPlexSans-SemiBoldItalic", size: 18)
        label.text = "Subham Padhi"
        label.textColor = #colorLiteral(red: 0.9411764706, green: 0.5019607843, blue: 0.5019607843, alpha: 1)
        return label
    }()
    
    var messageText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "IBMPlexSans-Light", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello this is a test message for you"
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        backgroundColor =  #colorLiteral(red: 0.1568627451, green: 0.1647058824, blue: 0.2117647059, alpha: 1)
    }
    
    func setUpView() {
        
        addSubview(profileImage)
        addSubview(senderNameLabel)
        addSubview(bubbleView)
        bubbleView.addSubview(timeLabel)
        bubbleView.addSubview(messageText)
        
        profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        senderNameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10).isActive = true
        senderNameLabel.topAnchor.constraint(equalTo: profileImage.topAnchor).isActive = true
        
        bubbleView.leadingAnchor.constraint(equalTo: profileImage.leadingAnchor, constant: 10).isActive = true
        bubbleView.widthAnchor.constraint(equalToConstant:frame.width * 0.75).isActive = true
        bubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        bubbleView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10).isActive = true
        
        messageText.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 10).isActive = true
        messageText.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 10).isActive = true
        messageText.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -10).isActive = true
        
        timeLabel.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -10).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class OutgoingChatMessageCell : UITableViewCell {
    
    var chatViewModel: ChatViewModel! {
        
        didSet {
            senderNameLabel.text = chatViewModel.user_name
            let image = URL(string: chatViewModel.user_image_url!)
            profileImage.kf.setImage(with:image)
            messageText.text = chatViewModel.text
        }
    }
    
    var profileImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.contentMode = UIView.ContentMode.scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.borderColor = #colorLiteral(red: 0.3921568627, green: 0.5843137255, blue: 0.9294117647, alpha: 1)
        view.layer.borderWidth = 1
        view.clipsToBounds = true
        return view
    }()
    
    var bubbleView : UIView = {
        
        let view =  UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.backgroundColor = #colorLiteral(red: 0.3843137255, green: 0.4470588235, blue: 0.6431372549, alpha: 1)
        return view
    }()
    
    var timeLabel : UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "IBMPlexSans-SemiBoldItalic", size: 16)
        label.text = "9:30 AM"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    var senderNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "IBMPlexSans-SemiBoldItalic", size: 18)
        label.text = "Subham Padhi"
        label.textColor = #colorLiteral(red: 0.3921568627, green: 0.5843137255, blue: 0.9294117647, alpha: 1)
        return label
    }()
    
    var messageText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "IBMPlexSans-Light", size: 18)
        label.text = "Hello this is a test message for you"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1647058824, blue: 0.2117647059, alpha: 1)
    }
    
    func setUpView() {
        
        addSubview(profileImage)
        addSubview(senderNameLabel)
        addSubview(bubbleView)
        bubbleView.addSubview(timeLabel)
        bubbleView.addSubview(messageText)
        
        profileImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        senderNameLabel.trailingAnchor.constraint(equalTo: profileImage.leadingAnchor, constant: -10).isActive = true
        senderNameLabel.topAnchor.constraint(equalTo: profileImage.topAnchor).isActive = true
        
        bubbleView.trailingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: -10).isActive = true
        bubbleView.widthAnchor.constraint(equalToConstant:frame.width * 0.75).isActive = true
        bubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        bubbleView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10).isActive = true
        
        messageText.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 10).isActive = true
        messageText.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 10).isActive = true
        messageText.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -10).isActive = true
        
        timeLabel.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -10).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


