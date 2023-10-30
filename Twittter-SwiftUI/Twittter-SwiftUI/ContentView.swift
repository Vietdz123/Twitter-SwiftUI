//
//  ContentView.swift
//  Twittter-SwiftUI
//
//  Created by Three Bros on 29/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSlideMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                
                //Have login view
                mainView
            }
        }
    
        
    }
    
        
}

#Preview {
    ContentView()
}


extension ContentView {
    var mainView: some View {
        NavigationView {
            
            ZStack(alignment: .topLeading) {
                
                MainTabView()
                    .navigationBarHidden(showSlideMenu)
                
                if showSlideMenu {
                    
                    ZStack {
                        Color.black.opacity(showSlideMenu ? 0.3 : 0.0)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    showSlideMenu = false
                                }
                            }
                        
                    }
                    
                }
                
                SlideMenuView()
                    .frame(width: 300)
                    .background(showSlideMenu ? .white : .clear)
                    .offset(x: showSlideMenu ? 0 : -300)
                  
                
 
                
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            
                            withAnimation(.easeInOut) {
                                self.showSlideMenu.toggle()
                            }
                        }

                }
                
            }
            .onAppear {
                showSlideMenu = false
            }
            
        }
    }
    
}
