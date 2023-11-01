//
//  BottomSheetView.swift
//  Animate-TabBar-BottomSheet
//
//  Created by MAC on 01/11/2023.
//

import SwiftUI

struct BottomView: View {
    
    var nameImages = ["luffy", "anya", "sanji", "sasuke", "sakura"]
    
    var body: some View {
        
        
        ScrollView(.vertical) {
            LazyVStack(spacing: 10) {
                ForEach(nameImages, id: \.self) { name in
                    Image(name)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 200)
                        .clipped()
                }
            }
        }
        
    }
}

struct BottomSheetView: View {
    
    let height: CGFloat
    let spaceCanBack: CGFloat
    
    @State private var locationY: CGFloat = 0
    
    var body: some View {
        
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: height)
            .background(.white)
            .position(y: locationY)
            .gesture(
                DragGesture()
                    .onChanged{ gesture in
                        self.locationY = gesture.location.y
                    }
                    .onEnded { gesture in
                        if gesture.translation.height > spaceCanBack {
                            self.locationY = height
                        } else {
                            
                            
                            
                        }
                    }
            )
        
    }
}



