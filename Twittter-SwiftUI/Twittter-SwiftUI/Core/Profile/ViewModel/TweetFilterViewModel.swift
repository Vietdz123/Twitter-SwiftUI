//
//  TweetFilterViewModel.swift
//  Twittter-SwiftUI
//
//  Created by Three Bros on 29/10/2023.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    
    case tweet
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweet:
            return "Tweets"
        case .replies:
            return "Replies"
        case .likes:
            return "likes"
        }
    }
    
}
