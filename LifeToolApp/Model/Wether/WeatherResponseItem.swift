//
//  WeatherResponseItem.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/24.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import Foundation
import ObjectMapper

final class WeatherResponseItem: APIResponseItem {
    
    let results: WeatherResponse
    
    init(jsonString: String) {
        results = Mapper<WeatherResponse>().map(JSONString: jsonString)!
    }
}

/// 天気APIの結果
///
/// 多くの情報が返ってくるが使わないものが非常に多いため，使わないデータは省略する
struct WeatherResponse: Mappable {
    
    /// 雲量
    var clouds: CloudAll!
    /// 気温情報(湿度もあるよ)
    var main: Temperature!
    /// 地名
    var name: String!
    /// 天気
    var weather: [WeatherMain]!
    /// 風
    var wind: Wind!
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        clouds <- map["clouds"]
        main <- map["main"]
        name <- map["name"]
        weather <- map["weather"]
        wind <- map["wind"]
    }
}

/// 雲量の内部構造
struct CloudAll: Mappable {
    
    var all: Int!
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        all <- map["all"]
    }
}

/// 気温系の内部構造
struct Temperature: Mappable {
    
    /// 気圧
    var pressure: Int!
    /// 湿度
    var humidity: Int!
    /// 気温(K)
    var temp: Double!
    /// 最高気温(K)
    var temp_max: Double!
    /// 最低気温(K)
    var temp_min: Double!
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        pressure <- map["pressure"]
        humidity <- map["humidity"]
        temp <- map["temp"]
        temp_max <- map["temp_max"]
        temp_min <- map["temp_min"]
    }
}

/// お天気情報
struct WeatherMain: Mappable {
    
    /// 大体の天気
    ///
    /// 天気の種類がありすぎて大変なので，アイコン画像で判定する
    var icon: String!
    var main: WeatherSet? {
        return WeatherSet(icon: icon)
    }
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        icon <- map["icon"]
    }
}

/// 風情報
struct Wind: Mappable {
    
    var speed: Double!
    var check: WindChecker {
        return WindChecker(speed: speed)
    }
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        speed <- map["speed"]
    }
}
