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


final class CountryListViewModel {
    
    
    weak var delegate: CountryListPresenterProtocol?
    
    init(delegate: CountryListPresenterProtocol? = nil) {
        self.delegate = delegate
    }
    
}


