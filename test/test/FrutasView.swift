//
//  FrutasView.swift
//  ProjetoFinal
//
//  Created by Student11 on 28/04/23.
//

import SwiftUI
import AVFoundation


var frutas: [BotaoComida] = [
    BotaoComida(id: 1, cor: "azul", imagem: "banana", texto: "Banana"),
    BotaoComida(id: 2, cor: "verde", imagem: "kiwi", texto: "Kiwi"),
    BotaoComida(id: 3, cor: "amarelo", imagem: "limao", texto: "Limão"),
    BotaoComida(id: 4, cor: "marrom", imagem: "maca", texto: "Maçã"),
    BotaoComida(id: 5, cor: "azul", imagem: "melancia", texto: "Melancia"),
    BotaoComida(id: 6, cor: "verde", imagem: "morango", texto: "Morango"),
    BotaoComida(id: 7, cor: "amarelo", imagem: "pera", texto: "Pêra"),
    BotaoComida(id: 8, cor: "marrom", imagem: "abacaxi", texto: "Abacaxi"),
    BotaoComida(id: 9, cor: "azul", imagem: "papaya", texto: "Mamão"),
    BotaoComida(id: 10, cor: "verde", imagem: "amora", texto: "Amora")
]

private let adaptiveColumns = [
    GridItem(.adaptive(minimum: 170))
]

struct FrutasView: View {
    let synthesizer = AVSpeechSynthesizer()

    var body: some View {
        ScrollView{
            LazyVGrid(columns: adaptiveColumns, spacing: 10){
                ForEach(frutas) { f in
                    Button{
                        let utterance = AVSpeechUtterance(string: f.texto)
                        utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                        utterance.rate = 0.5
                        
                        synthesizer.speak(utterance)
                    } label: {
                        ZStack{
                            Color(f.cor)
                            Image(f.imagem).resizable().scaledToFit().frame(width: 100, height: 100)
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
    
    struct FrutasView_Previews: PreviewProvider {
        static var previews: some View {
            FrutasView()
        }
    }
}
