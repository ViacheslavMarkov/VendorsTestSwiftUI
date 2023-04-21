//
//  PaginationModel.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 21.04.2023.
//

import Foundation

struct PaginationModel: Codable {
    let total: Int?
    let page: Int?
    let next: Int?
    let prev: Int?
}
