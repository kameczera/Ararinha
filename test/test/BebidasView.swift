//
//  ContentView.swift
//  test
//
//  Created by Student17 on 19/04/23.
//

import SwiftUI
import AVFoundation


var bebidas: [BotaoComida] = [
    BotaoComida(id: 1, cor: "azul", imagem: "soda", texto: "Refrigerante"),
    BotaoComida(id: 2, cor: "verde", imagem: "orange-juice", texto: "Suco"),
    BotaoComida(id: 3, cor: "amarelo", imagem: "water", texto: "Água"),
    BotaoComida(id: 4, cor: "marrom", imagem: "milk", texto: "Leite")
    ]

private let adaptiveColumns = [
    GridItem(.adaptive(minimum: 170))
]

struct BebidasView: View {
    let synthesizer = AVSpeechSynthesizer()

    var body: some View {
        ScrollView{
            LazyVGrid(columns: adaptiveColumns, spacing: 10){
                ForEach(bebidas) { d in
                    HStack{
                        Button{
                            let utterance = AVSpeechUtterance(string: d.texto)
                            utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                            utterance.rate = 0.5
                            
                            synthesizer.speak(utterance)
                        } label: {
                            ZStack{
                                Color(d.cor)
                                Image(d.imagem).resizable().scaledToFit().frame(width: 100, height: 100)
                                Text(d.texto)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black).padding(.top, 130)
                            }.frame(width: 170,height: 170).cornerRadius(20).padding(5)
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .padding(.top, 170)
    }
}


struct BebidasView_Previews: PreviewProvider {
    static var previews: some View {
        BebidasView()
    }
}
