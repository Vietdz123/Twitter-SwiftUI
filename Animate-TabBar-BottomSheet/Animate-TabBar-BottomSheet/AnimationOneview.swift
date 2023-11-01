//
//  AnimationOneview.swift
//  Animate-TabBar-BottomSheet
//
//  Created by MAC on 01/11/2023.
//

import SwiftUI

struct AnimationOneview: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button(action: {
            animationAmount += 1
        }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                .overlay {
                    Circle()
                        .background(.red)
                        .scaleEffect(animationAmount)
                        .transition(.move(edge: .trailing))
                        .animation(.easeInOut, value: animationAmount)
                }
        })
    }
}

#Preview {
    AnimationOneview()
}
