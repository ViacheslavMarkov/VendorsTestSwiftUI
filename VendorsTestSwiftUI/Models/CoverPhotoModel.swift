//
//  CoverPhotoModel.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 20.04.2023.
//

import Foundation

struct CoverPhotoModel: Codable, Identifiable {
    let id          : Int
    let mediaUrl    : String
    let mediaType   : MediaType?
    
    enum CodingKeys: String, CodingKey {
        case id
        case mediaUrl   = "media_url"
        case mediaType  = "media_type"
    }
}
