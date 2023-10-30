//
//  AuthViewModel.swift
//  Twittter-SwiftUI
//
//  Created by MAC on 30/10/2023.
//

import SwiftUI
import FirebaseAuth
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func register(with email: String, with password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let err = error {
                print("DEBUG: \(err.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.userSession = user
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { eror in
                print("DEBUG: \(eror?.localizedDescription) erro")
            }
        }
    }
    
    func login(with email: String, with password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let err = error {
                print("DEBUG: \(err.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.userSession = user
            print("DEBUG: login successfully \(self.userSession)")
        }
    }
    
    func signOut() {
        userSession = nil
        
        try? Auth.auth().signOut()
    }
    
    
}
