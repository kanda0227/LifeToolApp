//
//  DivinationResponseItem.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/23.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import Foundation
import ObjectMapper

final class DivinationResponseItem: APIResponseItem {
    
    let results: [DivinationResult]
    
    init(jsonString: String) {
        results = (Mapper<DivinationResponse>().map(JSONString: jsonString)?.responseData.results)!
    }
}

/// 占いAPIの結果
struct DivinationResponse: Mappable {
    
    var responseData: DivinationDateData!
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        responseData <- map["horoscope"]
    }
}

/// 日付に対するすべての星座の占い結果
struct DivinationDateData: Mappable {
    var date: String {
        // ここは本来であればURLを作成した時の日付を使わないといけない
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "yyyy/MM/dd"
        return dateFomatter.string(from: Date())
    }
    var results: [DivinationResult]!
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        results <- map[date]
    }
}

/// 星座ごとの占い結果
struct DivinationResult: Mappable {
    /// 占いの内容
    var content: String!
    /// ラッキーアイテム
    var item: String!
    /// 金運
    var money: Int!
    /// 総合運
    var total: Int!
    /// 仕事運
    var job: Int!
    /// ラッキーカラー
    var color: String!
    /// 恋愛運
    var love: Int!
    /// ランキング
    var rank: Int!
    /// 星座名
    var signData: String!
    
    var sign: Sign? {
        return Sign(name: signData)
    }
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        content <- map["content"]
        item <- map["item"]
        money <- map["money"]
        total <- map["total"]
        job <- map["job"]
        color <- map["color"]
        love <- map["love"]
        rank <- map["rank"]
        signData <- map["sign"]
    }
}
