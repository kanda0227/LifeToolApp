//
//  DetailDivinationView.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/23.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import UIKit

final class DetailDivinationView: UIView {
    
    @IBOutlet weak var totalView: Divination5StepEvaluationView!
    @IBOutlet weak var jobView: Divination5StepEvaluationView!
    @IBOutlet weak var loveView: Divination5StepEvaluationView!
    @IBOutlet weak var moneyView: Divination5StepEvaluationView!
    @IBOutlet var signImageView: UIImageView!
    @IBOutlet var itemLabel: UILabel!
    @IBOutlet var colorLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    var result: DivinationResult?
    
    required init(frame: CGRect, result: DivinationResult) {
        super.init(frame: frame)
        let nib = UINib(nibName: "DetailDivinationView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
        configure(result: result)
    }
    
    /// 使用しません
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setResult(_ result: DivinationResult?) {
        self.result = result
    }
    
    func configure(result: DivinationResult) {
        
        totalView.evaluation(result.total)
        jobView.evaluation(result.job)
        loveView.evaluation(result.love)
        moneyView.evaluation(result.money)
        signImageView.image = result.sign?.image
        itemLabel.text = result.item
        colorLabel.text = result.color
        contentLabel.text = result.content
    }
}
