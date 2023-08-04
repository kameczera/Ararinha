//
//  AjudaView.swift
//  test
//
//  Created by Student17 on 27/04/23.
//

import SwiftUI

struct AjudaView: View {
    @Binding var bonequinho: String
    
    @StateObject var t1 = TesteViewModel()
    
    var body: some View {
        VStack {
            Text("Quem deve te ajudar?").font(.title)
            
            Spacer()
            
            HStack{
                
                Button{
                    bonequinho = "homem"
                    t1.selectTab = 2
                    
                } label: {
                    VStack{
                        Image("corpoHomem").resizable().scaledToFit().frame(width: 230, height: 300)
                        Text("Homem")
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(Color.black)
                            
                    }
                }
                
                Button{
                    bonequinho = "mulher"
                    
                } label:{
                    VStack{
                        Image("corpoMulher").resizable().scaledToFit().frame(width: 230, height: 300)
                        Text("Mulher")
                            .font(.title3)
                            .fontWeight(.medium).foregroundColor(.black)
                            
                    }
                }
                
               
            }.onTapGesture {
                global.selectTab = 2
            }
            
            Spacer()
            
            Text("Arraste para o lado")
            
            Spacer()
            
        }.padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Azul-papagaio"))
        
    }
}
