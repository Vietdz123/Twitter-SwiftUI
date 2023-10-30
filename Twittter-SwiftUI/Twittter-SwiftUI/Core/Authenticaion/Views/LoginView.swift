//
//  LoginView.swift
//  Twittter-SwiftUI
//
//  Created by MAC on 30/10/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var passwork = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 8) {
                
                // MARK: - header view
                VStack(alignment: .leading, spacing: 8) {
                    HStack { Spacer() }
                    
                    Text("Hello.")
                        .font(.largeTitle).fontWeight(.semibold)
                    
                    Text("Welcome Back")
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
                    
                    CustomInputField(imageName: "lock",
                                     placeHolder: "Password",
                                     text: $passwork)
                    
                }
                .padding(.horizontal, 30)
                
                HStack {
                    Spacer()
                    
                    NavigationLink {
                        Text("Reset Password")
                    } label: {
                        Button(action: {
                            
                        }, label: {
                            Text("Forgor Password?")
                                .foregroundColor(.blue)
                                .fontWeight(.semibold)
                                .font(.caption)
                        })
                    }


                }
                .padding()
                
                Button(action: {
                    viewModel.login(with: email, with: passwork)
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
                
                Spacer()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarHidden(true)
                        
                } label: {
                    HStack(alignment: .center, spacing: 8) {
                        Text("Don't have an account?")
                            .font(.body)
                        
                        Text("Sign up")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                    .foregroundColor(Color(.systemBlue))
                    .padding(.bottom, 10)
                }

            }
        }
    }
}

#Preview {
    LoginView()
}
