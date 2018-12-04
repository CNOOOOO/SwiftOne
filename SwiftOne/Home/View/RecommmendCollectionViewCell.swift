//
//  RecommmendCollectionViewCell.swift
//  SwiftOne
//
//  Created by Mac2 on 2018/7/20.
//  Copyright © 2018年 Mac2. All rights reserved.
//

import UIKit

class RecommmendCollectionViewCell: UICollectionViewCell {
    var productImage: UIImageView?
    var titleLabel: UILabel?
    var priceLabel: UILabel?
    var salesVolumeLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    func setUpCell() {
        productImage = UIImageView()
        productImage?.clipsToBounds = true
        productImage?.image = UIImage(named: "pic")
        productImage?.contentMode = .scaleAspectFill
        productImage?.layer.masksToBounds = true
        productImage?.layer.cornerRadius = 6
        self.contentView.addSubview(productImage!)
        productImage!.mas_updateConstraints { (make) in
            make?.left.right().top().mas_equalTo()(0)
            make?.height.mas_equalTo()(200)
        }
        
        titleLabel = UILabel()
        titleLabel?.text = "今天你失去的，终有一天会以另一种方式与你相遇"
        titleLabel?.numberOfLines = 2
        titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(titleLabel!)
        titleLabel!.mas_updateConstraints { (make) in
            make?.left.right().mas_equalTo()(0)
            make?.top.equalTo()(productImage?.mas_bottom)
        }
        
        priceLabel = UILabel()
        priceLabel?.text = "¥100.00"
        priceLabel?.textColor = UIColor.red
        priceLabel?.font = UIFont.systemFont(ofSize: 12)
        self.contentView.addSubview(priceLabel!)
        priceLabel!.mas_updateConstraints { (make) in
            make?.left.mas_equalTo()(15)
            make?.top.equalTo()(titleLabel?.mas_bottom)
            make?.bottom.mas_equalTo()(0)
        }
        
        salesVolumeLabel = UILabel()
        salesVolumeLabel?.text = "月售：30"
        salesVolumeLabel?.font = UIFont.systemFont(ofSize: 12)
        salesVolumeLabel?.textAlignment = .right
        self.contentView.addSubview(salesVolumeLabel!)
        salesVolumeLabel!.mas_updateConstraints { (make) in
            make?.right.mas_equalTo()(-15)
            make?.top.equalTo()(titleLabel?.mas_bottom)
            make?.bottom.mas_equalTo()(0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
