//
//  ViewController.swift
//  Recipes-IOS
//
//  Created by Omar Ghazala on 09/07/2021.
//

import UIKit

class RecipesListViewController: UIViewController {
    
    let presenter = RecipesListPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    @IBAction func TestButtonClick(_ sender: Any) {
        presenter.loadApi()
    }
    
}




