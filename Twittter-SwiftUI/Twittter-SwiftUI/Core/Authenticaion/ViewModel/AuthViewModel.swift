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
    @Published var tempUserSession: User?
    @Published var didAuthenUser = false
    @Published var user: UserModel?
    
    private let userService = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        fetchUser()
    }
    
    func register(with email: String, with password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let err = error {
                print("DEBUG: \(err.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.tempUserSession = user
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                self.didAuthenUser = true
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
            self.tempUserSession = user
            self.didAuthenUser = true
        }
    }
    
    func signOut() {
        userSession = nil
        tempUserSession = nil
        try? Auth.auth().signOut()
    }
    
    func uploadImageProfile(image: UIImage, completion: @escaping(Bool) -> Void) {
        
        guard let uid = tempUserSession?.uid else {return}
        
        ImageUploader.uploadImage(image: image) { imageURl in
            
            Firestore.firestore().collection("users").document(uid).updateData(["profileImageUrl": imageURl]) { error in
                if error != nil {
                    completion(false)
                } else {
                    self.userSession = self.tempUserSession
                    completion(true)
                }
            }
            
        }
        
    }
    
    func fetchUser() {
        
        guard let uid = userSession?.uid else {return}
        
        self.userService.fetchUser(uid: uid) { user in
            self.user = user
        }
        
    }
    
    
}
