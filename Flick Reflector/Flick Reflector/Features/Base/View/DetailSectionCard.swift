//
//  DetailSectionCard.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/21/24.
//

import SwiftUI

struct DetailSectionCard: View {
    var section : DetailViewSection
    var namespace : Namespace.ID
    @Binding var selectedSection : DetailViewSection
    
    var body: some View {
        Text(section.rawValue)
            .background(
                ZStack{
                    if section == selectedSection{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height:3)
                            .offset(y: 20)
                            .matchedGeometryEffect(id: "DetailViewSection", in: namespace)
                        
                    }
                }
            )
            .padding()
    }
}

#Preview {
    DetailSectionCard(section: .about, namespace: Namespace().wrappedValue, selectedSection: .constant(.about))
}
