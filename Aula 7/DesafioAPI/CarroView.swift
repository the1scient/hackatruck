//
//  CarroView.swift
//  DesafioAPI
//
//  Created by Student07 on 13/09/23.
//

import SwiftUI

struct CarroView: View {
    
    @State var car : Carro

    var body: some View {
        ZStack {
            
            
            VStack {
                
                HStack {
                    
                   
                    
                    Text("🚘  \(car.modelo!)")
                        .font(.largeTitle)
                }
               
                AsyncImage(url: URL(string: car.imagem!)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                } placeholder: {
                    Color.gray.opacity(0.1)
                }
                
                
                Spacer()
                    .frame(height: 100)
                
                Text("Informações do Carro:")
                    .font(.title2)
                
                Text("Ano: " + String(car.ano!))
                
                Text("Vaga Atual: \(car.vaga!)")
          
                HStack {
                    
                    Text("Cor: ")
                    
                    switch car.cor {
                    case "azul":
                        Rectangle()
                            .fill(.blue)
                            .frame(width: 100, height: 30)
                    case "vermelho":
                       Rectangle()
                            .fill(.red)
                            .frame(width: 100, height: 30)
                    case "preto":
                       Rectangle()
                            .fill(.black)
                            .frame(width: 100, height: 30)
                    case "verde":
                        Rectangle()
                            .fill(.green)
                            .frame(width: 100, height: 30)
                        
                    case "branco":
                        Rectangle()
                            .fill(.white)
                            .frame(width: 100, height: 30)
                    case "amarelo":
                        Rectangle()
                            .fill(.yellow)
                            .frame(width: 100, height: 30)
                    case .none:
                        Color(.white)
                    case .some(_):
                        Color(.white)
                            .ignoresSafeArea(.all)
                    }
                }
              
                
                Text("Preço: \(car.preco!, specifier: "%.3f")")
                
                
            }
        }
       
        
        
    }
}
