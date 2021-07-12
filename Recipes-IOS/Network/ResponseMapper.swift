//
//  ResponseMapper.swift
//  Recipes-IOS
//
//  Created by Omar Ghazala on 09/07/2021.
//

import Foundation
import Alamofire

class ResponseMapper{
    
    func responseToJson(response : DataResponse<Any, AFError>) -> NSDictionary{
        switch response.result{
            case .success(let value):
                if let JSON = value as? NSDictionary {
                    print(JSON)
                    return JSON
                }
        case .failure(_): break
                // error handling
            }
        return ["error": "error"]
    }
}
