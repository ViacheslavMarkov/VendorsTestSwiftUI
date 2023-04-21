//
//  Font+Extension.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 20.04.2023.
//

import SwiftUI

extension Font {
    static func custom(_ type: FontType, size: CGFloat) -> Font {
        .custom(type.rawValue, fixedSize: size)
    }
}
