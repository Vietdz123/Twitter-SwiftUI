//
//  FeedView.swift
//  Twittter-SwiftUI
//
//  Created by Three Bros on 29/10/2023.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        
        ScrollView {
            LazyVStack {
                
                ForEach(0 ... 20, id: \.self) { _ in
                    TweetRowView()
                        .padding()
                }
                
            }
        }
        
    }
}

#Preview {
    FeedView()
}
