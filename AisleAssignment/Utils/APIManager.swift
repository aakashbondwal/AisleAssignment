//
//  APIManager.swift
//  AisleAssignment
//
//  Created by Aakash  Bondwal  on 18/08/23.
//

import Foundation
import Alamofire

struct APIManager {
    
    static let sharedInstance = APIManager();
    
    func GetRequestInterceptor(_ url:String, headers: [String: String], successBlock:@escaping (Data) -> Void, failure: @escaping (Error) -> Void) {
        AF.request(url, method: .get, headers: HTTPHeaders.init(headers)).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    _ = try JSONSerialization.jsonObject(with: data)
                    successBlock(data)
                } catch {
                    debugPrint("decoding error:\n", error)
                }
            case .failure(let error):
                debugPrint(error)
                failure(error)
            }
        }
    }
    
    func PostRequestInterceptor(_ url:String, body: [String: Any], successBlock:@escaping (Data) -> Void, failure: @escaping (Error) -> Void) {
        AF.request(url, method: .post, parameters: body).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    _ = try JSONSerialization.jsonObject(with: data)
                    successBlock(data)
                } catch {
                    debugPrint("decoding error:\n", error)
                }
            case .failure(let error):
                debugPrint("AF Error:", error)
                failure(error)
            }
        }
    }
    
}


