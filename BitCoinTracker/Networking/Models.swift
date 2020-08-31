//
//  CurrentPriceResponse.swift
//  BitCoinTracker
//
//  Created by maneesh on 31/08/20.
//  Copyright © 2020 maneesh. All rights reserved.
//

import Foundation

struct CurrentPriceResponse: Decodable {
    let bpi: USDPrice?
    
    enum CodingKeys:String, CodingKey {
        case bpi
    }
}

struct USDPrice: Decodable {
    let USD: PriceDetails?
    
    enum CodingKeys:String, CodingKey {
        case USD
    }
}

struct PriceDetails: Decodable {
    let rate: String?
    
    enum CodingKeys:String, CodingKey {
        case rate
    }
}

struct HistoricOriceResponse: Decodable {
    let bpi: [String:Float]?
    
    enum CodingKeys:String, CodingKey {
        case bpi
    }
}


