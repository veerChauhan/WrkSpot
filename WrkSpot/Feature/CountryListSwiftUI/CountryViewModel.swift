//
//  CountryViewModel.swift
//  WrkSpot
//
//  Created by Ravi Ranjan on 19/02/24.
//

import Foundation
import Combine

class CountryViewModel: ObservableObject {
    @Published var countryDetailsData: [CountryDetailModel]?
    @Published var filteredCountryDetails: [CountryDetailModel]?

    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
    @Published var errorMessage: String?

    private var cancellables: Set<AnyCancellable> = []
    
    private let networkManager = NetworkManager.shared
    private var countryDetailRoute = CountryDetailRoute()

    func loadCountryDetails() {
        isLoading = true

        networkManager.performDataTask(countryDetailRoute) { [weak self] (result: Result<[CountryDetailModel], NetworkError>) in
            guard let self = self else { return }

            self.isLoading = false

            switch result {
            case .success(let countryDetails):
                print(countryDetails)
                self.countryDetailsData = countryDetails
                self.filteredCountryDetails = countryDetails
            case .failure(let failure):
                print(failure.errorMessage)
                self.isError = true
                self.errorMessage = failure.errorMessage
            }
        }
    }
    
     func filterCountries(searchedText: String?) {
        guard let searchedText = searchedText, !searchedText.isEmpty else {
            filteredCountryDetails = self.countryDetailsData ?? []
            return
        }

        filteredCountryDetails = (self.countryDetailsData ?? []).filter { country in
            country.name?.lowercased().contains(searchedText.lowercased()) == true
        }
    }
}


