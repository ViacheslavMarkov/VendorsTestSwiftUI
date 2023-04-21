//
//  CategorieModel.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 20.04.2023.
//

import Foundation

struct CategoryModel: Codable, Identifiable {
    let id      : Int
    let name    : String
    let image   : CoverPhotoModel
}
