//
//  SearchBar.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/13/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchTxt : String
    
    var body: some View {
        TextField("Search", text : $searchTxt)
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .overlay(
                ZStack {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                        .opacity(searchTxt.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchTxt = ""
                            UIApplication.shared.endEditing()
                        }
                    
                    Image(systemName: "magnifyingglass")
                        .opacity(searchTxt.isEmpty ? 1.0 : 0.0)
                        .foregroundColor(.white)
                }
                , alignment: .trailing)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray)
            )
    }
}

#Preview {
    SearchBar(searchTxt: .constant(""))
}
