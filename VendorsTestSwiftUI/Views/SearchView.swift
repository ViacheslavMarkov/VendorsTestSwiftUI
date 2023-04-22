//
//  SearchView.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 20.04.2023.
//

import SwiftUI

struct SearchView: View {
    //MARK: - Properties
    @State private var text: String = ""
    var didEnterText: ((_ text: String) -> Void)?
    
    //MARK: - Body
    var body: some View {
        HStack(spacing: 4) {
            TextField("Search...", text: $text)
                .padding(.horizontal, 12)
                .foregroundColor(.titleDarkGray)
                .frame(height: 40)
                .onChange(of: text) { newValue in
                    didEnterText?(newValue)
                }
                .font(.custom(.openSansRegular, size: 16))
            
            Image(ImageNameType.iconSearch.rawValue)
                .frame(width: 32, height: 32, alignment: .center)
                .foregroundColor(.subTitleLightGray)
                .padding(.trailing, 8)
        } //: HStack
    }
}

//MARK: - Preview
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .previewLayout(.fixed(width: 375, height: 40))
    }
}
