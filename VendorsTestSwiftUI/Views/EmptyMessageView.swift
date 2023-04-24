//
//  EmptyMessageView.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 21.04.2023.
//

import SwiftUI

struct EmptyMessageView: View {
    //MARK: - Properties
    let title: String
    let info: String
    
    //MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            
            Text(title)
                .padding(.horizontal, 16)
                .font(.custom(.openSansBold, size: 24))
                .foregroundColor(.titleGreen)
                .multilineTextAlignment(.center)
            
            Text(info)
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .font(.custom(.openSansRegular, size: 16))
                .foregroundColor(.titleDarkGray)
                .lineLimit(2)
                .multilineTextAlignment(.center)
            
            Spacer()
        }//: VStack
    }
}

struct EmptyMessageView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyMessageView(
            title: "Sorry! No results found...",
            info: "Please try a different search request or browse businesses from the list"
        )
    }
}
