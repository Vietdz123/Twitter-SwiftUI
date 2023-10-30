//
//  ProfileView.swift
//  Twittter-SwiftUI
//
//  Created by Three Bros on 29/10/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var selectionFilter: TweetFilterViewModel = .tweet
    @Namespace var animation //what
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        
        ZStack {
            
            
            
            VStack(alignment: .leading, spacing: 12) {
                
                headerView
                
                actionButtons
                
                infoUserView
                
                tweetFilterBarView
                

                tweetView
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
        }
        

        
    }
}

#Preview {
    ProfileView()
}


extension ProfileView {
    
    var headerView: some View {
            ZStack(alignment: .topLeading) {
                
                Color(.systemBlue)
                    .ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 15) {
                    
                    Button(action: {
                        print("DEBUG: qqq")
                        dismiss()
                    }, label: {
                        

                        Image(systemName: "arrow.left")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 16)
                            .foregroundColor(.white)
                            .padding(8)
                            .padding(.leading, 25)
                            
                    })

                    
                    Circle()
                        .frame(width: 72, height: 72)
                        .offset(x: 18, y: 24)
                }

            }
            .frame(height: 96)

        .navigationBarBackButtonHidden(true)
        
        
        
    }
    
    
    var actionButtons: some View {
        HStack(alignment: .center, spacing: 13) {
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "bell.badge")
                    .padding(6)
                    .foregroundColor(.gray)
                    .overlay {
                        Circle()
                            .stroke(.gray, lineWidth: 0.5)
                    }
            })
            
            Text("Edit Profile")
                .bold()
                .font(.subheadline)
                .foregroundColor(.black)
                .frame(width: 120, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray, lineWidth: 0.5)
                }
        }
        .padding(.horizontal)
        .padding(.top, 6)
    }
    
    var infoUserView: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            HStack(alignment: .center, spacing: 8) {
                Text("Heath Ledger")
                    .font(.title).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.blue)
            }
            
            Text("@Joker")
                .foregroundColor(.gray)
                .font(.subheadline)
            
            Text("Hello I'm IOS Developer")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(alignment: .center, spacing: 24) {
                
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("Gotham, NY")
                }
                
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: "link")
                    
                    Text("www.thẹoker.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            
            HStack(alignment: .center, spacing: 24) {
                
                HStack(alignment: .center, spacing: 8) {
                    Text("807")
                        .font(.subheadline)
                        .bold()
                    
                    Text("Followings")
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
            .padding(.vertical)

            
        }
        .padding(.horizontal)
    }
    
    
    var tweetFilterBarView: some View {
        
        HStack(alignment: .center, spacing: 8) {
            
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack(alignment: .center, spacing: 16) {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectionFilter == item ? .semibold : .regular)
                        .foregroundStyle(selectionFilter == item ? .black : .gray)
                    
                    if selectionFilter == item {
                        Capsule()
                            .foregroundColor(.blue)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "qq", in: self.animation) //WTF
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectionFilter = item
                    }
                    
                }
            }
            
        }
        .overlay(alignment: .bottom) {
            Divider()
        }
    }
    
    var tweetView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                
                ForEach(0 ... 20, id: \.self) { _ in
                    TweetRowView()
                        .padding()
                }
                
            }
        }
        
       
    }
    
}
