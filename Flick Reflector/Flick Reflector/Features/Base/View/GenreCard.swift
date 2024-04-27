//
//  GenreCard.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/18/24.
//

import SwiftUI

struct GenreCard: View {
    let genre : Genre
    let namespace : Namespace.ID
    @Binding var selectedGenre : Genre
    
    
    var body: some View {
        Text(genre.name)
            .font(.system(size: 18))
            .fontWeight(genre.id == selectedGenre.id ? .bold : .semibold)
            .background(
                ZStack{
                    if(selectedGenre.id == genre.id){
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.primary)
                            .frame(height: 3)
                            .offset(y: 20)
                            .matchedGeometryEffect(id: "GenreCard", in: namespace)
                    }
                }
            )
            .padding()
    }
}

#Preview {
    GenreCard(genre : DeveloperPreview.instance.genre, namespace: Namespace().wrappedValue, selectedGenre: .constant(DeveloperPreview.instance.genre))
}
