//
//  ExploreView.swift
//  Twittter-SwiftUI
//
//  Created by Three Bros on 29/10/2023.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView { //WHy need navigationView
            VStack(alignment: .leading, spacing: 16) {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(0 ... 25, id: \.self) { _ in
                        NavigationLink {
                            ProfileView()
                        } label: {
                            UserRowView()
                        }

                        
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            
        }

    }
}

#Preview {
    ExploreView()
}
