//
//  BitcoinManager.swift
//  BitconApp
//
//  Created by Ziutzel grajales on 21/03/23.
//

import Foundation

struct BitcoinManager {
    
    //Devolver la informacion con un closure
    
    func actualizarPrecio (moneda : String, completionHandler : @escaping (_ precio: Bitcoin?, _ error : Error?) ->()) {
        
    let urlString = "https://rest.coinapi.io/v1/exchangerate/BTC/\(moneda)/?apikey=762DEF17-B7CD-49B7-96EC-57D995E9E339"
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { datos, respuesta, error in
                
                guard let datos = datos else { return }
                
             let decodificador = JSONDecoder()
                
                do{
                    let dataDecodificada = try decodificador.decode(Bitcoin.self, from: datos)
                    
                    print(dataDecodificada)
                    
                    completionHandler(dataDecodificada, nil)
                } catch {
                    print ("Debug : error \(error.localizedDescription)")
                    completionHandler(nil, error)
                }
            }
            .resume()
        }
        
    }
}
