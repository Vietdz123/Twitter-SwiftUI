//
//  SlideMenuOptionRowView.swift
//  Twittter-SwiftUI
//
//  Created by Three Bros on 29/10/2023.
//

import SwiftUI

struct SlideMenuOptionRowView: View {
    let option: SlideMenuViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: option.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(option.description)
                .font(.subheadline)
                .foregroundColor(.black)
            
            Spacer()
        }
    }
}

#Preview {
    SlideMenuOptionRowView(option: .bookmarks)
}
