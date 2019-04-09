//
//  MessageResponse.swift
//  DcodrTask
//
//  Created by Subham Padhi on 09/04/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation

struct MessageResponse : Codable {
    
    let isSentByMe : Bool?
    let text : String?
    let userImageUrl : String?
    let userName : String?
    
    enum CodingKeys: String, CodingKey {
        case isSentByMe = "is_sent_by_me"
        case text = "text"
        case userImageUrl = "user_image_url"
        case userName = "user_name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isSentByMe = try values.decodeIfPresent(Bool.self, forKey: .isSentByMe)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        userImageUrl = try values.decodeIfPresent(String.self, forKey: .userImageUrl)
        userName = try values.decodeIfPresent(String.self, forKey: .userName)
    }

}
