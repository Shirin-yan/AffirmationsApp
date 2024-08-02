//
//  SelectionCardView.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 01.08.2024.
//

import SwiftUI

struct SelectionCardView: View {
    var title: String
    var selected: String
    
    var body: some View {
        HStack {
            Text(LocalizedStringKey(title))
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if selected == title {
                Image(systemName: "largecircle.fill.circle")
                    .foregroundStyle(.purple)
            } else {
                Image(systemName: "circle")
                    .foregroundStyle(.gray)
            }
        }.padding()
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(selected == title ? Color.purple : Color.gray, lineWidth: 1))
            .contentShape(Rectangle())
    }
}

#Preview {
    VStack {
        SelectionCardView(title: "QWERTY", selected: "QWERTY")
        SelectionCardView(title: "QWERTY", selected: "QWRTY")
    }
}
