//
//  SlideMenuViewModel.swift
//  Twittter-SwiftUI
//
//  Created by Three Bros on 29/10/2023.
//

import SwiftUI

enum SlideMenuViewModel: Int, CaseIterable {
    
    case profile
    case lists
    case bookmarks
    case logout
    
    var description: String {
        switch self {
        case .profile:
            return "Profile"
        case .lists:
            return "Lists"
        case .bookmarks:
            return "Bookmarks"
        case .logout:
            return "Logout"
        }
    }
    
    var imageName: String {
        switch self {
        case .profile:
            return "person"
        case .lists:
            return "list.bullet"
        case .bookmarks:
            return "bookmark"
        case .logout:
            return "arrow.left.square"
        }
    }
    
}
