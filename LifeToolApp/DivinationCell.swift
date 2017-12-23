//
//  DivinationCell.swift
//  LifeToolApp
//
//  Created by Kanda Sena on 2017/12/23.
//  Copyright © 2017 sena.kanda. All rights reserved.
//

import UIKit

final class DivinationCell: UITableViewCell {
    @IBOutlet weak var rankImageView: UIImageView!
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var signImageView: UIImageView!
    
    func configure(sign: Sign) {
        signLabel.text = sign.name
    }
}
