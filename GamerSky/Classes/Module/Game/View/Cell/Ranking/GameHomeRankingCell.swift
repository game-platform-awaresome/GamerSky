//
//  GameHomeRankingCell.swift
//  GamerSky
//
//  Created by InsectQY on 2018/4/10.
//Copyright © 2018年 engic. All rights reserved.
//

import UIKit

class GameHomeRankingCell: UICollectionViewCell, NibReusable {

    @IBOutlet private weak var ratingView: CosmosView!
    @IBOutlet private weak var rankingBtn: UIButton!
    @IBOutlet private weak var percentLabel: BaseLabel!
    @IBOutlet private weak var gameImageView: UIImageView!
    @IBOutlet private weak var gameNameLabel: UILabel!
    
    private var rankingImage = [#imageLiteral(resourceName: "common_Icon_Index1_16x18"), #imageLiteral(resourceName: "common_Icon_Index2_16x18"), #imageLiteral(resourceName: "common_Icon_Index3_16x18")]
    
    public var row = 0 {
        
        didSet {
            
            guard row > rankingImage.count - 1 else {
                
                rankingBtn.setImage(rankingImage[row], for: .normal)
                return
            }
            rankingBtn.setTitle("\(row + 1)", for: .normal)
        }
    }
    
    public var info: GameInfo? {
        
        didSet {
            
            gameNameLabel.text = info?.Title
            gameImageView.qy_setImage(info?.DefaultPicUrl, "")
            percentLabel.text = info?.gsScore
            ratingView.rating = info?.score ?? 0
        }
    }
}
