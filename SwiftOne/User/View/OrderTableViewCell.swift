//
//  OrderTableViewCell.swift
//  SwiftOne
//
//  Created by Mac2 on 2018/8/3.
//  Copyright © 2018年 Mac2. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    var lastButton: UIButton?
    var ordersBlock:((UIButton) ->())?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
    
    func setUpCell() {
        self.selectionStyle = .none
        let images: [String] = ["pendingPayment","goodToBeReceived","inReturn","toBeEvaluated","finished","search"]
        let titles: [String] = ["待付款","待收货","退货中","待评价","已完成","搜索"]
        for i in 0...5 {
            let button = UIButton.init(type: .custom)
            button.isExclusiveTouch = true
            button.setImage(imageNamed(images[i]), for: .normal)
            button.setTitle(titles[i], for: .normal)
            button.setTitleColor(UIColor.init(white: 0, alpha: 0.5), for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            let image: UIImage = imageNamed(images[i])!
            button.titleEdgeInsets = UIEdgeInsetsMake(image.size.height * 0.5 + 5, -image.size.width * 0.5, -image.size.height * 0.5 - 5, image.size.width * 0.5)
            let rect = NSString(string: titles[i]).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: (button.titleLabel?.bounds.size.height)!), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: button.titleLabel!.font], context: nil)
            button.imageEdgeInsets = UIEdgeInsetsMake(-rect.size.height * 0.5 - 5, rect.size.width * 0.5, rect.size.height * 0.5 + 5, -rect.size.width * 0.5)
            button.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
            self.contentView.addSubview(button)
            if lastButton == nil {
                button.mas_updateConstraints { (make) in
                    make?.left.mas_equalTo()(0)
                    make?.top.mas_equalTo()(12)
                    make?.height.mas_equalTo()(60)
                    make?.width.mas_equalTo()(SCREEN_WIDTH / 3.0)
                }
            }else {
                if i == 3 {
                    button.mas_updateConstraints { (make) in
                        make?.left.mas_equalTo()(0)
                        make?.bottom.mas_equalTo()(-12)
                        make?.height.mas_equalTo()(60)
                        make?.width.mas_equalTo()(SCREEN_WIDTH / 3.0)
                    }
                }else {
                    button.mas_updateConstraints { (make) in
                        make?.left.equalTo()(lastButton?.mas_right)
                        make?.top.equalTo()(lastButton)
                        make?.height.mas_equalTo()(60)
                        make?.width.mas_equalTo()(SCREEN_WIDTH / 3.0)
                    }
                }
            }
            lastButton = button
        }
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if ordersBlock != nil {
            ordersBlock!(sender)
        }
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
