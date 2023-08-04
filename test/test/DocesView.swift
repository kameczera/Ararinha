//
//  DocesView.swift
//  ProjetoFinal
//
//  Created by Student11 on 28/04/23.
//

import SwiftUI
import AVFoundation


var doces: [BotaoComida] = [
    BotaoComida(id: 1, cor: "azul", imagem: "brigadeiro", texto: "Brigadeiro"),
    BotaoComida(id: 2, cor: "verde", imagem: "candy", texto: "Candy"),
    BotaoComida(id: 3, cor: "amarelo", imagem: "chocolate-bar", texto: "Chocolate"),
    BotaoComida(id: 4, cor: "marrom", imagem: "cookie", texto: "Cookie"),
    BotaoComida(id: 5, cor: "azul", imagem: "cupcake", texto: "Cupcake"),
    BotaoComida(id: 6, cor: "verde", imagem: "donut", texto: "Donut"),
    BotaoComida(id: 7, cor: "amarelo", imagem: "ice-cream-cone", texto: "Sorvete"),
    BotaoComida(id: 8, cor: "marrom", imagem: "jelly", texto: "Gelatina")
    
    ]
private let adaptiveColumns = [
    GridItem(.adaptive(minimum: 170))
]

struct DocesView: View {
    let synthesizer = AVSpeechSynthesizer()

    var body: some View {
        ScrollView{
            LazyVGrid(columns: adaptiveColumns, spacing: 10){
                ForEach(doces) { d in
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
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
    
    struct DocesView_Previews: PreviewProvider {
        static var previews: some View {
            DocesView()
        }
    }
}
