//
//  DefaultTableViewCell.swift
//  SwiftOne
//
//  Created by Mac2 on 2018/8/6.
//  Copyright © 2018年 Mac2. All rights reserved.
//

import UIKit

class DefaultTableViewCell: UITableViewCell {
    var titleLabel: UILabel?
    var goNextButtom: UIButton?
    var line: UIImageView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
    }
    
    func setUpCell() {
        self.selectionStyle = .none
        
        titleLabel = UILabel()
        titleLabel?.font = UIFont.systemFont(ofSize: 15)
        titleLabel?.textColor = UIColor.black
        self.contentView.addSubview(titleLabel!)
        titleLabel!.mas_updateConstraints { (make) in
            make?.left.mas_equalTo()(15)
            make?.centerY.mas_equalTo()(0)
            make?.height.mas_equalTo()(30)
            make?.width.equalTo()(self.contentView)?.multipliedBy()(0.6)
        }
        
        goNextButtom = UIButton.init(type: .custom)
        goNextButtom?.setImage(imageNamed("goNext"), for: .normal)
        self.contentView.addSubview(goNextButtom!)
        goNextButtom!.mas_updateConstraints { (make) in
            make?.right.mas_equalTo()(-15)
            make?.top.bottom().mas_equalTo()(0)
        }
        
        line = UIImageView()
        line?.image = UIImage.imageWithColor(BGColor)
        self.contentView.addSubview(line!)
        line!.mas_updateConstraints { (make) in
            make?.left.bottom().right().mas_equalTo()(0)
            make?.height.mas_equalTo()(0.5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
