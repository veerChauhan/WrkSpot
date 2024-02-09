//
//  CountryDetailModel.swift
//  WrkSpot
//
//  Created by Ravi Ranjan on 09/02/24.
//

import Foundation


struct CountryDetailModel: Codable {
    let abbreviation, capital, currency, name: String?
    let phone: String?
    let population: Int?
    let media: Media?
    let id: Int?
    
    
    
    private enum CodingKeys: String, CodingKey {
        case abbreviation, capital, currency, name, phone, population, id, media
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        abbreviation = try container.decodeIfPresent(String.self, forKey: .abbreviation) ?? ""
        capital = try container.decodeIfPresent(String.self, forKey: .capital) ?? ""
        currency = try container.decodeIfPresent(String.self, forKey: .currency) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        phone = try container.decodeIfPresent(String.self, forKey: .phone) ?? ""
        population = try container.decodeIfPresent(Int.self, forKey: .population) ?? 0
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        media = try container.decodeIfPresent(Media.self, forKey: .media)
    }
}

struct Media: Codable {
    
    let flag, emblem, orthographic: String?
    
    private enum CodingKeys: String, CodingKey {
        case orthographic, flag, emblem
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        flag = try container.decodeIfPresent(String.self, forKey: .flag) ?? ""
        emblem = try container.decodeIfPresent(String.self, forKey: .emblem) ?? ""
        orthographic = try container.decodeIfPresent(String.self, forKey: .orthographic) ?? ""
    }
}
