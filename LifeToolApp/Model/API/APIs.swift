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
}

extension APIs {
    
    /// APIリクエスト用URL
    public var url: String {
        switch self {
        case .weather:
            // 未定
            return ""
        case .divination:
            let dateFomatter = DateFormatter()
            dateFomatter.dateFormat = "yyyy/MM/dd"
            let date = dateFomatter.string(from: Date())
            return "http://api.jugemkey.jp/api/horoscope/free/" + date
        case .rails:
            // 未定
            return ""
        }
    }
}
