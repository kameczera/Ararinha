//
//  ContentView.swift
//  test
//
//  Created by Student17 on 19/04/23.
//

import SwiftUI
import UIKit
import AVFoundation


struct Botao: Identifiable{
    var id: Int
    var cor: String
    var imagem: String
}

let buttons: [Botao] = [
    Botao(id: 1, cor: "azul", imagem: "orelha"),
    Botao(id: 2, cor: "verde", imagem: "dor"),
    Botao(id: 3, cor: "amarelo", imagem: "emocoes"),
    Botao(id: 4, cor: "marrom", imagem: "alimentos")
]



struct ContentView: View {

    
    let synthesizer = AVSpeechSynthesizer()
    
    @AppStorage("dfw32iihjkamostrarOnBinding") var mostrarOnBoarding: Bool = true
    @AppStorage("bonequinho") var bonequinho: String = "homem"
    
    
    @StateObject var t1 = TesteViewModel()
    
    @State var isShowingEmocoesView = false
    @State var isShowingMenuAlimentoView = false
    @State var isShowingDorView = false
    
    @State var audioPlayer: AVAudioPlayer?
    var sound = URL(fileURLWithPath: Bundle.main.path(forResource: "loveOfMyLife", ofType: "mp3")!)
    
    func playSound(){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: sound)
            audioPlayer?.play()
        } catch {
            
        }
    }
    
    
    var body: some View {
        NavigationStack{
            ScrollView (showsIndicators: false){
                VStack{
                    // NavigationLink(destination: EmocoesView(), isActive: $isShowingEmocoesView){ EmptyView()}
                    
                    Button{
                        //                    let utterance = AVSpeechUtterance(string: "Tocar Música")
                        //                    utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                        //                    utterance.rate = 0.5
                        //
                        //                    synthesizer.speak(utterance)
                        playSound()
                        //isShowingEmocoesView = true
                        
                        
                    } label:  {
                        ZStack{
                            Color(buttons[0].cor)
                            Image(buttons[0].imagem).resizable().scaledToFit().frame(width: 100, height: 100)
                            Text("Música")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black).padding(.top, 130)
                        }.frame(width: 170,height: 170).cornerRadius(20).padding(5)
                    }
                    
                    
                    NavigationLink(destination: DorView(bonequinho: $bonequinho), isActive: $isShowingDorView){ EmptyView()}
                    
                    Button{
                        let utterance = AVSpeechUtterance(string: "Sinto dor")
                        utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                        utterance.rate = 0.5
                        
                        synthesizer.speak(utterance)
                        isShowingDorView = true
                        
                    } label: {
                        ZStack{
                            Color(buttons[1].cor)
                            Image(buttons[1].imagem).resizable().scaledToFit().frame(width: 100, height: 100)
                            Text("Dor")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black).padding(.top, 130)
                        }.frame(width: 170,height: 170).cornerRadius(20).padding(5)
                    }
                    
                    
                    NavigationLink(destination: EmocoesView(bonequinho: $bonequinho), isActive: $isShowingEmocoesView){ EmptyView()}
                    
                    Button{
                        let utterance = AVSpeechUtterance(string: "Emoções")
                        utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                        utterance.rate = 0.5
                        synthesizer.speak(utterance)
                        
                        isShowingEmocoesView = true
                        
                    } label: {
                        ZStack{
                            Color(buttons[2].cor)
                            Image(buttons[2].imagem).resizable().scaledToFit().frame(width: 100, height: 100)
                            Text("Emoções")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black).padding(.top, 130)
                        }.frame(width: 170,height: 170).cornerRadius(20).padding(5)
                    }
                    
                    
                    NavigationLink(destination: MenuAlimentoView(), isActive: $isShowingMenuAlimentoView){ EmptyView()}
                    
                    
                    Button{
                        let utterance = AVSpeechUtterance(string: "Estou com fome!")
                        utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                        utterance.rate = 0.5
                        
                        synthesizer.speak(utterance)
                        
                        isShowingMenuAlimentoView = true
                    } label: {
                        ZStack{
                            Color(buttons[3].cor)
                            Image(buttons[3].imagem).resizable().scaledToFit().frame(width: 100, height: 100)
                            Text("Alimento")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black).padding(.top, 130)
                        }.frame(width: 170,height: 170).cornerRadius(20).padding(5)
                    }
                    
                    
                    NavigationLink{
                        areaPaiView()
                    } label: {
                        ZStack{
                            Color("azul")
                            Text("ÁREA DOS PAIS").font(.title).foregroundColor(.black)
                        }.frame(width: 250,height: 50).cornerRadius(15)
                    }
                }
            }
        }.accentColor(.black).fullScreenCover(isPresented: $mostrarOnBoarding, content: {
            OnBoardingView(selectedTab: t1.selectTab, mostrarOnBoarding: $mostrarOnBoarding, bonequinho: $bonequinho)
        })
    }
}

struct OnBoardingView: View {
    @State var selectedTab: Int = 3
    @Binding var mostrarOnBoarding: Bool
    @Binding var bonequinho: String
    
    @StateObject var t1 = TesteViewModel()
    var body: some View {
        TabView(selection: $t1.selectTab){
            AjudaView(bonequinho: $bonequinho).tag(1)
            
            ComoUtilizar().tag(2)
            
            ComecarView(mostrarOnBoarding: $mostrarOnBoarding).tag(3)
        }.tabViewStyle(PageTabViewStyle()).ignoresSafeArea().background(Color("lightGray"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
