//
//  ComecarView.swift
//  test
//
//  Created by Student17 on 28/04/23.
//

import SwiftUI

struct ComecarView: View {
    @Binding var mostrarOnBoarding: Bool
    var body: some View {
        ZStack{
            VStack{
                Text("Você está preparado para utilizar o app")
                Button{
                    mostrarOnBoarding = false
                } label: {
                    Text("Vamos Começar").foregroundColor(Color.blue)
                }
            }
        }
    }
}
