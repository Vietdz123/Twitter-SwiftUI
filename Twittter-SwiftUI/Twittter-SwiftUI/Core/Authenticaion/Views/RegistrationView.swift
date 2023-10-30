//
//  RegistrationView.swift
//  Twittter-SwiftUI
//
//  Created by MAC on 30/10/2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var passwork = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            // MARK: - header view
            VStack(alignment: .leading, spacing: 8) {
                HStack { Spacer() }
                
                Text("Get Started.")
                    .font(.largeTitle).fontWeight(.semibold)
                
                Text("Create your account")
                    .font(.largeTitle).fontWeight(.semibold)
                
            }
            .padding()
            .frame( height: 260)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color(.systemBlue))
            .cornerRadius(80, corners: [.bottomRight])
            .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 40) {
                CustomInputField(imageName: "envelope",
                                 placeHolder: "Email",
                                 text: $email)
                
                CustomInputField(imageName: "person",
                                 placeHolder: "Username",
                                 text: $username)
                
                CustomInputField(imageName: "person",
                                 placeHolder: "Fullname",
                                 text: $fullname)
                
                CustomInputField(imageName: "lock",
                                 placeHolder: "Password",
                                 text: $passwork)
                
            }
            .padding(.horizontal, 30)
            
            Button(action: {
                viewModel.register(with: email,
                                   with: passwork,
                                   fullname: fullname,
                                   username: username)
            }, label: {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(.headline)
                    .frame(width: withScreen - 60, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    
            })
            .padding(.top, 20)
            .shadow(color: .gray.opacity(0.5), radius: 10)
            
            Spacer()
            
            
            Button(action: {
                dismiss()
            }, label: {
                HStack(alignment: .center, spacing: 8) {
                    Text("Already have an account?")
                        .font(.body)
                    
                    Text("Sign In")
                        .font(.headline)
                        .fontWeight(.bold)
                }
                .foregroundColor(Color(.systemBlue))
                .padding(.bottom, 10)
            })

            
            
        }
        .onTapGesture {
            UIApplication.shared.endEditing() 
        }
    }
}

#Preview {
    RegistrationView()
}
