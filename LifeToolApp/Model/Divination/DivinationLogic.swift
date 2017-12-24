//
//  DivinationLogic.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/23.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import Foundation

enum DivinationLogic {
    
    /// 上位3つの星座をソートして返す
    static func filterTop3(_ data: [DivinationResult]) -> [Sign?] {
        let tes = data.filter { $0.rank < 4 }.sorted(by: { (pre, post) in
            pre.rank < post.rank
        })
        return data.filter { $0.rank < 4 }.sorted(by: { (pre, post) in
            pre.rank < post.rank
        }).map { $0.sign }
    }
    
    /// ユーザーの星座の結果だけを返す
    static func userConstellationData(_ data: [DivinationResult], userSign: Sign) -> DivinationResult? {
        return data.first(where: { $0.sign == userSign })
    }
}
