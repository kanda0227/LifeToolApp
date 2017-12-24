//
//  APIProtocols.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/23.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import Foundation

protocol APIRequestItem {}

protocol APIResponseItem {
    init(jsonString: String)
}
