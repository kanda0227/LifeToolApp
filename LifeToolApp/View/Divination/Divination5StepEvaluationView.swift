//
//  Divination5StepEvaluationView.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/23.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import UIKit

final class Divination5StepEvaluationView: UIView {
    @IBOutlet var imageViews: [UIImageView]!
    
    func evaluation(_ value: Int) {
        imageViews.forEach {
            $0.isHighlighted = ($0.tag <= value)
        }
    }
}
