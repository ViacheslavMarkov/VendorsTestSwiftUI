//
//  TagView.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 21.04.2023.
//

import SwiftUI

struct TagView: View {
    //MARK: - Properties
    let tags: [TagModel]
    
    //MARK: - Functions
    private func createText() -> String {
        let startSymbol = "• "
        var text: String = ""
        
        for tag in tags {
            text += (startSymbol + tag.name + " ")
        }
        
        return text
    }
    
    //MARK: - Body
    var body: some View {
        Text(createText())
            .font(.custom(.openSansSemibold, size: 14))
            .fontWeight(.semibold)
            .foregroundColor(.subTitleLightGray)
            .lineLimit(0)
    }
}

//MARK: - Preview
struct TagView_Previews: PreviewProvider {
    static let response: VendorResponse = Bundle.main.decodeJSON("vendors")
    static let tags = response.vendors[0].tags
    
    static var previews: some View {
        TagView(tags: tags)
            .previewLayout(.sizeThatFits)
    }
}
