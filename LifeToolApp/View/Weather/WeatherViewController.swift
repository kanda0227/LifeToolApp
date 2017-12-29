//
//  WeatherViewController.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/24.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import UIKit
import CoreLocation

/// お天気画面
final class WeatherViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var indicator: UIActivityIndicatorView!
    @IBOutlet private weak var blurView: UIVisualEffectView!
    private var x: Double?
    private var y: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ブラーを角丸にする
        blurView.layer.cornerRadius = 10
        blurView.layer.masksToBounds = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        requestWetherAPI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        scrollView.subviews.forEach {
            if $0 is WeatherView {
                $0.removeFromSuperview()
            }
        }
    }
    
    /// WeatherViewController を表示するためのAPIリクエストを走らせる
    private func requestWetherAPI() {
        switchActivityState(true)
        // TODO: ここのネスト罪深いので対策したい
        requestLocation { [weak self] (data: CLLocation) in
            guard let _self = self else { return }
            _self.x = data.coordinate.longitude
            _self.y = data.coordinate.latitude
            _self.requestLocationName(x: _self.x!, y: _self.y!) { [weak self] (response: LocationResponseItem) -> Void in
                guard let _self = self, let locate = response.result.first, let x = _self.x, let y = _self.y else { return }
                _self.requestWeather(x: x, y: y, locate: locate) { [weak self] (data: WeatherResponseItem) -> Void in
                    guard let _self = self else { return }
                    let view: WeatherView = WeatherView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 725), result: data.results, locate: locate)
                    _self.scrollView.addSubview(view)
                    _self.scrollView.contentSize = view.frame.size
                    _self.switchActivityState(false)
                }
            }
        }
    }
    
    /// 現在地の緯度と経度を取得する
    private func requestLocation(completion: @escaping (CLLocation) -> Void) {
        LocationHelper.shared.requestLocationXY(completion: completion)
    }
    
    /// 緯度と経度から現在地名を取得する
    private func requestLocationName(x: Double, y: Double, completion: @escaping (LocationResponseItem) -> Void) {
        let addParam = "&x=\(x)&y=\(y)"
        APIRequestHelper<LocationResponseItem>.requestAPI(.location, addParam: addParam, completion: completion)
    }
    
    /// 緯度と経度から現在地の天気を取得する
    private func requestWeather(x: Double, y: Double, locate: Location, completion: @escaping (WeatherResponseItem) -> Void) {
        let addParam = "&lat=\(y)&lon=\(x)"
        APIRequestHelper<WeatherResponseItem>.requestAPI(.weather, addParam: addParam, completion: completion)
    }
    
    /// インジケータとブラーの表示・アニメーションを切り替える
    private func switchActivityState(_ isLoading: Bool) {
        if isLoading {
            indicator.startAnimating()
        } else {
            indicator.stopAnimating()
        }
        self.indicator.isHidden = !isLoading
        self.blurView.isHidden = !isLoading
    }
}
