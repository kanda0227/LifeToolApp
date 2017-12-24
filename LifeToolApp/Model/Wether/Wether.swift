//
//  Wether.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/24.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import Foundation

struct WeatherSet {
    let weather: Weather
    let time: Time
    
    init?(icon: String) {
        guard let value = icon.split(), let weather = Weather(rawValue: value.1), let time = Time(rawValue: value.0) else { return nil }
        self.weather = weather
        self.time = time
    }
}

enum Weather: Int {
    /// 晴れ
    case clear = 1
    /// ちょっと曇り
    case fewClouds
    /// 曇り
    case scatteredClouds
    /// 曇天
    case brokenClouds
    /// 小雨
    case lightRain
    /// 豪雨
    case heavyRain
    /// 雷雨
    case thunderstorm
    /// 雪
    case snow
    /// 災害系
    case mist
}

enum Time: String {
    /// 日中
    case day = "d"
    /// 夜
    case night = "n"
}

private extension String {
    func split() -> (String, Int)? {
        // 2桁の数字 + アルファベット1文字を想定
        guard self.count == 3 else { return nil }
        
        // ちょっと無理やり感あって好きじゃない
        // 直したい
        let array = self.map { "\($0)" }
        guard let a = Int(array[0]), let b = Int(array[1]) else { return nil }
        let num = a * 10 + b
        
        // 本来であれば以下のように値を取得すべきである．
        // let ch = array[2]
        // どうやら日本時間になっていないようで日中と夜の画像があっていないためアプリ側で制御する
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "HH"
        let hh = dateFomatter.string(from: Date())
        guard let hhInt = Int(hh) else { return nil }
        let ch = (hhInt >= 5) && (hhInt <= 19) ? "d" : "n"
        
        return (ch, num)
    }
}
