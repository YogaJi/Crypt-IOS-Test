//
//  Icon.swift
//  Crypt-IOS-Test
//
//  Created by Yujia on 2022/3/13.
//
//
//import Foundation
//enum IconResult{
//    case success([IconList])
//    case failure(Error)
//}
//class Icons: Codable{
//    var iconArrays: [IconList]
//}
//struct IconList: Codable{
//    var asset_id: String
//    var url: String
//}
//func fetchIcons(callback: @escaping (IconResult) -> Void){
//    IconAPI.fetch { GetIconResult in
//        switch GetIconResult {
//        case .success(let data):
//            do{
//                let decoder = JSONDecoder()
//                let icons = try decoder.decode(Icons.self, from: data)
//                
//                OperationQueue.main.addOperation {
//                    callback(.success(icons.iconArrays))
//                    print(icons.iconArrays)
//                }
//                
//            } catch let e {
//                print("could not parse json data \(e)")
//            }
//        case .failure(let error):
//            print("there was an error fetchin information \(error)")
//        }
//
//    }
//}
