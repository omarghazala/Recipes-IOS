//
//  RecipesListPresenter.swift
//  Recipes-IOS
//
//  Created by Omar Ghazala on 09/07/2021.
//

import Foundation

class RecipesListPresenter{
    
    let repository = RecipesListRepository()
    
    func loadApi(){
        repository.loadApi()
    }
    
}
