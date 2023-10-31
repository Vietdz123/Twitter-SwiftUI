//
//  UserModel.swift
//  Twittter-SwiftUI
//
//  Created by MAC on 31/10/2023.
//

import FirebaseFirestoreSwift

struct UserModel: Identifiable, Decodable {
    
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    
}


