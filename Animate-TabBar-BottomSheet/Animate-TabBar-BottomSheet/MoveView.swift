//
//  MoveView.swift
//  Animate-TabBar-BottomSheet
//
//  Created by MAC on 01/11/2023.
//

import SwiftUI

struct MoveView: View {
    @State private var offset: CGSize = .zero
    @State private var lastTranslation: CGSize = .zero
    @State private var location: CGPoint = .zero
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .position(location)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            print("DEBUG: \(gesture.translation) translation")
                            print("DEBUG: \(gesture.location) location")
                            location = gesture.location
                            
                        }
                        .onEnded { gesture in
//                            lastTranslation = CGSize(width: offset.width, height: 0)
                        }
                )
                .onTapGesture {
                    print("DEBUG: qq")
                }
            
            Spacer()
        }
    }
}

#Preview {
    MoveView()
}
