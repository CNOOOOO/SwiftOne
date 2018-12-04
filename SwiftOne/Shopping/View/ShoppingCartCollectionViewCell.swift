//
//  ShoppingCartCollectionViewCell.swift
//  SwiftOne
//
//  Created by Mac2 on 2018/7/27.
//  Copyright © 2018年 Mac2. All rights reserved.
//

import UIKit

class ShoppingCartCollectionViewCell: UICollectionViewCell {
    var chooseButton: UIButton?
    var productImageView: UIImageView?
    var productNameLabel: UILabel?
    var productModelLabel: UILabel?
    var productPriceLabel: UILabel?
    var reduceButton: UIButton?
    var addButton: UIButton?
    var numberTextfield: UITextField?
    var chooseProduct:((Bool) ->())?
    var addProducts:((UIButton) ->Void)?
    var reduceProducts:((UIButton) ->Void)?
        
    var model: ShoppingCartModel? {
        didSet {
            productImageView?.sd_setImage(with: URL(string: (model?.image)!), placeholderImage: UIImage.imageWithColor(UIColor.gray))
            productNameLabel?.text = model?.name
            productModelLabel?.text = model?.model
            productPriceLabel?.text = "¥ " + (model?.price)!
            if model?.isSelected == "1" {
                chooseButton?.isSelected = true
            }else {
                chooseButton?.isSelected = false
            }
            numberTextfield?.text = model?.number
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented!")
    }
    
    func setUpCell() {
        chooseButton = UIButton.init(type: .custom)
        chooseButton?.isExclusiveTouch = true
        chooseButton?.setImage(imageNamed("unSelected"), for: .normal)
        chooseButton?.setImage(imageNamed("selected"), for: .selected)
        chooseButton?.addTarget(self, action: #selector(chooseButtonClicked(_:)), for: .touchUpInside)
        self.contentView.addSubview(chooseButton!)
        chooseButton!.mas_updateConstraints { (make) in
            make?.left.top().bottom().mas_equalTo()(0)
            make?.width.mas_equalTo()(50)
        }
        
        productImageView = UIImageView()
        productImageView?.clipsToBounds = true
        productImageView?.contentMode = .scaleAspectFill
        self.contentView.addSubview(productImageView!)
        productImageView!.mas_updateConstraints { (make) in
            make?.left.equalTo()(chooseButton?.mas_right)
            make?.top.mas_equalTo()(10)
            make?.bottom.mas_equalTo()(-10)
            make?.width.equalTo()(productImageView?.mas_height)
        }
        
        productNameLabel = UILabel()
        productNameLabel?.numberOfLines = 2
        productNameLabel?.font = UIFont.systemFont(ofSize: 15)
        productNameLabel?.textColor = UIColor.black
        self.contentView.addSubview(productNameLabel!)
        productNameLabel!.mas_updateConstraints { (make) in
            make?.left.equalTo()(productImageView?.mas_right)?.offset()(10)
            make?.top.mas_equalTo()(10)
            make?.right.mas_equalTo()(-15)
        }
        
        productModelLabel = UILabel()
        productModelLabel?.font = UIFont.systemFont(ofSize: 12)
        productModelLabel?.textColor = UIColor.gray
        self.contentView.addSubview(productModelLabel!)
        productModelLabel!.mas_updateConstraints { (make) in
            make?.left.equalTo()(productImageView?.mas_right)?.offset()(10)
            make?.top.equalTo()(productNameLabel?.mas_bottom)?.offset()(8)
            make?.right.mas_equalTo()(-15)
        }
        
        productPriceLabel = UILabel()
        productPriceLabel?.font = UIFont.systemFont(ofSize: 12)
        productPriceLabel?.textColor = UIColor.red
        self.contentView.addSubview(productPriceLabel!)
        productPriceLabel!.mas_updateConstraints({ (make) in
            make?.left.equalTo()(productImageView?.mas_right)?.offset()(10)
            make?.top.equalTo()(productModelLabel?.mas_bottom)?.offset()(8)
            make?.right.mas_equalTo()(-15)
        })
        
        addButton = UIButton.init(type: .custom)
        addButton?.isExclusiveTouch = true
        addButton?.setImage(imageNamed("add"), for: .normal)
        addButton?.addTarget(self, action: #selector(addButtonClicked(_:)), for: .touchUpInside)
        self.contentView.addSubview(addButton!)
        addButton!.mas_updateConstraints { (make) in
            make?.right.mas_equalTo()(-20)
            make?.bottom.mas_equalTo()(-10)
            make?.width.mas_equalTo()(30)
            make?.height.mas_equalTo()(30)
        }
        
        numberTextfield = UITextField()
        numberTextfield?.isExclusiveTouch = true
        numberTextfield?.font = UIFont.systemFont(ofSize: 10)
        //不出现叉号
        numberTextfield?.clearButtonMode = .never
        numberTextfield?.textAlignment = .center
        numberTextfield?.keyboardType = .numberPad
        numberTextfield?.returnKeyType = .done
        self.contentView.addSubview(numberTextfield!)
        numberTextfield!.mas_updateConstraints { (make) in
            make?.right.equalTo()(addButton?.mas_left)
            make?.top.centerY().equalTo()(addButton)
            make?.width.mas_equalTo()(40)
        }
        
        reduceButton = UIButton.init(type: .custom)
        reduceButton?.isExclusiveTouch = true
        reduceButton?.setImage(imageNamed("reduce"), for: .normal)
        reduceButton?.addTarget(self, action: #selector(reduceButtonClicked(_:)), for: .touchUpInside)
        self.contentView.addSubview(reduceButton!)
        reduceButton!.mas_updateConstraints { (make) in
            make?.right.equalTo()(numberTextfield?.mas_left)
            make?.centerY.equalTo()(numberTextfield)
            make?.width.mas_equalTo()(30)
            make?.height.mas_equalTo()(30)
        }
    }
    
    @objc func chooseButtonClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        //通过闭包传值
        if chooseProduct != nil {
            chooseProduct!(sender.isSelected)
        }
    }
    
    @objc func addButtonClicked(_ sender: UIButton) {
        if addProducts != nil {
            addProducts!(sender)
        }
    }
    
    @objc func reduceButtonClicked(_ sender: UIButton) {
        if reduceProducts != nil {
            reduceProducts!(sender)
        }
    }
}
