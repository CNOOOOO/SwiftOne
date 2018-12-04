//
//  HotSaleCollectionViewCell.swift
//  SwiftOne
//
//  Created by Mac2 on 2018/7/20.
//  Copyright © 2018年 Mac2. All rights reserved.
//

import UIKit

class HotSaleCollectionViewCell: UICollectionViewCell {
    var bgImageView: UIImageView?
    var titleLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    private func setUpCell() {
        bgImageView = UIImageView()
        bgImageView?.image = UIImage(named: "pic")
        bgImageView?.clipsToBounds = true
        bgImageView?.contentMode = .scaleAspectFill
        bgImageView?.layer.masksToBounds = true
        bgImageView?.layer.cornerRadius = 6
        self.contentView.addSubview(bgImageView!)
        bgImageView!.mas_updateConstraints({ (make) in
            make?.edges.mas_equalTo()(0)
        })
        
        titleLabel = UILabel()
        titleLabel?.text = "Rose"
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel?.textColor = UIColor.white
        titleLabel?.textAlignment = .center
        self.contentView.addSubview(titleLabel!)
        titleLabel!.mas_updateConstraints { (make) in
            make?.center.mas_equalTo()(0)
            make?.left.right().mas_equalTo()(0)
            make?.height.mas_equalTo()(20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
