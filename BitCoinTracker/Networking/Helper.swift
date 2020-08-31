//
//  Helper.swift
//  BitCoinTracker
//
//  Created by maneesh on 31/08/20.
//  Copyright © 2020 maneesh. All rights reserved.
//

import Foundation
import Alamofire
import UIKit


struct  BitCoinNetworking{

    static func getHistoricalData(_ completion:@escaping (_ result: HistoricOriceResponse?, _ error: Error?) -> Void) {
        
        AF.request(ConstantsEnum.HISTORICAL_PRICE_URL, encoding: URLEncoding.queryString).validate().responseDecodable(of: HistoricOriceResponse.self) { (response) in
            guard let HistoricResp = response.value else {return}
            completion(HistoricResp, nil)
            }
        }
    
    static func getCurrentData(_ completion:@escaping (_ result: CurrentPriceResponse?, _ error: Error?) -> Void) {
    
        AF.request(ConstantsEnum.CURRENT_PRICE_URL, encoding: URLEncoding.queryString).validate().responseDecodable(of: CurrentPriceResponse.self) { (response) in
                  guard let CPResponse = response.value else {return}
                  completion(CPResponse, nil)
                   
                }
    }
        

}

