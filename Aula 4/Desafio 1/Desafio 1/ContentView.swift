//
//  ContentView.swift
//  Desafio 1
//
//  Created by Student07 on 05/09/23.
//

import SwiftUI
struct ContentView: View {
    
    struct Song : Identifiable {
        var id: Int
        var name : String
        var artist : String
        var capa : String
    }
    
    var musicas  = [
        Song(id: 1, name: "World Hold On", artist: "Bob Sinclair", capa: "https://i.scdn.co/image/ab67616d00001e02d5905ba1475fa3e7f068147b"),
        
        Song(id: 2, name: "HYAENA", artist: "Travis Scott", capa: "https://i.scdn.co/image/ab67616d00001e02881d8d8378cd01099babcd44"),
        
        Song(id: 3, name: "SIRENS", artist: "Travis Scott", capa: "https://i.scdn.co/image/ab67616d00001e02881d8d8378cd01099babcd44"),
        Song(id: 4, name: "PARASAIL", artist: "Travis Scott", capa: "https://i.scdn.co/image/ab67616d00001e02881d8d8378cd01099babcd44"),
        
        Song(id: 5, name: "Annihilate - Spider Man", artist: "Metro Boomin", capa: "https://i.scdn.co/image/ab67616d00001e02687ed0f52df9d126a72b334d"),
        Song(id: 6, name: "Amend", artist: "jˆpˆn", capa: "https://i.scdn.co/image/ab67616d00001e02eea8172ccebc3bff952e92bf")
    ]
    
    
    struct Playlist : Identifiable {
        var id : Int
        var name : String
        var capa : String
    }
    
    
    var playlists = [
    
        Playlist(id: 1, name : "One",  capa: "https://cdn.wallpapersafari.com/96/46/OhDwys.png"),
        
        Playlist(id: 2, name: "Two", capa: "https://img.freepik.com/premium-photo/two-illustration-number-with-chrome-effects-red-fire-black-background_27525-7408.jpg?w=2000"),
        
        Playlist(id: 3, name: "Three", capa: "https://img.freepik.com/premium-photo/three-illustration-number-with-chrome-effects-blue-fire-black-background_27525-7360.jpg"),
        
        Playlist(id: 4, name: "Four", capa: "https://img.freepik.com/premium-photo/four-illustration-number-with-chrome-effects-red-fire-black-background_27525-7372.jpg?w=2000")
        
    ]
    
    
    @State var username = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image("hackatruck")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200)
                    
                    Text("HackaFM")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    HStack {
                        Image("hackatruck")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                        Text("HackaSong")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .padding(.leading, -180)
                    
                    ForEach(musicas) { musica in
                        NavigationLink(destination: MusicaView(name: musica.name, artist: musica.artist, capa: musica.capa)) {
                            HStack {
                                AsyncImage(url: URL(string: musica.capa)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                } placeholder: {
                                    MusicaView(name: musica.name, artist: musica.artist, capa: musica.capa)
                                }
                                VStack {
                                    Text(musica.name)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.trailing)
                                        .padding(.leading, -100)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.title3)
                                    Text(musica.artist)
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.trailing)
                                        .padding(.leading, -100)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.title3)
                                }
                                
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.white)
                           
                                
                            }
                            .padding(10)
                        }
                    }
                    
                    
                    Text("Sugeridos")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(.leading, -180)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(playlists) { playlist in
                                VStack {
                                    AsyncImage(url: URL(string: playlist.capa)) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .padding(10)
                                    } placeholder: {
                                        Text("")
                                    }
                                    Text(" \(playlist.id) - \(playlist.name)")
                                        .foregroundColor(.white)
                                }
                          
                            }
                
                        }
                    }
                    
                
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            )
            .navigationBarTitle("Músicas", displayMode: .inline)
            .foregroundColor(.white)
            
           
            
        }
        
        
        
        .accentColor(.white)
        
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
