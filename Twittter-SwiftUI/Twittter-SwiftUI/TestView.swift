//
//  TestView.swift
//  Twittter-SwiftUI
//
//  Created by MAC on 30/10/2023.
//

import SwiftUI

struct TestView: View {
    var body: some View {

        VStack(alignment: .leading, spacing: 8) {
            HStack { Spacer() }
            
            Text("Hello.")
                .font(.largeTitle).fontWeight(.semibold)
            
            Text("Welcome Back")
                .font(.largeTitle).fontWeight(.semibold)
        }
//        .frame(maxWidth: self.withScreen)
        .padding()
        .frame(width: self.withScreen - 200)
        .frame(height: 320)
        .padding()
        .padding(50)
        .background(.blue)
        
        Text("Hello, World!")
            .frame(width: 200, height: 100)
            .foregroundColor(.blue)
            .padding()
            .padding()
            .padding(50)
            .background(.yellow)
            
        
    }
}




#Preview {
    TestView()
}
