//
//  ContentView.swift
//  DesafioAPI
//
//  Created by Student07 on 13/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            
            
            ZStack {
                
                Color(CGColor(srgbRed: 0.0, green: 0.5, blue: 0.5, alpha: 1))
                    .ignoresSafeArea(.all)
                
                
                VStack {
                    
                    Text("Estacionamento")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    
                    Spacer()
                    ScrollView(showsIndicators: false) {
                        
                        
                        ForEach(viewModel.parking, id: \._id){ index in
                            
                            
                            NavigationLink(destination: EstacionamentoView(park: index)) {
                                Text(index.nomeEstacionamento!)
                                    .padding(10)
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .background(.gray)
                                    .cornerRadius(10)
                                
                                
                                Text("\(index.vagas!) vagas totais")
                                    .foregroundColor(.white)
                                
   
                            }
                            
                        }
                        
                        
                    }
                    
                    Spacer()
                    
                }
                
                
            }
            
        }  .onAppear {
            viewModel.fetch()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
