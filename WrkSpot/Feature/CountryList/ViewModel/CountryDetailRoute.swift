//
//  CountryDetailRoute.swift
//  WrkSpot
//
//  Created by Ravi Ranjan on 09/02/24.
//

import Foundation

struct CountryDetailRoute: NetworkRoute {
    var baseURL: String = "https://api.sampleapis.com"
    var path: String? = "/countries/countries"
    var httpMethod: HTTPMethod = .get
}
