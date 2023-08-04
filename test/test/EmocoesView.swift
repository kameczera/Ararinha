//
//  EmocoesView.swift
//  test
//
//  Created by Student17 on 25/04/23.
//

import SwiftUI
import AVFoundation


var emocoes: [BotaoEmocao] = [
    BotaoEmocao(id: 1, cor: "azul", imagem: "feliz-", texto: "Feliz"),
    BotaoEmocao(id: 2, cor: "verde", imagem: "triste-", texto: "Triste"),
    BotaoEmocao(id: 3, cor: "amarelo", imagem: "nervoso-", texto: "Bravo"),
    BotaoEmocao(id: 4, cor: "marrom", imagem: "medo-", texto: "Medo"),
    BotaoEmocao(id: 5, cor: "azul", imagem: "nojo-", texto: "Nojo"),
    BotaoEmocao(id: 6, cor: "verde", imagem: "surpreso-", texto: "Surpreso"),
    BotaoEmocao(id: 7, cor: "amarelo", imagem: "apaixonado-", texto: "Apaixonado"),
]

private let adaptiveColumns = [
    GridItem(.adaptive(minimum: 170))
]

struct EmocoesView: View {
    @Binding var bonequinho: String
    
    let synthesizer = AVSpeechSynthesizer()

    var body: some View {
        ScrollView{
            LazyVGrid(columns: adaptiveColumns, spacing: 10){
                ForEach(emocoes) { f in
                    Button{
                        let utterance = AVSpeechUtterance(string: f.texto)
                        utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                        utterance.rate = 0.5
                        
                        synthesizer.speak(utterance)
                    } label: {
                        ZStack{
                            Color(f.cor)
                            Image("\(f.imagem)\(bonequinho == "homem" ? "masc" : "fem")"  ).resizable().scaledToFit().frame(width: 140, height: 140).padding(.bottom, 20)
                            Text(f.texto)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black).padding(.top, 130)
                        }.frame(width: 170,height: 170).cornerRadius(20).padding(5)
                    }
                }
            }
        }
    }
}
