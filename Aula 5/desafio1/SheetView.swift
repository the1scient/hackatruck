//
//  SheetView.swift
//  desafio1
//
//  Created by Student07 on 06/09/23.
//

import SwiftUI

struct SheetView: View {
    
//    @Binding var pais : String
//    @Binding var flag : String
//    @Binding var descricao : String

    
    @Binding var pais2 : Location
    
    var body: some View {
        
        VStack {
            Text(pais2.flag + " - \(pais2.name)")
                .font(.largeTitle)
          
            Spacer()
                .frame(height: 100)
          
            Text(pais2.description)
            
          Spacer()

           
        }
        
        
        
       
    }
}

//struct SheetView_Previews: PreviewProvider {
//    @State(initialValue: "Terra") static var pais : String
//    @State(initialValue: "🌎") static var flag : String
//
//    @State(initialValue: "Planeta Terra") static var descricao : String
//
//
//
//    static var previews: some View {
//
//
//
//
//        SheetView(pais: $pais, flag: $flag, descricao: $descricao)
//    }
//}
