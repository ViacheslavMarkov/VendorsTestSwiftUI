//
//  VendorResponse.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 20.04.2023.
//

import Foundation

struct VendorResponse: Codable {
    let vendors     : [VendorModel]
    let pagination  : PaginationModel?
}
