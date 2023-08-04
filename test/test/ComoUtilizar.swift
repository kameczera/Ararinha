//
//  ComoUtilizar.swift
//  test
//
//  Created by Student17 on 26/04/23.
//

import SwiftUI

struct ComoUtilizar: View {
    var buttons: [Botao] = [
        Botao(id: 1, cor: "marrom", imagem: "orelha"),
        Botao(id: 2, cor: "verde", imagem: "dor"),
        Botao(id: 3, cor: "azul", imagem: "emocoes"),
        Botao(id: 4, cor: "amarelo", imagem: "alimentos")
    ]
    var body: some View {
        ZStack{
            Color("rosa").ignoresSafeArea()
            VStack{
                Text("Como Utilizar?").font(.title)
                HStack{
                    ZStack{
                        Color(buttons[0].cor)
                        Image(buttons[0].imagem).resizable().scaledToFit().frame(width: 100, height: 100)
                    }.frame(width: 150,height: 150).cornerRadius(20)
                    Text("Esse botão toca a música preferida da criança.").frame(width: 200, height: 150, alignment: .leading)
                }
                HStack{
                    ZStack{
                        Color(buttons[1].cor)
                        Image(buttons[1].imagem).resizable().scaledToFit().frame(width: 100, height: 100)
                    }.frame(width: 150,height: 150).cornerRadius(20)
                    Text("Esse botão possibilita a criança mostrar onde está com dor.").frame(width: 200, height: 150, alignment: .leading)
                }
                HStack{
                    ZStack{
                        Color(buttons[2].cor)
                        Image(buttons[2].imagem).resizable().scaledToFit().frame(width: 100, height: 100)
                    }.frame(width: 150,height: 150).cornerRadius(20)
                    Text("Esse botão mostra as emoções.").frame(width: 200, height: 150, alignment: .leading)
                }
                HStack{
                    ZStack{
                        Color(buttons[3].cor)
                        Image(buttons[3].imagem).resizable().scaledToFit().frame(width: 100, height: 100)
                    }.frame(width: 150,height: 150).cornerRadius(20)
                    Text("Esse botão mostra uma tela com várias comidas.").frame(width: 200, height: 150, alignment: .leading)
                }
            }
        }
    }
}
