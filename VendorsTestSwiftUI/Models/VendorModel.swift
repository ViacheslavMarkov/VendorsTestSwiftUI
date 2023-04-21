//
//  VendorModel.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 20.04.2023.
//

import Foundation

struct VendorModel: Codable, Identifiable {
    let id: Int
    let companyName : String
    let areaServed  : String
    let shopType    : String
    let isFavorited : Bool
    let isFollow    : Bool
    let businessType: String
    let coverPhoto  : CoverPhotoModel
    let categories  : [CategoryModel]
    let tags        : [TagModel]
    
    enum CodingKeys: String, CodingKey {
        case id
        case companyName    = "company_name"
        case areaServed     = "area_served"
        case shopType       = "shop_type"
        case isFavorited    = "favorited"
        case isFollow       = "follow"
        case businessType   = "business_type"
        case coverPhoto     = "cover_photo"
        case categories
        case tags
    }
}
