//  AlmocoView.swift
//  ProjetoFinal
//
//  Created by Student11 on 28/04/23.
//

import SwiftUI
import AVFoundation

var almoco: [BotaoComida] = [
    BotaoComida(id: 1, cor: "azul", imagem: "rice", texto: "Arroz"),
    BotaoComida(id: 2, cor: "verde", imagem: "beans", texto: "Feijão"),
    BotaoComida(id: 3, cor: "amarelo", imagem: "fried-potatoes", texto: "Batata Frita"),
    BotaoComida(id: 4, cor: "marrom", imagem: "potato", texto: "Batata"),
    BotaoComida(id: 5, cor: "azul", imagem: "steak", texto: "Carne de Boi"),
    BotaoComida(id: 6, cor: "verde", imagem: "bacon", texto: "Bacon"),
    BotaoComida(id: 7, cor: "amarelo", imagem: "pork", texto: "Carne de Porco"),
    BotaoComida(id: 8, cor: "marrom", imagem: "sausage", texto: "Salsicha"),
    BotaoComida(id: 9, cor: "azul", imagem: "chicken", texto: "Frango"),
    BotaoComida(id: 10, cor: "verde", imagem: "fish", texto: "Peixe"),
    BotaoComida(id: 11, cor: "amarelo", imagem: "spaghetti", texto: "Macarrão")
    ]
private let adaptiveColumns = [
    GridItem(.adaptive(minimum: 170))
]

struct AlmocoView: View {
    let synthesizer = AVSpeechSynthesizer()

    var body: some View {
        ScrollView{
            LazyVGrid(columns: adaptiveColumns, spacing: 10){
                ForEach(almoco) { d in
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
    
    struct AlmocoView_Previews: PreviewProvider {
        static var previews: some View {
            AlmocoView()
        }
    }
}

