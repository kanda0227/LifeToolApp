//
//  WeatherViewController.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/24.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import UIKit

/// お天気画面
final class WeatherViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIRequestHelper<LocationResponseItem>.requestAPI(.location, completion: { [weak self] (data: LocationResponseItem) -> Void in
            guard let _self = self, let locate = data.result.first else { return }
            _self.requestWeather(locate: locate)
        })
        
    }
    
    private func requestWeather(locate: Location) {
        APIRequestHelper<WeatherResponseItem>.requestAPI(.weather, completion: { [weak self] (data: WeatherResponseItem) -> Void in
            guard let _self = self else { return }
            let view: WeatherView = WeatherView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 725), result: data.results, locate: locate)
            _self.scrollView.addSubview(view)
            _self.scrollView.contentSize = view.frame.size
        })
    }
}
