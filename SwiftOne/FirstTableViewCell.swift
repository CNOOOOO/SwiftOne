//
//  FirstTableViewCell.swift
//  SwiftOne
//
//  Created by Mac2 on 2018/7/19.
//  Copyright © 2018年 Mac2. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    var bgImageView: UIImageView?
    var titleLabel: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    func setupViews() {
        self.bgImageView = UIImageView.init(image: UIImage.init(named: "pic"))
        self.contentView.addSubview(self.bgImageView!)
        self.bgImageView!.mas_updateConstraints { (make) in
            make?.edges.mas_equalTo()(0)
        }
        
        self.titleLabel = UILabel.init()
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.titleLabel?.textColor = UIColor.white
        self.titleLabel?.textAlignment = .center
        self.contentView.addSubview(self.titleLabel!)
        self.titleLabel!.mas_updateConstraints({ (make) in
            make?.left.right().bottom().mas_equalTo()(0)
            make?.height.mas_equalTo()(30)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder:) has not been implemented!")
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
