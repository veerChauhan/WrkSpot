//
//  CountryListViewModel.swift
//  WrkSpot
//
//  Created by Ravi Ranjan on 09/02/24.
//

import Foundation

protocol CountryDetailInteractorProtocol: AnyObject {
    func loadCountryDetails()
    func searchCountryDetail(by countryName: String)
}

protocol CountryListPresenterProtocol: AnyObject {
    func didFetchCountryDetails()
    func didFailedFetchingCountryDetail()
}

final class CountryListViewModel: CountryDetailInteractorProtocol {
    
    weak var delegate: CountryListPresenterProtocol?
    private let networkManager = NetworkManager.shared
    private var countryDetailRoute = CountryDetailRoute()

    private var countryDetailsData: [CountryDetailModel]?
    private var filteredCountryDetails: [CountryDetailModel]?

    var countryDetailsCount: Int {
        return filteredCountryDetails?.count ?? 0
    }

    subscript(index: Int) -> CountryDetailModel? {
        guard let filteredCountryDetails = filteredCountryDetails, index < filteredCountryDetails.count else {
            return nil
        }
        return filteredCountryDetails[index]
    }

    init(delegate: CountryListPresenterProtocol) {
        self.delegate = delegate
    }
    
    func loadCountryDetails() {
        networkManager.performDataTask(countryDetailRoute) { [weak self] (result: Result<[CountryDetailModel], NetworkError>) in
            guard let self = self else { return }

            switch result {
            case .success(let countrydetails):
                print(countrydetails)
                self.countryDetailsData = countrydetails
                self.filteredCountryDetails = countrydetails
                DispatchQueue.main.async {
                    self.delegate?.didFetchCountryDetails()
                }
            case .failure(let failure):
                print(failure.errorMessage)
            }
        }
    }
    
    func searchCountryDetail(by countryName: String) {
        guard let countryDetailsData = countryDetailsData else {
            return
        }
        
        let lowercasedSearchTerm = countryName.lowercased()
        filteredCountryDetails = countryDetailsData.filter { $0.name?.lowercased().contains(lowercasedSearchTerm) == true }
        delegate?.didFetchCountryDetails()
    }
}
