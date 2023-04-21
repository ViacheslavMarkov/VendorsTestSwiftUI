//
//  VendorService.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 21.04.2023.
//

import Foundation

protocol VendorServiceProtocol {
    func getVendor(at page: Int, completion: @escaping (_ result: Result<VendorResponse, ApiError>) -> Void)
}

final class VendorService: VendorServiceProtocol {
    static let shared: VendorServiceProtocol = VendorService()
    
    func getVendor(
        at page: Int,
        completion: @escaping (_ result: Result<VendorResponse, ApiError>) -> Void
    ) {
        guard
            let request = ApiRequest.vendor(page: page).request
        else { return }
        
        NetworkRequestManager.shared.request(request: request) { (result: Result<VendorResponse, ApiError>) in
            completion(result)
        }
    }
}
