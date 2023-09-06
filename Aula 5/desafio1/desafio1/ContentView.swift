//
//  ContentView.swift
//  desafio1
//
//  Created by Student07 on 06/09/23.
//

import SwiftUI
import MapKit

struct Location : Identifiable {
    let id = UUID()
    let name : String
    let coordinate : CLLocationCoordinate2D
    let flag : String
    let description : String
}


struct ContentView: View {
    

    @State var selected : Location = Location(name: "Brazil", coordinate: CLLocationCoordinate2D(latitude: -14.4129594, longitude: -51.1685985), flag: "🇧🇷", description: "Brazil, officially the Federative Republic of Brazil, is the largest country in South America and in Latin America. Brazil is the world's fifth-largest country by area and the seventh most populous. Its capital is Brasília, and its most populous city is São Paulo. The federation is composed of the union of the 26 states and the Federal District. It is the only country in the Americas to have Portuguese as an official language.[12][13] It is one of the most multicultural and ethnically diverse nations, due to over a century of mass immigration from around the world,[14] and the most populous Roman Catholic-majority country.")
    
    @State var selectedCountry = "Planet Earth"
    @State var selectedCountryFlag = "🌍"
    @State var selectedCountryDesc = "Our Planet :)"
    @State var isSheetPresented = false
    
    @State var region = MKCoordinateRegion (
        center: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),
        span: MKCoordinateSpan(latitudeDelta: 80, longitudeDelta: 0)
    )
    
    var paises = [
        Location(name: "Brazil", coordinate: CLLocationCoordinate2D(latitude: -14.4129594, longitude: -51.1685985), flag: "🇧🇷", description: "Brazil, officially the Federative Republic of Brazil, is the largest country in South America and in Latin America. Brazil is the world's fifth-largest country by area and the seventh most populous. Its capital is Brasília, and its most populous city is São Paulo. The federation is composed of the union of the 26 states and the Federal District. It is the only country in the Americas to have Portuguese as an official language.[12][13] It is one of the most multicultural and ethnically diverse nations, due to over a century of mass immigration from around the world,[14] and the most populous Roman Catholic-majority country."),
        
        
        
        Location(name: "United States of America",
                 coordinate: CLLocationCoordinate2D(latitude: 35.6574178, longitude: -106.975707),
                 flag: "🇺🇸", description: "The United States declared independence on July 4, 1776, becoming the first nation-state founded on Enlightenment principles of unalienable natural rights, ..."
                ),
        
        
        Location(
            name: "Germany",
            coordinate: CLLocationCoordinate2D(
                latitude: 51.0567715, longitude: 10.17445
            ),
            flag: "🇩🇪", description: "Germany, officially the Federal Republic of Germany (German: Bundesrepublik Deutschland), is a country in the western region of Central Europe."
            
        ),
    ]
    

    
    var body: some View {
        
        
        
        VStack {
            
           
                Text("World map")
                    .font(.largeTitle)
                Text("Center")
                    .font(.caption)
                    .onTapGesture {
                        region = MKCoordinateRegion(
                            
                            center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: 80)
                            )
                    }
            
           
            
                Text("\(selectedCountry)")
               
            
            
           
            
            
            ZStack {
                
                Button(action: {
                    isSheetPresented.toggle()
                }) {
                  
                }
                .background(.black.opacity(0.3))
                .sheet(isPresented: $isSheetPresented) {
                   
                    SheetView(pais2: $selected)
                }
                .zIndex(1)
                
                
                Map(coordinateRegion: $region, annotationItems: paises) {
                    pais in
                   
                    MapAnnotation(coordinate: pais.coordinate)
                    {
                        Text(pais.flag)
                            .font(.largeTitle)
                            .fontWeight(Font.Weight.bold)
                            .onTapGesture {
                                
                                selected = pais
                                
//                                selectedCountryFlag = pais.flag
//                                selectedCountryDesc = pais.description
//                                selectedCountry = pais.name
                                isSheetPresented = true
                            }
                            
                        
                    }
                   
                }
                    .frame(width: 400, height: 650)
                
            }
            
            
            
            
            HStack {
                ForEach(paises) { paiss in
                    Button(action: {
                        region = MKCoordinateRegion(
                            center: CLLocationCoordinate2D(
                                latitude: paiss.coordinate.latitude,
                                longitude: paiss.coordinate.longitude
                            ), span: MKCoordinateSpan(latitudeDelta: 60, longitudeDelta: 0)
                        )
                        
                        selectedCountry = paiss.name
                        
                        selectedCountryDesc = paiss.description
                        
                        selectedCountryFlag = paiss.flag
                        
                    }) {
                        Text(paiss.name)
                    }
                    .frame(height: 40)
                    
                }
            }
            
            
            
            Spacer()
        }
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
