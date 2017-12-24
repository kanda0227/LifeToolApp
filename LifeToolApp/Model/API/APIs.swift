//
//  APIs.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/23.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import Foundation

enum APIs {
    /// 天気
    case weather
    /// 占い
    case divination
    /// 路線
    case rails
    /// 現在地名
    case location
}

extension APIs {
    
    /// APIリクエスト用URL
    public var url: String {
        switch self {
        case .weather:
            // このへん直書きしてるの直したい
            let appid = "APPID=c31afe1056c098c311ca7882f2b8d596"
            let latAndLon = "&lat=35&lon=140"
            return "http://api.openweathermap.org/data/2.5/weather?" + appid + latAndLon
            
        case .divination:
            let dateFomatter = DateFormatter()
            dateFomatter.dateFormat = "yyyy/MM/dd"
            let date = dateFomatter.string(from: Date())
            return "http://api.jugemkey.jp/api/horoscope/free/" + date
            
        case .rails:
            // 未定
            return ""
        case .location:
            // TODO: 現在地の座標を取得して渡す
            let xAndy = "&x=140&y=35"
            return "http://geoapi.heartrails.com/api/json?method=searchByGeoLocation" + xAndy
        }
    }
}
