//
//  WeatherView.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/24.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import UIKit

final class WeatherView: UIView {
    
    required init(frame: CGRect, result: WeatherResponse) {
        super.init(frame: frame)
        
        let nib = UINib(nibName: "WeatherView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    /// 使用しません
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
