//
//  API.swift
//  MoviesList
//
//  Created by Shahbaz on 08/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

open class API {
    
    public enum Endpoints {
        
        case getMoviesList()
        
        // Set method Type for endpoint
        public var method: HTTPMethod {
            switch self {
            case .getMoviesList:
                return HTTPMethod.get
            }
        }
        
        //Set Path for endpoint
        public var path: String {
            switch self {
            case .getMoviesList:
                return "https://demo5038407.mockable.io/GetMovieList"
            }
        }
        
        // Set Parameters for endpoints
//        public var parameters: [String: AnyObject]? {
//            var parameters = [String: AnyObject]()
//            switch self {
//
//            default:
//                break
//            }
//            return parameters
//        }
        
        // Set Header for endpoints
//        public var headers: [String: String]? {
//            var headers = [String: String]()
//            return headers
//        }
    }
    
    // API Request with Alamofire
    open static func request(_ endpoint: API.Endpoints, completionHandler: @escaping (DataResponse<Any>) -> Void) -> Request {
        let request = Alamofire.SessionManager.default.request(endpoint.path, method: endpoint.method, encoding: JSONEncoding.default).responseJSON { response in
                completionHandler(response)
        }
        return request
    }
}

