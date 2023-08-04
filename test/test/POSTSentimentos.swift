//
//  POSTSentimentos.swift
//  test
//
//  Created by Student17 on 29/04/23.
//

import Foundation

func submitForm(s: String) {
    guard let url = URL(string: "http://192.168.128.243:1880/postArarinhaInfo") else {
        print("URL inválida")
        return
    }
    
    let params = ["sentimento": s, "data": getCurrentTime()]
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {
        print("Falha na serialização dos dados")
        return
    }
    request.httpBody = httpBody
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            print(error?.localizedDescription ?? "5 inválida do servidor")
            return
        }
        
        if let httpResponse = response as? HTTPURLResponse {
            if (200...299).contains(httpResponse.statusCode) {
                print("Dados enviados com sucesso!")
            } else {
                print("Erro \(httpResponse.statusCode) no envio dos dados")
            }
        }
    }.resume()
}



func getCurrentTime ()-> String{
    let date = Date()
    let calendar = Calendar.current
    let day = calendar.component(.day, from: date)
    let month = calendar.component (.month, from: date)
    let year = calendar.component(.year, from: date)
    let hour = calendar.component(.hour, from: date)
    let minutes = calendar.component(.minute, from: date)
    let thedate = "\(day)/\(month)/\(year) \(hour):\(minutes)"
    return thedate
}

