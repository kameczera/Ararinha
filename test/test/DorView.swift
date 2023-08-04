//
//  DorView.swift
//  test
//
//  Created by Student17 on 24/04/23.
//

import SwiftUI
import AVFoundation


struct DorView: View {
    let synthesizer = AVSpeechSynthesizer()
    @Binding var bonequinho: String
    @State private var dor = ""
    let complemento: String = "Tenho dor em:"
    var juncao: String = ""
    var body: some View {
        ZStack{
            Color("ciano")
            VStack{
                Text("ONDE TENHO DOR?").font(.title)
                Text("\(dor)")
                ZStack{
                    Image("corpoHomem").resizable().scaledToFit().frame(height: 600)
                    if bonequinho == "homem"{
                        Image("corpoHomem").resizable().scaledToFit().frame(width: 600,height: 600)
                    }else {
                        Image("corpoMulher").resizable().scaledToFit().frame(width: 600, height: 600)
                    }
                    
                    VStack{
                        Button{
                            dor = "Cabeça"
                            submitForm(s: "\(complemento) \(dor)")
                            let utterance = AVSpeechUtterance(string: "Dor na Cabeça")
                            utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                            utterance.rate = 0.5
                            synthesizer.speak(utterance)
                            
                        } label: {
                            Text("").frame(width: 70, height: 80)
                        }
                        HStack{
                            Button{
                                dor = "Braço Esquerdo"
                                submitForm(s: "\(complemento) \(dor)")
                                let utterance = AVSpeechUtterance(string: "Dor no braço")
                                utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                                utterance.rate = 0.5
                                synthesizer.speak(utterance)
                            } label: {
                                Text("").frame(width: 50, height: 140)
                            }
                            Button{
                                dor = "Tronco"
                                submitForm(s: "\(complemento) \(dor)")
                                let utterance = AVSpeechUtterance(string: "Dor no tronco")
                                utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                                utterance.rate = 0.5
                                synthesizer.speak(utterance)
                            } label: {
                                Text("").frame(width: 80, height: 140)
                            }
                            Button{
                                dor = "Braço Direito"
                                submitForm(s: "\(complemento) \(dor)")
                                let utterance = AVSpeechUtterance(string: "Dor no braço")
                                utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                                utterance.rate = 0.5
                                synthesizer.speak(utterance)
                            } label: {
                                Text("").frame(width: 50, height: 140)
                            }
                        }
                        Button{
                            dor = "Perna"
                            submitForm(s: "\(complemento) \(dor)")
                            let utterance = AVSpeechUtterance(string: "Dor no perna")
                            utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                            utterance.rate = 0.5
                            synthesizer.speak(utterance)
                        } label: {
                            Text("").frame(width: 150,height: 250)
                        }
                    }
                }
            }.padding([.top], 20)
        }.ignoresSafeArea()
    }
}
