//
//  TextArea.swift
//  Twittter-SwiftUI
//
//  Created by MAC on 30/10/2023.
//

import SwiftUI

struct TextArea: View {
    
    @Binding var text: String
    let placeHodler: String
    
    init(text: Binding<String>, placeHodler: String) {
        self._text = text   //wow
        self.placeHodler = placeHodler
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeHodler)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
                    .zIndex(1)
            }
            
            TextEditor(text: $text)
                .padding(4)
        }

    }
}
