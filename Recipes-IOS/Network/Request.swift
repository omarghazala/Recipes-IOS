//
//  Request.swift
//  Recipes-IOS
//
//  Created by Omar Ghazala on 09/07/2021.
//

import Foundation
import Alamofire

protocol Request {
    var path: String {get}
    var parameters: [String: String]?{get}
    var method: HTTPMethod {get}
}
