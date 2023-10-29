//
//  UserRowView.swift
//  Twittter-SwiftUI
//
//  Created by Three Bros on 29/10/2023.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Circle()
                .frame(width: 44, height: 44)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Joker")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text("Heath Legers")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    UserRowView()
}
