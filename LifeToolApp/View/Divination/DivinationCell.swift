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
    
    func configure(sign: Sign, rank: Int) {
        signLabel.text = sign.name
        signImageView.image = sign.image
        rankImageView.image = makeRankImage(rank: rank)
    }
    
    private func makeRankImage(rank: Int) -> UIImage? {
        switch rank {
        case 1:
            return #imageLiteral(resourceName: "first")
        case 2:
            return #imageLiteral(resourceName: "second")
        case 3:
            return #imageLiteral(resourceName: "third")
        default:
            return nil
        }
    }
}
