//
//  ContentView.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 19.04.2023.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @StateObject var viewModel = ContentViewModel()
    @State var timeRemaining = 0.5
    @State var searchingText = ""
    @AppStorage(AppKeys.isEmptySearchData) var isEmptySearchData: Bool = true
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    //MARK: - Body
    var body: some View {
        VStack {
            // MARK: Search
            SearchView { text in
                timeRemaining = 0.5
                searchingText = text
            }
            .onReceive(timer) { _ in
                if timeRemaining <= 0 {
                    timeRemaining = 0.5
                    viewModel.filterVendorsData(by: searchingText)
                }
                
                if timeRemaining > 0 {
                    timeRemaining -= 0.1
                }
            }
            .background(
                Color.white
            )
            .cornerRadius(14)
            .padding(.top, 24)
            .frame(height: 40)
            .shadow(
                color: .subTitleLightGray.opacity(0.6),
                radius: 8,
                x: 2,
                y: 2
            )
            
            // MARK: List of items
            if isEmptySearchData {
                EmptyMessageView(
                    title: "Sorry! No results found...",
                    info: "Please try a different search request or browse businesses from the list"
                )
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center, spacing: 20) {
                        ForEach(viewModel.filteredVendors, id: \.id) { item in
                            VendorCellView(item: item)
                                .onAppear() {
                                    viewModel.loadMoreContent(currentItem: item)
                                }
                        }
                    }//: VStack
                }//: Scroll
                .padding(.top, 24)
            }
        }//: VStack
        .padding(.horizontal, 16)
        .background(
            Color.backgroundLightGray
        )
    }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
