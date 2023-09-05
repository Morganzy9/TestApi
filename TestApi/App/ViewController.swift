//
//  ViewController.swift
//  TestApi
//
//  Created by Ислам Пулатов on 9/2/23.
//

import UIKit

class ViewController: UIViewController {

    var recipes: [Recipe] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchRandomRecipes(numberOfRecipes: 10) { result in
            switch result {
            case .success(let cookData):
                self.recipes = cookData.recipes
                print("Fetched \(self.recipes.count) recipes.")
                
                for recipe in self.recipes {
                    print(recipe.sourceName)
                }
                
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        
    }

    func fetchRandomRecipes(numberOfRecipes: Int, completion: @escaping (Result<CookData, Error>) -> Void) {
        
        let apiKey = "08aaad3488c7489fa416f8e726d49df7"
        let baseURL = URL(string: "https://api.spoonacular.com/recipes/random")!

        let queryString = "number=\(numberOfRecipes)&apiKey=\(apiKey)"
        let fullURLString = baseURL.absoluteString + "?" + queryString

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
