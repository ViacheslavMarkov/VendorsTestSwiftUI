//
//  Bundle+Extension.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 19.04.2023.
//

import Foundation

extension Bundle {
    func decodeJSON<T: Decodable>(_ fileNameString: String, fileType: FileType = .json) -> T {
        guard let path = Bundle.main.path(forResource: fileNameString, ofType: fileType.rawValue) else {
            fatalError("Filed to locate \(fileNameString) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
            fatalError("Filed to load \(fileNameString) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let json = try? decoder.decode(T.self, from: data) else {
            fatalError("Filed to decode \(fileNameString) from bundle.")
        }
        
        return json
    }
}
