//
//  ContentView.swift
//  GETacoesCrianca
//
//  Created by Student22 on 29/04/23.
//

import SwiftUI

struct areaPaiView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    ForEach(vm.sentimento, id: \.self){ i in
                        Vcard(sent: i)
                    }
                }
                .padding()
                .onAppear(){
                    vm.fetch()
                }
            }
        }.accentColor(.black)}
}



