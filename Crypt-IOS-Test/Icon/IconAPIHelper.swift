//
//  IconAPIHelper.swift
//  Crypt-IOS-Test
//
//  Created by Yujia on 2022/3/13.
//

import Foundation
enum GetIconResult{
    case success(Data)
    case failure(Error)
}
enum IconResult{
    case success(Icon)
    case failure(Error)
}
class Icon: Codable {
    var asset_id: String
    var url: String
}

//can load NSDictionary on the view
struct IconAPIHelper{
    private static var baseURL : String = "https://rest.coinapi.io/v1/assets/icons/64"
    private static var apiKey: String = "?apikey=0DEB865A-360B-49B6-841C-811224CFCB2F"
    private static var session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    static func fetch(callback: @escaping (Array<Any>) -> Void){
        guard
            let url = URL(string: baseURL + apiKey)
        else{return}
        
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            data, response, error in
            
            if let data = data {
                do{
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                    
                    OperationQueue.main.addOperation {
                        callback(jsonObject as! Array<Any>)
                    }

                }catch let e {
                   print("error \(e)")
               }
            } else if let error = error {
                print("there was an error: \(error)")
            } else {
                print("something went wrong")
            }
        }
        task.resume()
    }//

}
