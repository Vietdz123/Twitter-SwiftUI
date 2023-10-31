//
//  ImageUploader.swift
//  Twittter-SwiftUI
//
//  Created by MAC on 31/10/2023.
//

import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_imae/\(filename)")
        
        ref.putData(imageData) { _, error in
            if let error = error {
                return
            }
            
            ref.downloadURL { url, _ in
                guard let imageurl = url?.absoluteString else {return}
                
                completion(imageurl)
            }
        }
    }
    
}
