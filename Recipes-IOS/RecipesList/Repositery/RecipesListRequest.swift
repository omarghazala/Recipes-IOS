//
//  RecipesListRequest.swift
//  Recipes-IOS
//
//  Created by Omar Ghazala on 10/07/2021.
//

import Foundation
import Alamofire

enum RecipesListRequest: Request{
    
    
    case fetchRecipesList
    
    var path: String{
        switch self{
        case .fetchRecipesList:
            return "/api/recipes/v2"
        }
    }
    
    var parameters: [String: String]?{
        switch self {
        case .fetchRecipesList:
            return ["app_id": "8aff925d", "app_key": "bee12c5f7bb914e7d5320caa9d93abff", "type": "public", "q": "chicken"]
        }
    }
    
    var method: HTTPMethod{
        switch self {
        case .fetchRecipesList:
            return .get
        }
    }

}
