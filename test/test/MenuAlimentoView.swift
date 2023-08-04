//
//  ContentView.swift
//  test
//
//  Created by Student17 on 19/04/23.
//

import SwiftUI
import AVFoundation

struct Botoes: Identifiable{
    var id: Int
    var cor: String
    var imagem: String
}

let Buttons: [Botoes] = [
    Botoes(id: 1, cor: "azul", imagem: "fruits"),
    Botoes(id: 2, cor: "verde", imagem: "vegetable"),
    Botoes(id: 3, cor: "amarelo", imagem: "lunch"),
    Botoes(id: 4, cor: "marrom", imagem: "sweets"),
    Botoes(id: 5, cor: "azul", imagem: "drinks")
]

struct MenuAlimentoView: View {
    let synthesizer = AVSpeechSynthesizer()
    @State var isShowingAlmocoView = false
    @State var isShowingDocesView = false
    @State var isShowingBebidasView = false
    @State var isShowingVerdurasView = false
    @State var isShowingFrutasView = false
    
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    NavigationLink(destination: FrutasView(), isActive: $isShowingFrutasView){ EmptyView()}
                    Button{
                        let utterance = AVSpeechUtterance(string: "Fruta")
                        utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                        utterance.rate = 0.5
                        
                        synthesizer.speak(utterance)
                        isShowingFrutasView = true
                    } label: {
                        ZStack{
                            Color(Buttons[0].cor)
                            Image(Buttons[0].imagem).resizable().scaledToFit().frame(width: 100, height: 100)
                            Text("Fruta")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black).padding(.top, 130)
                        }.frame(width: 170,height: 170).cornerRadius(20).padding(5)
                    }
                    
                    NavigationLink(destination: VerdurasView(), isActive: $isShowingVerdurasView){ EmptyView()}
                    Button{
                        let utterance = AVSpeechUtterance(string: "Verdura")
                        utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                        utterance.rate = 0.5
                        synthesizer.speak(utterance)
                        isShowingVerdurasView = true
                        
                    } label: {
                        ZStack{
                            Color(Buttons[1].cor)
                            Image(Buttons[1].imagem).resizable().scaledToFit().frame(width: 100, height: 100)
                            Text("Verdura")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black).padding(.top, 130)
                        }.frame(width: 170,height: 170).cornerRadius(20).padding(5)
                    }
                    
                }
                
                HStack{
                    NavigationLink(destination: AlmocoView(), isActive: $isShowingAlmocoView){ EmptyView()}
                    Button{
                        let utterance = AVSpeechUtterance(string: "Almoço")
                        utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                        utterance.rate = 0.5
                        synthesizer.speak(utterance)
                        
                        isShowingAlmocoView = true
                        
                    } label: {
                        ZStack{
                            Color(Buttons[2].cor)
                            Image(Buttons[2].imagem).resizable().scaledToFit().frame(width: 100, height: 100)
                            Text("Almoço")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black).padding(.top, 130)
                        }.frame(width: 170,height: 170).cornerRadius(20).padding(5)
                    }
                    
                    NavigationLink(destination: DocesView(), isActive: $isShowingDocesView){ EmptyView()}
                        Button{
                            let utterance = AVSpeechUtterance(string: "Doces")
                            utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                            utterance.rate = 0.5
                            synthesizer.speak(utterance)
                            
                            isShowingDocesView = true

                        } label: {
                            ZStack{
                                Color(Buttons[3].cor)
                                Image(Buttons[3].imagem).resizable().scaledToFit().frame(width: 100, height: 100)
                                Text("Doces")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black).padding(.top, 130)
                            }.frame(width: 170,height: 170).cornerRadius(20).padding(5)
                        
                    }
                }
                NavigationLink(destination: BebidasView(), isActive: $isShowingBebidasView){ EmptyView()}
                    Button{
                        let utterance = AVSpeechUtterance(string: "Bebidas")
                        utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                        utterance.rate = 0.5
                        synthesizer.speak(utterance)
                        
                        isShowingBebidasView = true
                    } label: {
                        ZStack{
                            Color(Buttons[4].cor)
                            Image(Buttons[4].imagem).resizable().scaledToFit().frame(width: 100, height: 100)
                            Text("Bebidas")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black).padding(.top, 130)
                        }.frame(width: 170,height: 170).cornerRadius(20).padding(5)
                    }
                }
            }
        }
}

    
    
    
    
    struct MenuAlimentoView_Previews: PreviewProvider {
        static var previews: some View {
            MenuAlimentoView()
        }
    }

