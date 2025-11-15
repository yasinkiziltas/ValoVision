//
//  NetworkService.swift
//  ValoVision
//
//  Created by Yasin Kızıltaş on 13.11.2025.
//

import Foundation

enum DataError : Error {
    case serverError
    case parsingError
    case unknownError
}

class NetworkService {
    
    //T tipi:
    //Bu fonksiyon API’den ne dönerse dönsün EventData olabilir, WeaponData olabilir, MapData olabilir
    //Yeter ki Decodable olsun demek
   
    func getData<T: Decodable>(url: URL, completion: @escaping (Result<T, DataError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.serverError))
                return
            }
            
            //(500, 403, 401), beklenmeyen durum olursa
            //Neden 200-299? çünkü HTTP’de başarı kodları daima bu aralıktadır:
            //200 → OK
            //201 → Created
            //202 → Accepted
            //204 → No content
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                if !(200...299).contains(httpResponse.statusCode) {
                    completion(.failure(.unknownError))
                    return
                }
            }
            		
            guard let data = data else {
                completion(.failure(.serverError))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.parsingError))
            }
            
        }.resume()
    }
}

