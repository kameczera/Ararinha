//
//  Vcard.swift
//  GETacoesCrianca
//
//  Created by Student22 on 08/05/23.
//

import SwiftUI

struct Vcard: View {
    var sent: Sentimento
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(sent.sentimento)
                .font(.headline)
                .frame(minWidth: 170, alignment: .leading)
                   .layoutPriority(1)
               Text(sent.data)
                   .opacity(0.7)
                   .frame(maxWidth: .infinity, alignment: .leading)
           }
           .foregroundColor(.white)
           .padding(30)
           .frame(width: 350, height: 100)
           .background(.linearGradient(colors: [Color("azul").opacity(1), Color("azul").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
           .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
           .shadow(color: Color("azul").opacity(0.3), radius: 8, x: 0, y: 12)
           .shadow(color: Color("azul").opacity(0.3), radius: 2, x: 0, y: 1)
           
    }
}

struct Vcard_Previews: PreviewProvider {
    static var previews: some View {
        var fealing = Sentimento(sentimento:"Nossa mas to tao gorda", data: "08/05/2023")
        
        Vcard(sent: fealing)
    }
}
