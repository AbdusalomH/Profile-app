//
//  NetworkManager.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 9/30/21.
//

import Foundation


struct NetworkManager {
    
    static let shared = NetworkManager()
    
    
    
    
    func getFollowers(completed: @escaping (Result<GetTarif, TFErrors>) -> Void) {
        
        let baseUrl = "https://api.openweathermap.org/data/2.5/box/city?bbox=12,32,15,37,10&appid=e94716bd0ee3c7002bd6bd8c28155c4b"
        
        guard let url = URL(string: baseUrl) else {
            completed(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data, error == nil else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
            
                let decoder = JSONDecoder()
                let tarif = try decoder.decode(GetTarif.self, from: data)
                completed(.success(tarif))

            } catch {
                completed(.failure(.invalidData))
            }
            
        }
        task.resume()
    }
 
}
