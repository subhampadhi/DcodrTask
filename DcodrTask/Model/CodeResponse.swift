//
//  CodeResponse.swift
//  DcodrTask
//
//  Created by Subham Padhi on 09/04/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation

struct CodeResponse : Codable {
    
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
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case codeLanguage = "code_language"
        case comments = "comments"
        case downvotes = "downvotes"
        case tags = "tags"
        case time = "time"
        case title = "title"
        case upvotes = "upvotes"
        case userImageUrl = "user_image_url"
        case userName = "user_name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        codeLanguage = try values.decodeIfPresent(String.self, forKey: .codeLanguage)
        comments = try values.decodeIfPresent(Int.self, forKey: .comments)
        downvotes = try values.decodeIfPresent(Int.self, forKey: .downvotes)
        tags = try values.decodeIfPresent([String].self, forKey: .tags)
        time = try values.decodeIfPresent(String.self, forKey: .time)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        upvotes = try values.decodeIfPresent(Int.self, forKey: .upvotes)
        userImageUrl = try values.decodeIfPresent(String.self, forKey: .userImageUrl)
        userName = try values.decodeIfPresent(String.self, forKey: .userName)
    }
}
