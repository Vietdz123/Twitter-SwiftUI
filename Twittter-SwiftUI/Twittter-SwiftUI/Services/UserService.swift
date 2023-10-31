//
//  UserService.swift
//  Twittter-SwiftUI
//
//  Created by MAC on 31/10/2023.
//

import UIKit
import Firebase
import FirebaseStorage

class UserService {
    
    func fetchUser(uid: String, completion: @escaping((UserModel) -> Void)) {
        
        Firestore.firestore().collection("users").document(uid).getDocument { document, _ in
            guard let data = document else {return}
            
            guard var user = try? document?.data(as: UserModel.self) else {return}
            user.id = uid
           
            completion(user)
        }
        
    }
    
    
    
}
