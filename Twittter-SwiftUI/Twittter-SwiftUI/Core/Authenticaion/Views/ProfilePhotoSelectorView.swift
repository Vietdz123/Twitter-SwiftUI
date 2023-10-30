//
//  ProfilePhotoSelectorView.swift
//  Twittter-SwiftUI
//
//  Created by MAC on 30/10/2023.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            
            // MARK: - header view
            VStack(alignment: .leading, spacing: 8) {
                HStack { Spacer() }
                
                Text("Create your account")
                    .font(.largeTitle).fontWeight(.semibold)
                
                Text("Add a profile photo")
                    .font(.largeTitle).fontWeight(.semibold)
                
            }
            .padding()
            .frame( height: 260)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color(.systemBlue))
            .cornerRadius(80, corners: [.bottomRight])
            .ignoresSafeArea()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(.systemBlue))
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .padding(.top, 44)
                
            })
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ProfilePhotoSelectorView()
}
