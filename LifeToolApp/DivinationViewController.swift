//
//  DivinationViewController.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/23.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import UIKit

/// 占い画面
final class DivinationViewController: UIViewController {
    
    var top3Sign: [Sign?]?
    var userResult: DivinationResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIRequestHelper<DivinationResponseItem>.requestAPI(.divination, completion:  { [weak self] (data: DivinationResponseItem) -> Void in
            guard let _self = self else { return }
            _self.top3Sign = DivinationLogic.filterTop3(data.results)
            _self.userResult = DivinationLogic.userConstellationData(data.results, userSign: .pisces)
        })
    }
}
