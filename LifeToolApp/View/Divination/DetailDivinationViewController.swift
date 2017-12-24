//
//  DetailDivinationViewController.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/23.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import UIKit

final class DetailDivinationViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var userResult: DivinationResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let result = userResult {
            let detailView: DetailDivinationView = DetailDivinationView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 777), result: result)
            scrollView.addSubview(detailView)
            scrollView.contentSize = detailView.frame.size
            
            navigationItem.title = "今日の" + result.sign!.name + "さんの占い結果"
        }
    }
}
