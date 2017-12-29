//
//  WeatherView.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/24.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import UIKit

final class WeatherView: UIView {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var temp_maxLabel: UILabel!
    @IBOutlet weak var temp_minLabel: UILabel!
    @IBOutlet weak var cloudsLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windCheckLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    private let per = "%"
    private let degree = "℃"
    private let hPa = "hPa"
    private let mps = "m/s"
    
    required init(frame: CGRect, result: WeatherResponse, locate: Location) {
        super.init(frame: frame)
        
        let nib = UINib(nibName: "WeatherView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
        configure(data: result, location: locate)
    }
    
    /// 使用しません
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// データをView に反映します
    private func configure(data: WeatherResponse, location: Location) {
        locationLabel.text = location.prefecture + " " +  location.city
        weatherLabel.text = data.weather.first?.main?.weather.displayText
        tempLabel.text = makeDisplayStr(unit: degree, num: makeTemp(temp: data.main.temp))
        temp_maxLabel.text = makeDisplayStr(unit: degree, num: makeTemp(temp: data.main.temp_max))
        temp_minLabel.text = makeDisplayStr(unit: degree, num: makeTemp(temp: data.main.temp_min))
        cloudsLabel.text = makeDisplayStr(unit: per, num: data.clouds.all)
        pressureLabel.text = makeDisplayStr(unit: hPa, num: data.main.pressure)
        humidityLabel.text = makeDisplayStr(unit: per, num: data.main.humidity)
        windSpeedLabel.text = makeDisplayStr(unit: mps, num: data.wind.speed)
        windCheckLabel.text = data.wind.check.displayText
        weatherImageView.image = data.weather.first?.main?.image
    }
    
    /// viewのデータをリセットします
    private func resetView() {
        locationLabel.text?.removeAll()
        weatherLabel.text?.removeAll()
        tempLabel.text?.removeAll()
        temp_maxLabel.text?.removeAll()
        temp_minLabel.text?.removeAll()
        cloudsLabel.text?.removeAll()
        pressureLabel.text?.removeAll()
        humidityLabel.text?.removeAll()
        windSpeedLabel.text?.removeAll()
        windCheckLabel.text?.removeAll()
        weatherImageView.image = nil
    }
    
    /// 単位付きの数字を表示用のStringに変換します
    private func makeDisplayStr(unit: String, num: CountableType) -> String {
        return "\(num)" + unit
    }
    
    /// 温度の単位をkから℃に変換します
    private func makeTemp(temp: Double) -> Double {
        let degreeTemp = temp - 273.15
        return round(degreeTemp * 10) / 10
    }
}

/// 数字型
private protocol CountableType {}

extension Int: CountableType {}
extension Double: CountableType {}
extension Float: CountableType {}
