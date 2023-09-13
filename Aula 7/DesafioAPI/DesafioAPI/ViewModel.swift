//
//  ViewModel.swift
//  DesafioAPI
//
//  Created by Student07 on 13/09/23.
//

import Foundation

struct Carro: Decodable, Hashable {
    let modelo : String?
    let ano : Int?
    let cor : String?
    let preco : Double?
    let vaga : Int?
    let imagem : String?
}



struct Estacionamento: Decodable, Hashable {
    let _id : String?
    let nomeEstacionamento : String?
    let vagas : Int?
    let carro : [Carro]
}


class ViewModel : ObservableObject {
    @Published var parking : [Estacionamento] = []
    
    func fetch(){
        guard let url = URL(string: "http://127.0.0.1:1880/get/all" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Estacionamento].self, from: data)
                
                DispatchQueue.main.async {
                    self?.parking = parsed
                }
            }catch{
                print(error)
            }
        }
        
        
        task.resume()
    }
    
    
    func post() {
        
        
        
        
    }
    
    
    
    
   
}
