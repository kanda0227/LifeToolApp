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
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LocationHelper.shared.requestLocationXY(completion: { [weak self] (data: CLLocation) in
            guard let _self = self else { return }
            _self.requestLocationName(x: data.coordinate.longitude, y: data.coordinate.latitude)
        })
    }
    
    private func requestLocationName(x: Double, y: Double) {
        let addParam = "&x=\(x)&y=\(y)"
        APIRequestHelper<LocationResponseItem>.requestAPI(.location, addParam: addParam, completion: { [weak self] (data: LocationResponseItem) -> Void in
            guard let _self = self, let locate = data.result.first else { return }
            _self.requestWeather(x: x, y: y, locate: locate)
        })
    }
    
    private func requestWeather(x: Double, y: Double, locate: Location) {
        let addParam = "&lat=\(y)&lon=\(x)"
        APIRequestHelper<WeatherResponseItem>.requestAPI(.weather, addParam: addParam, completion: { [weak self] (data: WeatherResponseItem) -> Void in
            guard let _self = self else { return }
            let view: WeatherView = WeatherView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 725), result: data.results, locate: locate)
            _self.scrollView.addSubview(view)
            _self.scrollView.contentSize = view.frame.size
        })
    }
}
