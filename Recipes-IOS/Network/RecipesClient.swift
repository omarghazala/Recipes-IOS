//
//  RecipesClient.swift
//  Recipes-IOS
//
//  Created by Omar Ghazala on 09/07/2021.
//

import Foundation
import Alamofire
import ObjectMapper

typealias MappedResult<T: Codable> = (Result<T, AFError>) -> Void

struct RecipesClient {
    var validStatusCodes: CountableClosedRange<Int> {
        return 200...300
    }
    
    var baseUrl: String {
        return "api.edamam.com"
    }
    
    var defaultHeaders: [String: String] {
        return ["Content-Type": "application/json"]
    }

    static let shared = RecipesClient()
    
    func prepareRequest<T: Codable>(request: Request, result: @escaping MappedResult<T>) -> URLRequest? {
        var urlRequest: URLRequest = URLRequest(url: fullUrlString(fromRequest: request), timeoutInterval: 60.0)
        urlRequest.method = request.method
       
        return urlRequest
    }
    
  
    
    /// Builds full path of the request using the base URL and path property of the request.
    /// Prefers the request base URL over the client's in case it's provided.
    private func fullUrlString(fromRequest request: Request) -> URL {
        // Request base URL should overrides client's, if any.
        
        // Base URL should be defined in the client if not already in the request
        let apiKey = "bee12c5f7bb914e7d5320caa9d93abff"
        
        var queryItems: [URLQueryItem] = []
        
        if let parameters = request.parameters {
            for param in parameters {
                queryItems.append(URLQueryItem(name: param.key, value: param.value))
            }
        }
        
        queryItems.append(URLQueryItem(name: "api_key", value: apiKey))
        queryItems.append(URLQueryItem(name: "type", value: "public"))
        queryItems.append(URLQueryItem(name: "q", value: "chicken"))
        
        let scheme = "https"
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = baseUrl
        urlComponents.path = request.path
        urlComponents.queryItems = queryItems
        
        return urlComponents.url!
    }
    
    func start<T: Codable>(request: Request, result: @escaping MappedResult<T>) {
          if let urlRequest: URLRequest = prepareRequest(request: request, result: result) {
              AF.request(urlRequest)
                  .validate(statusCode: validStatusCodes)
                  .responseDecodable(completionHandler: { (response: DataResponse<T, AFError>) in
                      switch response.result {
                      case .success(let resp):
                          result(.success(resp))
                      case .failure(let error):
                          result(.failure( error))
                      }
                  }
              )
          }
      }
}

