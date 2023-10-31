//
//  SlideMenuView.swift
//  Twittter-SwiftUI
//
//  Created by Three Bros on 29/10/2023.
//

import SwiftUI
import Kingfisher


struct SlideMenuView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        if let user = viewModel.user {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 16) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 48, height: 48, alignment: .center)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(user.fullname)
                            .font(.headline).bold()
                        
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    HStack(alignment: .center, spacing: 8) {
                        HStack(alignment: .center, spacing: 8) {
                            Text("45")
                                .font(.subheadline)
                                .bold()
                            
                            Text("Followers")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        
                        HStack(alignment: .center, spacing: 8) {
                            Text("45")
                                .font(.subheadline)
                                .bold()
                            
                            Text("Followers")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                    

                }
                .padding(.leading)
                
                ForEach(SlideMenuViewModel.allCases, id: \.rawValue) { option in
                    switch option {
                    case .profile:
                        NavigationLink {
                            ProfileView()
                        } label: {
                            SlideMenuOptionRowView(option: option)
                        }

                    case .lists:
                        NavigationLink {
                            ProfileView()
                        } label: {
                            SlideMenuOptionRowView(option: option)
                        }
                    case .bookmarks:
                        NavigationLink {
                            ProfileView()
                        } label: {
                            SlideMenuOptionRowView(option: option)
                        }
                    case .logout:
                        Button(action: {
                            viewModel.signOut()
                        }, label: {
                            SlideMenuOptionRowView(option: option)
                        })
                    }
                    
                }
                .frame(height: 40)
                .padding(.horizontal)
                .padding(.vertical, 4)
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    SlideMenuView()
}

