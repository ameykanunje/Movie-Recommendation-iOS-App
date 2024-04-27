//
//  HomeView.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/13/24.
//

import SwiftUI

struct HomeView: View {
    @State private var searchTxt = ""
    @StateObject private var vm = HomeViewModel()
    @Namespace var namespace
    
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                LazyVStack(alignment: .leading, spacing: 20){
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(vm.trendingMovies){ movie in
                                MovieCard(movie: movie, type: .poster)
                                    .onTapGesture {
                                        vm.selectedMovie = movie
                                    }
                            }
                        }
                    }
                    
                    //Genre Names
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(vm.genreMovies){ genre in
                                GenreCard(genre: genre, namespace: namespace, selectedGenre: $vm.selectedGenre)
                                    .onTapGesture {
                                        withAnimation(.easeInOut){
                                            vm.selectedGenre = genre
                                            Task{
                                                await vm.fetchMovies(for: .discoverMovies)
                                            }
                                        }
                                    }
                            }
                        }
                    }
                    //Grid Of Genre Movies
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20){
                        ForEach(vm.moviesForSelectedGenre){ movie in
                            MovieCard(movie: movie, type: .grid)
                                .onTapGesture {
                                    vm.selectedMovie = movie
                                }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Movies")
            .searchable(text: $vm.searchedMovie, placement: .automatic, prompt: Text("Search Movies")){
                if(!vm.searchedMovie.isEmpty){
                        ForEach(vm.filteredMovie){ movie in
                            SearchView(filteredMovie: movie)
                                .onTapGesture {
                                    vm.selectedMovie = movie
                                }
                        }
                    
                }
            }
            .onReceive(vm.$searchedMovie, perform: { _ in
                vm.filterMovies()
            })
        }
        .preferredColorScheme(.dark)
        .fullScreenCover(item: $vm.selectedMovie){ movie in
                DetailView(movie: movie)
        }
        .task {
            await vm.fetchMovies(for: .trending)
            await vm.fetchMovies(for: .topRated)
            await vm.fetchMovies(for: .genre)
        }
    }
}

#Preview {
    HomeView()
}
