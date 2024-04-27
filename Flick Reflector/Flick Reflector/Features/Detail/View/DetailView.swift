//
//  DetailView.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/20/24.
//

import SwiftUI

enum DetailViewSection: String{
    case about, review
    
    var rawValue: String {
        switch self {
        case .about:
            return "About Movie"
        case .review:
            return "Reviews"
        }
    }
}

struct DetailView: View {
    @StateObject private var vm : DetailViewModel
    @Environment(\.presentationMode) var presentationMode
    @Namespace var namespace
    
    @State private var isRecommendViewPresented = false
    
    
    init(movie : Movie){
        _vm = StateObject(wrappedValue: DetailViewModel(movie: movie))
    }
    
    var body: some View {
        VStack {
            header
            VStack{
                
                HStack{
                    //Calender - Year
                    
                    Image(systemName: "calendar")
                    Text((vm.movie.releaseDate ?? "2021").prefix(4))
                    Text(" | ")
                    //Movie Time
                    Image(systemName: "star.fill")
                    Text("\(vm.movie.voteAverage, specifier: "%.2f")/10")
                    Text(" | ")
                    //Movie Type
                    Image(systemName: "ticket")
                    Text("Action")
                    Text(" | ")
                    Image(systemName: "globe")
                    Text(vm.movie.originalLanguage)

                }
                .offset(y:14)
                .font(.system(size: 14))
                .frame(maxWidth: .infinity)
                
                HStack {
                    ForEach(vm.sections, id: \.self){ section in
                        DetailSectionCard(section: section, namespace: namespace, selectedSection: $vm.selectedSection)
                            .onTapGesture {
                                withAnimation(.easeInOut){
                                    vm.selectedSection = section
                                }
                            }
                    }
                }
                switch vm.selectedSection {
                case .about:
                    Text(vm.movie.overview)
                        .font(.system(size: 14))
                case .review:
                    ScrollView(.vertical, showsIndicators: false){
                        ForEach(vm.reviews){review in
                            ReviewCard(review: review)
                        }
                    }
                    
                }
                Spacer()
            }
            .padding()
            .padding(.top, contentOffset)
        }
        .preferredColorScheme(.dark)
        .background(Color.black)
        .fullScreenCover(isPresented: $isRecommendViewPresented, content: {
            SimilarMovie(movie: vm.movie)
        })
        .task {
            await vm.fetchReviews()
            
        }
        
    }
    
    var backdropImageSize : CGFloat{
        screenHeight * 0.32
    }
    var posterImageHeight : CGFloat{
        screenHeight * 0.12
    }
    var posterImageOffset : CGFloat{
        screenHeight * 0.19
    }
    var contentOffset : CGFloat{
        screenHeight * 0.09
    }
}


private extension DetailView{
    var header: some View {
        ZStack(alignment: .leading){
            ZStack(alignment: .top) {
                CustomImageView(itemWidth: screenWidth, itemHeight: backdropImageSize, movie: vm.movie, imageType: .backdrop)
                
                HStack{
                    Image(systemName: "chevron.left")
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                    Text("Details")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                    Spacer()
                    Image(systemName: "atom")
                        .onTapGesture {
                            isRecommendViewPresented = true
                        }
                }
                .padding()
                .background(Color.black)
            }
            
            HStack{
                CustomImageView(itemWidth: posterImageHeight, itemHeight: posterImageHeight, movie: vm.movie, imageType: .poster)
                    
                Text(vm.movie.title)
                        .minimumScaleFactor(0.5)
                        .padding(.top)
                        .fontWeight(.semibold)
                    .font(.system(size: 24))
                    
            }
            .padding()
            .offset(y: posterImageOffset)
        }
    }
}


#Preview {
    DetailView(movie : DeveloperPreview.instance.movie)
}
