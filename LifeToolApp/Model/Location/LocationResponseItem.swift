//
//  LocationResponseItem.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/24.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import Foundation
import ObjectMapper

final class LocationResponseItem: APIResponseItem {
    let result: [Location]
    init(jsonString: String) {
        result = (Mapper<LocationResponse>().map(JSONString: jsonString)?.response.location)!
    }
}

struct LocationResponse: Mappable {
    var response: LocationParent!
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        response <- map["response"]
    }
}

struct LocationParent: Mappable {
    var location: [Location]!
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        location <- map["location"]
    }
}

struct Location: Mappable {
    // 取得はするけどドキュメンテーションコメントつけてないアイテムは使わない
    /// 市区町村名
    var city: String!
    var city_kana: String!
    var distance: Double!
    var postal: Int16!
    /// 都道府県
    var prefecture: String!
    /// 町域名
    var town: String!
    var town_kana: String!
    var x: Float!
    var y: Float!
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        city <- map["city"]
        city_kana <- map["city_kana"]
        distance <- map["distance"]
        postal <- map["postal"]
        prefecture <- map["prefecture"]
        town <- map["town"]
        town_kana <- map["town_kana"]
        x <- map["x"]
        y <- map["y"]
    }
}
