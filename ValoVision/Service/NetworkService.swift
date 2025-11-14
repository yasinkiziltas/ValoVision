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
}

class NetworkService {
    
    func getData<T: Decodable>(url: URL, completion: @escaping (Result<T, DataError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.serverError))
                return
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
    
//    func getData(url: URL, completion: @escaping (Result<[Data], DataError>) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            
//            if let _ = error {
//                completion(.failure(.serverError))
//                return
//            } else if let data = data {
//                let dataList = try? JSONDecoder().decode([Data].self, from: data)
//                
//                if let dataList = dataList {
//                    completion(.success(dataList))
//                } else {
//                    completion(.failure(.parsingError))
//                }
//            }
//        }.resume()
//    }

