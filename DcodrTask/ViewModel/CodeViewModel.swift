//
//  CodeViewModel.swift
//  DcodrTask
//
//  Created by Subham Padhi on 10/04/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation

struct CodeViewModel {

let code : String?
let codeLanguage : String?
let comments : Int?
let downvotes : Int?
let tags : [String]?
let time : String?
let title : String?
let upvotes : Int?
let userImageUrl : String?
let userName : String?
    
    init(codeResponse: CodeResponse) {
        self.code = codeResponse.code
        self.codeLanguage = codeResponse.codeLanguage
        self.comments = codeResponse.comments
        self.time = codeResponse.time
        self.title = codeResponse.title
        self.userImageUrl = codeResponse.userImageUrl
        self.userName = codeResponse.userName
        self.downvotes = codeResponse.downvotes
        self.tags = codeResponse.tags
        self.upvotes = codeResponse.upvotes
    }
}
