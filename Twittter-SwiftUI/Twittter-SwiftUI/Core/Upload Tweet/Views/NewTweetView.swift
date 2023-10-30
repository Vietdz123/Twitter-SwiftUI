//
//  NewTweetView.swift
//  Twittter-SwiftUI
//
//  Created by MAC on 30/10/2023.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center, spacing: 8) {
                
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Tweet")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(.blue)
                        .clipShape(Capsule())
                })
            
            }
            .padding(.horizontal)
            
            HStack(alignment: .top, spacing: 8) {
                Circle()
                    .frame(width: 64, height: 64)
                
                TextArea(text: $caption, placeHodler: "What's happening?")
            }
            .padding()

        }
    }
}

#Preview {
    NewTweetView()
}
