//
//  EstacionamentoView.swift
//  DesafioAPI
//
//  Created by Student07 on 13/09/23.
//

import SwiftUI



struct EstacionamentoView: View {
    
    @State var park : Estacionamento
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Text(park.nomeEstacionamento!)
                    .font(.largeTitle)
                
                Spacer()
                
                ForEach(park.carro, id: \.modelo) {
                    carro in
                    
                    NavigationLink(destination: CarroView(car: carro)) {
                        Text("\(carro.modelo!)")
                    }
                    
                   
                    
                    
                    
                }
                
                Spacer()
                
            }
        }
      
     
        
       
        
        
    }
}

