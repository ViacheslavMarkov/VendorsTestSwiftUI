//
//  CoverView.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 20.04.2023.
//

import SwiftUI

struct CoverView: View {
    //MARK: - Properties
    let item: VendorModel
    @State var isSelected: Bool = false
    private let bounds = UIScreen.main.bounds
    
    private let width = UIScreen.main.bounds.width - 32
    
    //MARK: - Body
    var body: some View {
        ZStack {
            AsyncImage(
                url: URL(string: item.coverPhoto.mediaUrl)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width / 2)
                } placeholder: {
                    ProgressView()
                }
                .overlay(
                    HStack {
                        Spacer()
                        
                        VStack {
                            ZStack {
                                Image(isSelected ? ImageNameType.selectedBookmark.rawValue : ImageNameType.unselectedBookmark.rawValue)
                                        .resizable()
                                        .font(Font.title.weight(.light))
                                        .foregroundColor(!isSelected ? Color.titleGreen : Color.white)
                                        .frame(width: 64, height: 64)
                                        .onTapGesture {
                                            print("Image tapped")
                                        }
                            }//: ZStack
                            
                            Spacer()
                        }//: VStack
                        .padding(.vertical, 10)
                    }//: HStack
                )
                .overlay {
                    HStack {
                        VStack {
                            Spacer()
                            
                            ZStack {
                                Text(item.areaServed)
                                    .font(.custom(.openSansRegular, size: 14))
                                    .foregroundColor(Color.titleDarkGray)
                            }//: ZStack
                            .padding(.vertical, 8)
                            .padding(.horizontal, 8)
                            .frame(height: 22)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .opacity(0.9)
                        }//: VStack
                        .padding(.leading, 8)
                        .padding(.bottom, 8)
                        
                        Spacer()
                    }//: HStack
                }
        }//: ZStack
        .background(
            LinearGradient(
                colors: [.subTitleLightGray, .titleDarkGray],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .cornerRadius(15)
    }
}

//MARK: - Preview
struct CoverView_Previews: PreviewProvider {
    static let response: VendorResponse = Bundle.main.decodeJSON("vendors")
    static let item = response.vendors[0]
    
    static var previews: some View {
        CoverView(item: item)
    }
}
