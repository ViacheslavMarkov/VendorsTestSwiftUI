//
//  VendorCellView.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 19.04.2023.
//

import SwiftUI
import UIKit

struct VendorCellView: View {
    //MARK: - Properties
    let item: VendorModel
    @State var isSelected: Bool = false
    private let bounds = UIScreen.main.bounds
    private var categoriesCounting: Int {
        return item.categories.count
    }
    
    //MARK: - Functions
    private func createCategoryView(leftIndex: Int, rightIndex: Int? = nil) -> some View {
        HStack {
            CategoryView(category: item.categories[leftIndex])
            if let rightIndex = rightIndex {
                CategoryView(category: item.categories[rightIndex])
            }
            
            Spacer()
        }
    }
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 8) {
            //: MARK: Cover
            CoverView(item: item, isSelected: isSelected)
            
            //: MARK: Title
            HStack {
                Text(item.companyName)
                    .font(.custom(.openSansBold, size: 16))
                    .foregroundColor(.titleDarkGray)
                
                Spacer()
            }//: HStack
            
            //: MARK: Categories
            VStack {
                if categoriesCounting > 0 {
                    if categoriesCounting == 1 {
                        createCategoryView(leftIndex: 0)
                    } else {
                        ForEach(0..<(categoriesCounting / 2), id: \.self) { index in
                            
                            if index == ((categoriesCounting / 2) - 1) && !categoriesCounting.isMultiple(of: 2) {
                                createCategoryView(leftIndex: index)
                            } else {
                                createCategoryView(leftIndex: index, rightIndex: index + 1)
                            }
                        }
                    }
                }
            }//: VStack
            
            //: MARK: Tags
            HStack {
                TagView(tags: item.tags)
                
                Spacer()
            }//: HStack
        }//: VStack
    }
}

//MARK: - Preview
struct VendorCellView_Previews: PreviewProvider {
    static let response: VendorResponse = Bundle.main.decodeJSON("vendors")
    static let item = response.vendors[0]
    
    static var previews: some View {
        VendorCellView(item: item)
    }
}
