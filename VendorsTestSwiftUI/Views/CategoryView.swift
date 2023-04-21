//
//  CategoryView.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 20.04.2023.
//

import SwiftUI
import SVGKit

struct CategoryView: View {
    //MARK: - Properties
    let category: CategoryModel
    
    //MARK: - Body
    var body: some View {
        HStack(spacing: 8) {
            SVGKFastImageViewSUI(
                url: URL(string: category.image.mediaUrl),
                size: CGSize(width: 24, height: 24)
            )
            .frame(width: 24, height: 24, alignment: .center)
            
            Text(category.name)
                .font(.custom(.openSansRegular, size: 14))
                .foregroundColor(.titleDarkGray)
                .fontWeight(.regular)
        }//: HStack
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
    }
}

//MARK: - Preview
struct CategoryView_Previews: PreviewProvider {
    static let response: VendorResponse = Bundle.main.decodeJSON("vendors")
    static let category = response.vendors[0].categories[0]
    
    static var previews: some View {
        CategoryView(category: category)
            .previewLayout(.sizeThatFits)
    }
}
