//
//  ApiRequest.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 21.04.2023.
//

import Foundation

enum ApiRequest {
    case vendor(page: Int)
    
    var url: String {
        switch self {
        case .vendor(page: let page):
            return EndPoint.vendor.urlString + "\(page)"
        }
    }
    
    var httpMethod: String {
        switch self {
        case .vendor:
            return "GET"
        }
    }
    
    var bodyParams: Data? {
        switch self {
        case .vendor:
            return nil
        }
    }
    
    var headerFields: [String: String]? {
        switch self {
        case .vendor:
            return nil
        }
    }
    
    var request: URLRequest? {
        guard let url = URL(string: self.url) else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.allHTTPHeaderFields = headerFields
        
        switch self {
        case .vendor:
            break
        }
        return request
    }
}
