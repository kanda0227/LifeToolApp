//
//  Sign.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/23.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import Foundation
import UIKit

/// 星座の列挙型
enum Sign: Int {
    /// 牡羊座
    case aries = 0
    /// 牡牛座
    case taurus
    /// 双子座
    case gemini
    /// 蟹座
    case cancer
    /// 獅子座
    case leo
    /// 乙女座
    case virgo
    /// 天秤座
    case libra
    /// 蠍座
    case scorpius
    /// 射手座
    case sagittarius
    /// 山羊座
    case capriconus
    /// 水瓶座
    case aquarius
    /// 魚座
    case pisces
}

extension Sign {
    
    /// 表記名
    public var name: String {
        switch self {
        case .aries:
            return "牡羊座"
        case .taurus:
            return "牡牛座"
        case .gemini:
            return "双子座"
        case .cancer:
            return "蟹座"
        case .leo:
            return "獅子座"
        case .virgo:
            return "乙女座"
        case .libra:
            return "天秤座"
        case .scorpius:
            return "蠍座"
        case .sagittarius:
            return "射手座"
        case .capriconus:
            return "山羊座"
        case .aquarius:
            return "水瓶座"
        case .pisces:
            return "魚座"
        }
    }
    
    public var image: UIImage? {
        switch self {
        case .cancer:
            return #imageLiteral(resourceName: "cancer")
        case .leo:
            return #imageLiteral(resourceName: "leo")
        case .virgo:
            return #imageLiteral(resourceName: "virgo")
        case .libra:
            return #imageLiteral(resourceName: "libra")
        case .scorpius:
            return #imageLiteral(resourceName: "scorpius")
        case .sagittarius:
            return #imageLiteral(resourceName: "sagittarius")
        case .capriconus:
            return #imageLiteral(resourceName: "capriconus")
        case .aquarius:
            return #imageLiteral(resourceName: "aquarius")
        case .pisces:
            return #imageLiteral(resourceName: "pisces")
        default:
            // まだ画像取り込んでない
            return nil
        }
    }
    
    /// Signのすべての要素を持つ配列
    private static var all: [Sign] {
        return Array(self.iterator)
    }
    
    /// 表示名を使用してSignを初期化
    init?(name: String) {
        guard let sign = Sign.all.first(where: { $0.name == name }) else { return nil }
        self = sign
    }
}

// MARK: Iterator
extension Sign {
    
    private struct Iterator: IteratorProtocol {
        typealias Element = Sign
        
        var current: Sign? = .aries
        
        public mutating func next() -> Element? {
            current = Sign(rawValue: (current?.rawValue)! + 1)
            return current
        }
    }
    
    fileprivate static var iterator: AnyIterator<Sign> {
        return AnyIterator<Sign>(self.Iterator())
    }
}
