//
//  ReadMoreCard.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/27/24.
//

import SwiftUI

struct ReadMoreCard: View {
    let text: String
    let maxLines: Int
    @State private var isExpanded: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(text)
                .lineLimit(isExpanded ? nil : maxLines) // Limit the number of lines if not expanded
                .fixedSize(horizontal: false, vertical: true)// Allow the text to wrap
                .font(.system(size: 12))
            Button(action: {
                isExpanded.toggle()
            }) {
                Text(isExpanded ? "Read Less" : "Read More")
                    .foregroundColor(.blue)
                    .font(.system(size: 12))
            }
        }
    }
}


#Preview {
    ReadMoreCard(text: "this is my text aoidjkalsmdlknasd oejpjapd;asm;ldmasmd,.amsdkl;ma;mdkl;am;sdm;ad jajd;m a;smdamslkdm ;asmdk;l amldmlamsdnalsnd la nsdklnasldnasndlknalsdnl nalsdnlkansdlknadnlawndkanwdklnaslkkdnlansdkjabsdabndkajsndansm,dna,sdnasndkasndlkasndasnd", maxLines: 3)
}
