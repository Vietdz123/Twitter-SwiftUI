//
//  ProfilePhotoSelectorView.swift
//  Twittter-SwiftUI
//
//  Created by MAC on 30/10/2023.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            
            // MARK: - header view
            VStack(alignment: .leading, spacing: 8) {
                HStack { Spacer() }
                
                Text("Create your account")
                    .font(.largeTitle).fontWeight(.semibold)
                
                Text("Add a profile photo")
                    .font(.largeTitle).fontWeight(.semibold)
                
            }
            .padding()
            .frame( height: 260)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color(.systemBlue))
            .cornerRadius(80, corners: [.bottomRight])
            .ignoresSafeArea()
            
            Button(action: {
                showImagePicker.toggle()
            }, label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                        .padding(.top, 44)
                        
                } else {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color(.systemBlue))
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .padding(.top, 44)
    
                }

                
            })
            .sheet(isPresented: $showImagePicker, onDismiss: {
                loadImage()
            }) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            if let selectedImage = selectedImage {
                
                Button(action: {
                    viewModel.uploadImageProfile(image: selectedImage) { _ in
                        
                    }
                }, label: {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.headline)
                        .frame(width: withScreen - 60, height: 50)
                        .background(.blue)
                        .clipShape(Capsule())
                        
                })
                .shadow(color: .gray.opacity(0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)
    }
}

#Preview {
    ProfilePhotoSelectorView()
}
