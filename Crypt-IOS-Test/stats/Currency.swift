//
//  Currency.swift
//  Crypt-IOS-Test
//
//  Created by Yujia on 2022/3/13.
//

import Foundation
enum CurrencyListResult{
    case success([CurrencyList])
    case failure (Error)
}
class Currency: Codable{
    var currencyArrays: [CurrencyList]
}
struct CurrencyList: Codable{
    var asset_id: String
    var name: String
    var volume_1hrs_usd: Double
    var price_usd: Double
    var id_icon: String
}
func fetchCurrencyList(callback: @escaping (CurrencyListResult) -> Void){
    CurrencyAPIHelper.fetch { getCurrencyResult in
        switch getCurrencyResult {
        case .success(let data):
            do{
                let decoder = JSONDecoder()
                let currency = try decoder.decode(Currency.self, from: data)
                
                OperationQueue.main.addOperation {
                    callback(.success(currency.currencyArrays))
                    print(currency.currencyArrays)
                }
                
            } catch let e {
                print("could not parse json data \(e)")
            }
        case .failure(let error):
            print("there was an error fetchin information \(error)")
        }

    }
}
