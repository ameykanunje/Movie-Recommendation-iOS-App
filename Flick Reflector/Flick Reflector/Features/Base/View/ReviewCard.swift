//
//  ReviewCard.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/22/24.
//

import SwiftUI

struct ReviewCard: View {
    let review : Review

    var body: some View {
            VStack(alignment: .leading){
                HStack{
                    //Author Image
                    AsyncImage(url: URL(string: review.authorImage)) { image in
                        image
                            .resizable()
                    }placeholder: {
                        ZStack{
                            Color.secondary
                            
                            if let firstChar = review.authorName.first {
                                Text(String(firstChar))
                            }
                        }
                    }
                    .scaledToFill()
                    .frame(width: 25, height: 25)
                    .clipShape(Circle())
                    
                    //Author Name
                    Text("\(review.authorName) |")
                    
                    //Author Rating
                    HStack {
                        //Image(systemName: "star.fill")
                        Text("\(review.authorRating)/10")
                    }
                    .font(.system(size: 12))
                    
                }
                //Read More
                ReadMoreCard(text: review.content, maxLines: 4)
                
                //line between reviews
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundColor(.white)
            }
        }
    }

#Preview {
    ReviewCard(review: DeveloperPreview.instance.review)
}
