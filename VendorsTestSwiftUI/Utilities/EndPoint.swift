//
//  EndPoint.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 21.04.2023.
//

import Foundation

protocol EndPointProtocol {
    var url: URL? { get }
}

extension EndPointProtocol {
    var baseURL: String {
        return "https://test.dev/api/"
    }
}

enum EndPoint: String, EndPointProtocol {
    case vendor = "vendor/?page="
    
    var url: URL? {
        return URL(string: baseURL + self.rawValue)
    }
    
    var urlString: String {
        return baseURL + self.rawValue
    }
}
