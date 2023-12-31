//
//  CookData.swift
//  TestApi
//
//  Created by Ислам Пулатов on 9/2/23.
//

import Foundation

struct CookData: Codable {
    let recipes: [Recipe]
}

// MARK: - Recipe

struct Recipe: Codable {
    let preparationMinutes: Int
    let cookingMinutes: Int
    let aggregateLikes: Int
    let healthScore: Int
    let creditsText: String
    let sourceName: String
    let pricePerServing: Double
    let extendedIngredients: [ExtendedIngredient]
    let id: Int
    let title: String
    let readyInMinutes: Int
    let servings: Int
    let sourceUrl: String
    let image: String
    let imageType: String
    let summary: String
    let cuisines: [String]
    let dishTypes: [String]
    
    enum CodingKeys: String, CodingKey {
        case preparationMinutes, cookingMinutes, aggregateLikes, healthScore, creditsText, sourceName, pricePerServing, extendedIngredients, id, title, readyInMinutes, servings, sourceUrl, image, imageType, summary, cuisines, dishTypes
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        preparationMinutes = try container.decode(Int.self, forKey: .preparationMinutes)
        cookingMinutes = try container.decode(Int.self, forKey: .cookingMinutes)
        aggregateLikes = try container.decode(Int.self, forKey: .aggregateLikes)
        healthScore = try container.decode(Int.self, forKey: .healthScore)
        creditsText = try container.decode(String.self, forKey: .creditsText)
        sourceName = try container.decode(String.self, forKey: .sourceName)
        pricePerServing = try container.decode(Double.self, forKey: .pricePerServing)
        extendedIngredients = try container.decode([ExtendedIngredient].self, forKey: .extendedIngredients)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        readyInMinutes = try container.decode(Int.self, forKey: .readyInMinutes)
        servings = try container.decode(Int.self, forKey: .servings)
        sourceUrl = try container.decode(String.self, forKey: .sourceUrl)
        image = try container.decode(String.self, forKey: .image)
        imageType = try container.decode(String.self, forKey: .imageType)
        summary = try container.decode(String.self, forKey: .summary)
        cuisines = try container.decode([String].self, forKey: .cuisines)
        dishTypes = try container.decode([String].self, forKey: .dishTypes)
    }
 
}

// MARK: - ExtendedIngredient

struct ExtendedIngredient: Codable {
    let id: Int
    let aisle, image: String
    let name, nameClean, original, originalName: String
    let amount: Double
    let unit: String
    let meta: [String]
}
