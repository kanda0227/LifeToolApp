//
//  WindChecker.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/24.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import Foundation

enum WindChecker {
    /// 平穏
    case calm
    /// 程よい
    case gentle
    /// 強い
    case strong
    
    init(speed: Double) {
        switch speed {
        case 0 ..< 3.4:
            self = .calm
        case 3.4 ..< 10.8:
            self = .gentle
        default:
            self = .strong
        }
    }
}
