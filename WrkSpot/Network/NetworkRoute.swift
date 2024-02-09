//
//  NetworkRoute.swift
//  WrkSpot
//
//  Created by Ravi Ranjan on 09/02/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

protocol NetworkRoute {
    var baseURL: String { get }
    var path: String? { get }
    var httpMethod: HTTPMethod { get }
}



