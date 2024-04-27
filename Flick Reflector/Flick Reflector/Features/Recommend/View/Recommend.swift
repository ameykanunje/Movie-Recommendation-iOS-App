//
//  Recommend.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/24/24.
//

import SwiftUI

@MainActor
struct Recommend: View {
    @StateObject private var vm = RecommendViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(vm.recommendedMovie, id: \.name){ movie in
                        RecommendCard(recommendedMovie: movie)
                }
            }
            .navigationTitle("Recommended Movies")
            .navigationBarItems(leading: Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    })
        }
    }
}

#Preview {
    Recommend()
}
