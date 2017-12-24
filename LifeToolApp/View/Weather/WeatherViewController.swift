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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIRequestHelper<WeatherResponseItem>.requestAPI(.weather, completion: { (data: WeatherResponseItem) -> Void
 in
        })
    }
}
