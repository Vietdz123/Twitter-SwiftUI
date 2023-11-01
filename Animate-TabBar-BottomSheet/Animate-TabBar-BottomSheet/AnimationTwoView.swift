//
//  ContentView.swift
//  Animate-TabBar-BottomSheet
//
//  Created by MAC on 01/11/2023.
//

import SwiftUI

struct AnimationTwoView: View {
    var nameImages = ["luffy", "anya", "sanji", "sasuke", "sakura"]
    
    @State private var showingExpanded = false
    @Namespace var profileAnimation
    @Namespace var avatarAnimation
    @Namespace var name
    @Namespace var job
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            if showingExpanded {
                expandedView
                    .background(.yellow)
            } else {
                collapedView
                    .background(.red)
            }
            
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
//            .padding(.top, 60)
//            Spacer()
            
        }
        
    }
}

#Preview {
    AnimationTwoView()
}


extension AnimationTwoView {
    
    var collapedView: some View {
        
        HStack(alignment: .center, spacing: 15) {
            Button(action: {
                withAnimation(.smooth) {
                    showingExpanded.toggle()
                }
            }, label: {
                Image("luffy")
                    .resizable()
                    .frame(width: 72, height: 72)
                    .clipShape(Circle())
                    .matchedGeometryEffect(id: profileAnimation, in: profileAnimation)
            })

            
            VStack(alignment: .leading, spacing: 8) {
                Text("Monkey.D.Luffy")
                    .font(.system(size: 18))
                    .bold()
                    .matchedGeometryEffect(id: name, in: name)
                
                Text("I'm IOS Developer")
                    .font(.body)
                    .foregroundColor(.gray)
                    .matchedGeometryEffect(id: job, in: job)
            }
            
        
        }
        .padding()
        
    }
    
    var expandedView: some View {
        
        VStack(alignment: .center, spacing: 8) {

            Button(action: {
                withAnimation(.spring) {
                    showingExpanded.toggle()
                }
                
            }, label: {
                Image("luffy")
                    .resizable()
                    .frame(width: 180, height: 180)
                    .clipShape(Circle())
                    .matchedGeometryEffect(id: profileAnimation, in: profileAnimation)
            })
                
                
            VStack(alignment: .center, spacing: 8) {
                Text("Monkey.D.Luffy")
                    .font(.system(size: 50))
                    .bold()
                    .matchedGeometryEffect(id: name, in: name)
                    .minimumScaleFactor(0.6)
//                    .frame(width: 500)
                
                Text("I'm IOS Developer")
                    .font(.title)
                    .foregroundColor(.red)
                    .matchedGeometryEffect(id: job, in: job)
                    .minimumScaleFactor(0.6)
//                    .frame(width: 500)
            }
        }
        .padding(.top, 150)
                
            
        
        
    }
    
}
