//
//  CodeCells.swift
//  DcodrTask
//
//  Created by Subham Padhi on 09/04/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit
import TagListView
import Kingfisher

class SearchResultsCell: UITableViewCell , TagListViewDelegate  {
    
    var codeViewModel: CodeViewModel! {
        
        didSet {
            let image = URL(string: codeViewModel.userImageUrl!)
            profileImage.kf.setImage(with:image)
            profileNameLabel.text = codeViewModel.userName
            codeTitleLabel.text = codeViewModel.code
            
            let likeUnlikeCount = (codeViewModel.upvotes! - codeViewModel.downvotes!)
            upVoteCountLabel.text = "\(likeUnlikeCount)"
            
            commentsNumberLabel.text = "\(codeViewModel.comments!)"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1647058824, blue: 0.2117647059, alpha: 1)
        listView.delegate = self
        initViews()
        
    }
    
    var listView: TagListView = {
        let view = TagListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .center
        view.paddingX = 15
        view.paddingY = 10
        view.borderColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
        view.selectedTextColor = #colorLiteral(red: 0, green: 0.7963638902, blue: 0.2587642372, alpha: 1)
        view.borderWidth = 1
        view.cornerRadius = 17
        view.tagBackgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.selectedBorderColor = #colorLiteral(red: 0, green: 0.7963638902, blue: 0.2587642372, alpha: 1)
        view.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        view.marginX = 10
        view.marginY = 10
        view.textFont = UIFont(name: "IBMPlexSans-Bold", size: 14)!
        view.clipsToBounds = true
        return view
    }()

    
    var profileImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = UIView.ContentMode.scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor  = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        view.clipsToBounds = true
        return view
    }()
    
    var upvoteDownVoteImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = UIView.ContentMode.scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = #imageLiteral(resourceName: "upvote_downvote")
        return view
    }()
    
    var commentImageLabel: UIImageView = {
        let view = UIImageView()
        view.contentMode = UIView.ContentMode.scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = #imageLiteral(resourceName: "comment")
        return view
    }()
    
    var profileNameLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Subham Padhi"
        label.font = UIFont(name: "IBMPlexSans-Italic", size: 14)
        label.textColor = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9803921569, alpha: 1)
        return label
    }()
    
    var codeTitleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My First Project"
        label.font = UIFont(name: "IBMPlexSans-Bold", size: 20)
        label.textColor = #colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 0.9921568627, alpha: 1)
        return label
    }()
    
    var commentsNumberLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2"
        label.font = UIFont(name: "IBMPlexSans-Bold", size:16)
        label.textColor = #colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 0.9921568627, alpha: 1)
        return label
    }()
    
    var upVoteCountLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "+25"
        label.font = UIFont(name: "IBMPlexSans-Bold", size:16)
        label.textColor = #colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 0.9921568627, alpha: 1)
        return label
    }()
    
    
    var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 0.9921568627, alpha: 1)
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initViews() {
        
        addSubview(mainView)
        mainView.addSubview(profileImage)
        mainView.addSubview(codeTitleLabel)
        mainView.addSubview(profileNameLabel)
        mainView.addSubview(listView)
        mainView.addSubview(commentImageLabel)
        mainView.addSubview(commentsNumberLabel)
        mainView.addSubview(upVoteCountLabel)
        mainView.addSubview(upvoteDownVoteImage)
        
        mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant:15).isActive = true
        mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:-15).isActive = true
        mainView.topAnchor.constraint(equalTo: topAnchor, constant:15).isActive = true
        mainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant:-15).isActive = true
        mainView.layer.cornerRadius = 10
        
        
        profileImage.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        profileImage.layer.cornerRadius = 40
        
        codeTitleLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 25).isActive = true
        codeTitleLabel.topAnchor.constraint(equalTo: profileImage.topAnchor , constant: 10).isActive = true
        codeTitleLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15).isActive = true
        
        profileNameLabel.topAnchor.constraint(equalTo: codeTitleLabel.bottomAnchor , constant: 10).isActive = true
        profileNameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 25).isActive = true
        profileNameLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15).isActive = true
        
        listView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor , constant: 5).isActive = true
        listView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -5).isActive = true
        listView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10).isActive = true
        
        commentsNumberLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -25).isActive = true
        commentsNumberLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15).isActive = true
        
        
        commentImageLabel.trailingAnchor.constraint(equalTo: commentsNumberLabel.leadingAnchor, constant: -2).isActive = true
        commentImageLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15).isActive = true
        commentImageLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        commentImageLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        upVoteCountLabel.trailingAnchor.constraint(equalTo: commentImageLabel.leadingAnchor, constant: -15).isActive = true
        upVoteCountLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15).isActive = true
        
        
        upvoteDownVoteImage.trailingAnchor.constraint(equalTo: upVoteCountLabel.leadingAnchor, constant: -2).isActive = true
        upvoteDownVoteImage.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15).isActive = true
        upvoteDownVoteImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        upvoteDownVoteImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
}

class FilterListCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1647058824, blue: 0.2117647059, alpha: 1)
        initViews()
    }
    
    
    var sortByView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var sortBylistImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = UIView.ContentMode.scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = #imageLiteral(resourceName: "triangle")
        return view
    }()
    
    var languageListImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = UIView.ContentMode.scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = #imageLiteral(resourceName: "triangle")
        return view
    }()
    
    var selectLanguageView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var sortBYLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "IBMPlexSans-SemiBold", size: 16)
        label.text = "Trending"
        label.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    var languageByLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "IBMPlexSans-SemiBold", size: 16)
        label.text = "Python"
        label.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initViews() {
       
        addSubview(sortByView)
        sortByView.addSubview(sortBYLabel)
        addSubview(selectLanguageView)
        selectLanguageView.addSubview(languageByLabel)
        sortByView.addSubview(sortBylistImage)
        selectLanguageView.addSubview(languageListImage)
        
        
        sortByView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        sortByView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        sortByView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        sortByView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        selectLanguageView.trailingAnchor.constraint(equalTo: sortByView.leadingAnchor, constant: -10).isActive = true
        selectLanguageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        selectLanguageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        selectLanguageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        languageListImage.trailingAnchor.constraint(equalTo: selectLanguageView.trailingAnchor, constant: -2).isActive = true
        languageListImage.centerYAnchor.constraint(equalTo: selectLanguageView.centerYAnchor).isActive = true
        languageListImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        languageListImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        languageByLabel.leadingAnchor.constraint(equalTo:selectLanguageView.leadingAnchor , constant: 1).isActive = true
        languageByLabel.trailingAnchor.constraint(equalTo:languageListImage.leadingAnchor , constant: -2).isActive = true
        languageByLabel.centerYAnchor.constraint(equalTo: selectLanguageView.centerYAnchor).isActive = true
        
        sortBylistImage.trailingAnchor.constraint(equalTo: sortByView.trailingAnchor, constant: -2).isActive = true
        sortBylistImage.centerYAnchor.constraint(equalTo: sortByView.centerYAnchor).isActive = true
        sortBylistImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        sortBylistImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        sortBYLabel.leadingAnchor.constraint(equalTo:sortByView.leadingAnchor , constant: 1).isActive = true
        sortBYLabel.trailingAnchor.constraint(equalTo:sortBylistImage.leadingAnchor , constant:-2).isActive = true
        sortBYLabel.centerYAnchor.constraint(equalTo: sortByView.centerYAnchor).isActive = true
        
    }
}

