//
//  Constants.swift
//  BitCoinTracker
//
//  Created by maneesh on 31/08/20.
//  Copyright © 2020 maneesh. All rights reserved.
//

import Foundation

enum ConstantsEnum {
     static let CURRENT_PRICE_URL: String = "https://api.coindesk.com/v1/bpi/currentprice.json"
     static let HISTORICAL_PRICE_URL: String = "https://api.coindesk.com/v1/bpi/historical/close.json"
    static let USD_CONSTANT: String = " USD"
    static let CURRENT_PRICE_PLACEHOLDER: String = "Current price = "
    static let DATE_FORMAT: String = "yyyy-MM-dd HH:mm:ss"
    static let LAST_UPDATED_PLACEHOLDER: String = "Last Updated on "
    static let HISTORIC_TABLE_HEADING = "Historical Data"
}
