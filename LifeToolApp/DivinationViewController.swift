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
    
    @IBOutlet private weak var tableView: UITableView!
    
    var top3Sign: [Sign?]?
    var userResult: DivinationResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DivinationCell", bundle: nil), forCellReuseIdentifier: "top3SignCell")
        
        requestAPI()
    }
    
    @IBAction func tapReloadButton(_ sender: UIBarButtonItem) {
        tableView.reloadData()
    }
    
    @IBAction func tapDetailButton(_ sender: UIButton) {
        performSegue(withIdentifier: "pushDetail", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender is UIButton {
            let vc = segue.destination as? DetailDivinationViewController
            vc?.userResult = self.userResult
        }
    }
    
    /// 占いAPIのリクエスト
    private func requestAPI() {
        APIRequestHelper<DivinationResponseItem>.requestAPI(.divination, completion:  { [weak self] (data: DivinationResponseItem) -> Void in
            guard let _self = self else { return }
            _self.top3Sign = DivinationLogic.filterTop3(data.results)
            _self.userResult = DivinationLogic.userConstellationData(data.results, userSign: .pisces)
            _self.tableView.reloadData()
        })
    }
}

extension DivinationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "top3SignCell", for: indexPath) as! DivinationCell
        if let top3Sign = top3Sign, let sign = top3Sign[indexPath.row] {
            // ランクは1から
            cell.configure(sign: sign, rank: indexPath.row + 1)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
