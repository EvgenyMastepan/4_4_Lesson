//
//  Network.swift
//  4_4_Lesson
//
//  Created by Evgeny Mastepan on 03.10.2025.
//

import Foundation
import Alamofire

protocol NetworkProtocol {
    func getRandomPhoto(query: String, completion: @escaping (Result<Cat?, Error>) -> Void )
}

class Network: NetworkProtocol {
    
    func getRandomPhoto(query: String, completion: @escaping (Result<Cat?, Error>) -> Void ) {
        let url = Secret.url_random
        let parametrs: Parameters = [ "query": query]
        let headers: HTTPHeaders = ["x-api-key": Secret.api_key]
        AF.request(url,
                   method: .get,
                   parameters: parametrs,
                   headers: headers)
        .validate()
        .response { result in
            guard result.error == nil else {
                completion(.failure(result.error!))
                return
            }
            
            guard let data = result.data else {
                completion(.failure(NSError(domain: "Data Error", code: 404)))
                return
            }
            
            do {
                let cats = try JSONDecoder().decode([Cat].self, from: data)
                completion(.success(cats.first))
            } catch {
                completion(.failure(error))
            }
        }
    }
}

