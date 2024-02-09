//
//  NetworkManager.swift
//  WrkSpot
//
//  Created by Ravi Ranjan on 09/02/24.
//

import Foundation

class NetworkManager {
    
    
    public static let shared = NetworkManager()
    private init(){}
    private var task: URLSessionTask?

    
    public func performDataTask<T: Decodable>(_ route: NetworkRoute, completionHandler: @escaping(Result<T, NetworkError>) -> Void) {
        
        
        guard let urlRequest = URL(string: route.baseURL + (route.path ?? "")) else {
            completionHandler(.failure(.invaildURL))
            return
        }
        self.task =  URLSession.shared.dataTask(with: urlRequest) { responseData, urlResponse, error in
            guard error == nil else {
                completionHandler(.failure(.networkError))
                return
            }
            
            guard let urlResponse = urlResponse as? HTTPURLResponse, urlResponse.statusCode == 200 else {
                completionHandler(.failure(.urlResponseError))
                return
            }
            
            
            guard let responseData = responseData , responseData.count > 0 else {
                completionHandler(.failure(.dataError))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(T.self, from: responseData)
                completionHandler(.success(result))
                
            } catch {
                debugPrint("error occured while decoding = \(error.localizedDescription)")
                completionHandler(.failure(.decodingError))
            }
            
        }
        
        self.task?.resume()
        
        
    }
    
}
/*
 Note: For current app implementation we are not considering other HTTP request, also for now we are not considering Header.
 */
