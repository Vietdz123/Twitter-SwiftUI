//
//  TweetRowView.swift
//  Twittter-SwiftUI
//
//  Created by Three Bros on 29/10/2023.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    HStack(alignment: .center, spacing: 8) {
                        Text("Bruce Wayne")
                            .font(.subheadline)
                            .bold()
                        
                        Text("@batman")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text("2w")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Text("I believe in my heart")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                    
                }
            }
            
            
            HStack(alignment: .center, spacing: 8) {
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                })
                
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}

#Preview {
    TweetRowView()
}
