//
//  ContentViewModel.swift
//  VendorsTestSwiftUI
//
//  Created by Viacheslav Markov on 19.04.2023.
//

import SwiftUI

final class ContentViewModel: ObservableObject {
    //MARK: - Properties
    @Published var filteredVendors: [VendorModel] = []
    @AppStorage(AppKeys.isEmptySearchData) var isEmptySearchData: Bool = true
    
    private var vendors: [VendorModel] = []
    private var totalPages: Int = 0
    private var page: Int = 1
    private var nextPage: Int? = nil
    
    init() {
        getVendors()
    }
    
    func getVendors() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let self = self else { return }
            let response: VendorResponse = Bundle.main.decodeJSON("vendors")
            nextPage = response.pagination?.next
            self.vendors = response.vendors
            self.filterVendorsData()
        }
    }
    
    //MARK: - PAGINATION
    func loadMoreContent(currentItem item: VendorModel){
        let thresholdIndex = vendors.index(vendors.endIndex, offsetBy: -1)
        if thresholdIndex == item.id,
           (page + 1) <= totalPages {
            page += 1
            getVendors()
        }
    }
    
    private func fetchNewData() {
        guard let nextPage = nextPage else { return }
        VendorService.shared.getVendor(at: nextPage) { [weak self] (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let response):
                guard let self = self else { return }
                self.nextPage = response.pagination?.next
                self.totalPages = response.pagination?.total ?? 0
                self.vendors += response.vendors
            }
        }
    }
    
    func filterVendorsData(by text: String = "") {
        filteredVendors = text.count > 2 ? vendors.filter({ $0.companyName.contains(text) }) : vendors
        isEmptySearchData = filteredVendors.isEmpty
    }
}
