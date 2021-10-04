//
//  NetworkManager.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 9/30/21.
//

import UIKit


struct NetworkManager {
    
    static let shared = NetworkManager()
    let cache = NSCache<NSString, UIImage>()
    
    
    private init() {}

    

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
            
            guard response == response as HTTPURLResponse, response.statusCode == 200 else {
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
       
    
    func getListOfPeople(completed: @escaping (Result<[People], TFErrors>) -> Void) {
        
        let baseUrl = "https://api.github.com/users/SAllen0400/followers?per_page=100&page=1"
        
        guard let url = URL(string: baseUrl) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completed(.failure(.invalidUrl))
            }
            
            guard (response as? HTTPURLResponse) != nil else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let getPeople = try decoder.decode([People].self, from: data)
                completed(.success(getPeople))
                
            } catch let error{
                completed(.failure(.invalidData))
                print(error.localizedDescription )
            }
        }
        task.resume()
    }
    
    
    func getTarifInfo(completed: @escaping (Result<TarifInfoModel?, TFErrors>) -> Void) {
        
        let baseUrl3 = "https://api.github.com/users/SAllen0400"
        
        guard let url = URL(string: baseUrl3) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            print(url)
            
            if let _ = error {
                completed(.failure(.invalidUrl))
            }
            
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let tarifInfo = try decoder.decode(TarifInfoModel.self, from: data)
                completed(.success(tarifInfo))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    
    func getRaskod(completed: @escaping (Result<RaskhodModel, TFErrors>) -> Void) {
        
        let baseUrl3 = "https://api.github.com/users/dyang"
        
        guard let url = URL(string: baseUrl3) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            print(url)
            
            if let _ = error {
                completed(.failure(.invalidUrl))
            }
            
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let tarifInfo = try decoder.decode(RaskhodModel.self, from: data)
                print(tarifInfo)
                completed(.success(tarifInfo))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
