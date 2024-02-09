//
//  NetworkManager.swift
//  WrkSpot
//
//  Created by Ravi Ranjan on 09/02/24.
//

import Foundation

class NetworkManager {
    
    
    public var isLoggingEnable: Bool = false
    private var queue = DispatchQueue(label: "NetworkQueue",qos: .background,attributes: .concurrent)
    public static let shared = NetworkManager()
    public init(){}
    private var task: URLSessionTask?
    
    
    
}
/*
 Note: For current app implementation we are not considering other HTTP request, also for now we are not considering Header.
 */
