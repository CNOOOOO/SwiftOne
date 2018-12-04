//
//  BalanceView.swift
//  SwiftOne
//
//  Created by Mac2 on 2018/7/30.
//  Copyright © 2018年 Mac2. All rights reserved.
//

import UIKit

class BalanceView: UIView {
    var chooseAllButton: UIButton?
    var totalPrice: UILabel?
    var balanceButton: UIButton?
    var chooseAllProducts:((Bool) ->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    func setUpView() {
        self.backgroundColor = UIColor.white
        
//        let line = UIView()
//        line.backgroundColor = UIColor.gray
//        self.addSubview(line)
//        line.mas_updateConstraints { (make) in
//            make?.left.top().right().mas_equalTo()(0)
//            make?.height.mas_equalTo()(0.5)
//        }
        
        chooseAllButton = UIButton.init(type: .custom)
        chooseAllButton?.isExclusiveTouch = true
        chooseAllButton?.setImage(imageNamed("unSelected"), for: .normal)
        chooseAllButton?.setImage(imageNamed("selected"), for: .selected)
        chooseAllButton?.setTitle("全选", for: .normal)
        chooseAllButton?.setTitle("全选", for: .selected)
        chooseAllButton?.setTitleColor(UIColor.black, for: .normal)
        chooseAllButton?.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        chooseAllButton?.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5)
        chooseAllButton?.imageEdgeInsets = UIEdgeInsetsMake(0, -3, 0, 3)
        chooseAllButton?.addTarget(self, action: #selector(chooseAllButtonClicked(sender:)), for: .touchUpInside)
        self.addSubview(chooseAllButton!)
        chooseAllButton!.mas_updateConstraints { (make) in
            make?.left.top().bottom().mas_equalTo()(0)
            make?.width.mas_equalTo()(80)
        }
        
        balanceButton = UIButton.init(type: .custom)
        balanceButton?.isExclusiveTouch = true
        balanceButton?.backgroundColor = UIColor.lightGray
        balanceButton?.isUserInteractionEnabled = false
        balanceButton?.setTitle("结算", for: .normal)
        balanceButton?.setTitleColor(UIColor.white, for: .normal)
        balanceButton?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        balanceButton?.addTarget(self, action: #selector(balanceButtonClick), for: .touchUpInside)
        self.addSubview(balanceButton!)
        balanceButton!.mas_updateConstraints { (make) in
            make?.top.right().bottom().mas_equalTo()(0)
            make?.width.equalTo()(self)?.multipliedBy()(0.25)
        }
        
        totalPrice = UILabel()
        totalPrice?.textAlignment = .right
        self.addSubview(totalPrice!)
        //第一部分
        let multipleAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)]
        let attributeString = NSMutableAttributedString(string: "总计：", attributes: multipleAttributes)//有属性变化的情况下，用可变属性字符串
        //第二部分
        let newMultipleAttributes = [NSAttributedStringKey.foregroundColor: UIColor.red, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        let newAttributeString = NSAttributedString(string: "¥ 0.00", attributes: newMultipleAttributes)
        attributeString.append(newAttributeString)
        
//        //添加属性（可以处理字体大小一致，文字颜色不同或文字颜色一致，字体大小不同的情况）
//        let range = NSRange(location: 0, length: 3)
//        attributeString.addAttributes([NSAttributedStringKey.foregroundColor: UIColor.green], range: range)
//        //添加图片
//        let attachment = NSTextAttachment(data: nil, ofType: nil)
//        attachment.image = UIImage(named: "01")
//        attachment.bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
//        let image_text = NSAttributedString(attachment: attachment)
//        attributeString.append(image_text)
        
        totalPrice?.attributedText = attributeString
        totalPrice!.mas_updateConstraints { (make) in
            make?.centerY.mas_equalTo()(0)
            make?.right.equalTo()(balanceButton?.mas_left)?.offset()(-10)
        }
    }
    
    @objc func chooseAllButtonClicked(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        chooseAllProducts!(sender.isSelected)
    }
    
    @objc func balanceButtonClick() {
        print("跳转结算页面")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
