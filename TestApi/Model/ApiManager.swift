//
//  ApiManager.swift
//  TestApi
//
//  Created by Ислам Пулатов on 9/3/23.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    
    private init() {}
    
    private let apiKey = "08aaad3488c7489fa416f8e726d49df7"
    private let baseURL = "https://api.spoonacular.com/recipes/random"
    
    func fetchRecipes(numberOfRecipes: Int, completion: @escaping (CookData?, Error?) -> Void) {
        fetchRandomRecipes(numberOfRecipes: numberOfRecipes) { result in
            switch result {
            case .success(let cookData):
                completion(cookData, nil)     
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                completion(nil, error)
            }
        }
    }
    
    private func fetchRandomRecipes(numberOfRecipes: Int, completion: @escaping (Result<CookData, Error>) -> Void) {
        let queryString = "number=\(numberOfRecipes)&apiKey=\(apiKey)"
        let fullURLString = baseURL + "?" + queryString
        guard let url = URL(string: fullURLString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, fetchError in
            if let fetchError = fetchError {
                completion(.failure(fetchError))
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let cookData = try decoder.decode(CookData.self, from: data)
                    completion(.success(cookData))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
