//
//  ChatViewModel.swift
//  DcodrTask
//
//  Created by Subham Padhi on 09/04/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation

struct ChatViewModel {
    
    let user_name: String?
    let user_image_url: String?
    let is_sent_by_me: Bool?
    let text: String?
    
    // DI
    
    init(messageResponse: MessageResponse) {
        self.user_name = messageResponse.userName
        self.user_image_url = messageResponse.userImageUrl
        self.text = messageResponse.text
        self.is_sent_by_me = messageResponse.isSentByMe
    }
}
