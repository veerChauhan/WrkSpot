//
//  NetworkError.swift
//  WrkSpot
//
//  Created by Ravi Ranjan on 09/02/24.
//

import Foundation
protocol ErrorDescription {
    var errorMessage: String { get }
}
public enum NetworkError: Error {
    case invaildURL
    case networkError
    case urlResponseError
    case decodingError
    case dataError
    case inValidURLError
    case encodingError
}


extension NetworkError: ErrorDescription {
     public var errorMessage: String {
        switch self {
        case .invaildURL:
            return "Url is invaild"
        case.decodingError:
            return "Error in decoding Response Data"
        case .dataError:
            return "Response data is empty"
        case .urlResponseError:
            return "Error in url response"
        case .networkError:
            return "Error in network connection"
        case .inValidURLError:
            return "URL Is Invalid"
        case .encodingError:
            return "Error in Encoding request data"
        }
    }
}
