//
//  RecipesListRepository.swift
//  Recipes-IOS
//
//  Created by Omar Ghazala on 09/07/2021.
//

import Foundation
import Alamofire
import ObjectMapper

class RecipesListRepository{
    let responseMapper = ResponseMapper()
    
    func loadApi(){
        RecipesClient.shared.start(request: RecipesListRequest.fetchRecipesList) { (result: Result<RecipesResponse, AFError>) in
            print(result)
        }
        
    }
    
    
    
}
