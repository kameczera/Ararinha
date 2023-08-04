//
//  FrutasView.swift
//  ProjetoFinal
//
//  Created by Student11 on 28/04/23.
//

import SwiftUI
import AVFoundation


var verduras: [BotaoComida] = [
    BotaoComida(id: 1, cor: "azul", imagem: "carrot", texto: "Cenoura"),
    BotaoComida(id: 2, cor: "verde", imagem: "broccoli", texto: "Brócolis"),
    BotaoComida(id: 3, cor: "amarelo", imagem: "tomato", texto: "Tomate"),
    BotaoComida(id: 4, cor: "marrom", imagem: "cabbage", texto: "Alface"),
    BotaoComida(id: 5, cor: "azul", imagem: "corn-2", texto: "Milho"),
    BotaoComida(id: 6, cor: "verde", imagem: "eggplant", texto: "Beringela"),
    BotaoComida(id: 7, cor: "amarelo", imagem: "green-pea", texto: "Vagem"),
    BotaoComida(id: 8, cor: "marrom", imagem: "paprika", texto: "Pimentão"),
    BotaoComida(id: 9, cor: "azul", imagem: "pumpkin", texto: "Abóbora"),
    BotaoComida(id: 10, cor: "verde", imagem: "radish", texto: "Rabanete"),
    BotaoComida(id: 11, cor: "amarelo", imagem: "cauliflower", texto: "Couve Flor")
    
    
]

private let adaptiveColumns = [
    GridItem(.adaptive(minimum: 170))
]

struct VerdurasView: View {
    let synthesizer = AVSpeechSynthesizer()

    var body: some View {
        ScrollView{
            LazyVGrid(columns: adaptiveColumns, spacing: 10){
                ForEach(verduras) { v in
                    HStack{
                        Button{
                            let utterance = AVSpeechUtterance(string: v.texto)
                            utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                            utterance.rate = 0.5
                            
                            synthesizer.speak(utterance)
                        } label: {
                            ZStack{
                                Color(v.cor)
                                Image(v.imagem).resizable().scaledToFit().frame(width: 100, height: 100)
                                Text(v.texto)
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
    }
    
    struct VerdurasView_Previews: PreviewProvider {
        static var previews: some View {
            VerdurasView()
        }
    }
}
