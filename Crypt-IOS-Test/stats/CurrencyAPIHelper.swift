//
//  CurrencyAPIHelper.swift
//  Crypt-IOS-Test
//
//  Created by Yujia on 2022/3/13.
//

import Foundation
enum GetCurrencyResult{
    case success(Data)
    case failure(Error)
}

struct CurrencyAPIHelper{
    private static var baseURL : String = "https://rest.coinapi.io/v1/assets/btc"
    private static var apiKey: String = "?apikey=0DEB865A-360B-49B6-841C-811224CFCB2F"
    private static var session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    static func fetch(url: String = baseURL, callback: @escaping (GetCurrencyResult) -> Void){
        guard
            let url = URL(string: url)
        else{return}
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            data, response, error in
            
            if let data = data {
                callback(.success(data))
            }else if let error = error {
                callback(.failure(error))
            }
            }
        
        task.resume()
    }

    }
