//
//  CountryListViewModel.swift
//  WrkSpot
//
//  Created by Ravi Ranjan on 09/02/24.
//

import Foundation

protocol CountryDetailInteractorProtocol:AnyObject {
    
    func loadCountryDetails()
    
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
    
    var countryDetailsCount: Int {
           return countryDetailsData?.count ?? 0
    }

    init(delegate: CountryListPresenterProtocol ) {
        self.delegate = delegate
    }
    
    
    func loadCountryDetails() {
        
        networkManager.performDataTask(countryDetailRoute) { (result: Result<[CountryDetailModel], NetworkError>) in
            switch result {
            case .success(let countrydetails):
                print(countrydetails)
                self.countryDetailsData = countrydetails
                DispatchQueue.main.async {
                    self.delegate?.didFetchCountryDetails()
                }
            case .failure(let failure):
                print(failure.errorMessage)
            }
        }
    }
    
    subscript(index: Int) -> CountryDetailModel? {
        guard let countryDetailsData = countryDetailsData, index < countryDetailsData.count else {
            return nil
        }
        return countryDetailsData[index]
    }
}


