//
//  RecipesResponse.swift
//  Recipes-IOS
//
//  Created by Omar Ghazala on 09/07/2021.
//

import Foundation

struct RecipesResponse: Codable {
    let from, to, count: Int
    let links: RecipesListLinks
    let hits: [Hit]

    enum CodingKeys: String, CodingKey {
        case from, to, count
        case links = "_links"
        case hits
    }
}

// MARK: - Hit
struct Hit: Codable {
    let recipe: Recipe

    enum CodingKeys: String, CodingKey {
        case recipe
    }
}

// MARK: - HitLinks
struct HitLinks: Codable {
    let linksSelf: Next

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - Recipe
struct Recipe: Codable {
    let uri: String
    let label: String
    let image: String
    let source: String
    let url: String
    let shareAs: String
    let yield: Int
    let dietLabels: [DietLabel]
    let healthLabels: [String]
    let ingredientLines: [String]
    let ingredients: [Ingredient]
    let calories, totalWeight: Double
    let totalTime: Int
    let cuisineType: [String]?
    let dishType: [String]?
}


// MARK: - RecipesListLinks
struct RecipesListLinks: Codable {
    let next: Next
}

// MARK: - Next
struct Next: Codable {
    let href: String
}

enum DietLabel: String, Codable {
    case balanced = "Balanced"
    case lowCarb = "Low-Carb"
}

// MARK: - Ingredient
struct Ingredient: Codable {
    let text: String
    let weight: Double
    let foodCategory: String?
    let foodID: String
    let image: String?

    enum CodingKeys: String, CodingKey {
        case text, weight, foodCategory
        case foodID = "foodId"
        case image
    }
}

