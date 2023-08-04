//
//  ViewModel.swift
//  GETacoesCrianca
//
//  Created by Student22 on 29/04/23.
//

import Foundation


struct global {
    static var selectTab : Int = 2
}


class TesteViewModel: ObservableObject{
    @Published var selectTab : Int = 0
}


struct Sentimento: Decodable,Hashable {
    var _id: String?
    var _rev: String?
    var sentimento: String
    var data: String
}

class ViewModel: ObservableObject{
    @Published var sentimento: [Sentimento] = []
    
    func fetch(){
        guard let url = URL (string: "http://192.168.128.243:1880/getArarinhaInfo") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            } //colocar a tarefa na fila e quando executar, pegar a data
            
            do { //criando a tarefa
                let parsed = try JSONDecoder().decode([Sentimento].self, from: data)//receber o json em array e decodificar em parsed, so indica com colchete se voce realmente quiser receber um array
                DispatchQueue.main.async {
                    self?.sentimento = parsed//se essa instancia existir, ela vai receber o valor do parsed
                }
            } catch {
                print(error)
            }//se nao mostre o erro
        }
        task.resume() //executa a tarefa de fato
    }
}


