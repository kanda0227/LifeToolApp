//
//  APIRequestHelper.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/23.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

final class APIRequestHelper<ResponseItem: APIResponseItem> {
    
    /// APIリクエストを送信します
    static public func requestAPI(_ apis: APIs, completion: @escaping (ResponseItem) -> Void) {
        Alamofire.request(apis.url).responseString { response in
            guard let object: String = response.result.value else { return }
            completion(APIRequestHelper.parseData(jsonString: object))
        }
    }
    
    /// パースします
    static private func parseData(jsonString: String) -> ResponseItem {
        return ResponseItem(jsonString: jsonString)
    }
}
