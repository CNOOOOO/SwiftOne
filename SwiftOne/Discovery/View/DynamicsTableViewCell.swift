//
//  DynamicsTableViewCell.swift
//  SwiftOne
//
//  Created by Mac2 on 2018/7/25.
//  Copyright © 2018年 Mac2. All rights reserved.
//

import UIKit

class DynamicsTableViewCell: UITableViewCell {
    var headerImage: UIImageView?
    var nickname: UILabel?
    var content: UILabel?
    var photoContainer: PhotoContainer?
    var time: UILabel?
    var model: DynamicsModel? {
        didSet {
//            headerImage?.sd_setImage(with: URL(string: (model?.headImage)!), placeholderImage: UIImage.imageWithColor(UIColor.white))
            headerImage?.image = imageNamed((model?.headImage)!)
            nickname?.text = model?.nickname
            content?.text = model?.content
            photoContainer?.pictureUrls = model?.images
            if model?.images.count != 0 {
                photoContainer!.mas_remakeConstraints { (make) in
                    make?.left.equalTo()(content)
                    make?.right.mas_equalTo()(-15)
                    make?.top.equalTo()(content?.mas_bottom)?.offset()(10)?.priorityHigh()()
                }
            }else {
                photoContainer!.mas_remakeConstraints { (make) in
                    make?.left.equalTo()(content)
                    make?.right.mas_equalTo()(-15)
                    make?.top.equalTo()(content?.mas_bottom)?.priorityHigh()()
                }
            }
            time?.text = model?.time
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
    }
    
    func setUpCell() {
        self.selectionStyle = .none
        headerImage = UIImageView()
        headerImage?.clipsToBounds = true
        headerImage?.contentMode = .scaleAspectFill
        let layer = CAShapeLayer.init()
        let path = UIBezierPath.init(arcCenter: CGPoint(x: 20, y: 20), radius: 20, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        layer.path = path.cgPath;
        headerImage?.layer.mask = layer;
        self.contentView.addSubview(headerImage!)
        headerImage!.mas_updateConstraints({ (make) in
            make?.left.mas_equalTo()(15)
            make?.top.mas_equalTo()(15)
            make?.height.mas_equalTo()(40)
            make?.width.mas_equalTo()(40)
        })
        
        nickname = UILabel()
        nickname?.font = UIFont.systemFont(ofSize: 12)
        nickname?.textColor = UIColor.black
        self.contentView.addSubview(nickname!)
        nickname!.mas_updateConstraints { (make) in
            make?.left.equalTo()(headerImage?.mas_right)?.offset()(10)
            make?.top.equalTo()(headerImage)
            make?.height.mas_equalTo()(18)
            make?.right.mas_equalTo()(-15)
        }
        
        content = UILabel()
        content?.font = UIFont.systemFont(ofSize: 15)
        content?.textColor = UIColor.black
        content?.numberOfLines = 0
        self.contentView.addSubview(content!)
        content!.mas_updateConstraints { (make) in
            make?.left.equalTo()(nickname)
            make?.top.equalTo()(nickname?.mas_bottom)?.offset()(10)
            make?.right.mas_equalTo()(-15)
        }
        
        photoContainer = PhotoContainer()
        self.contentView.addSubview(photoContainer!)
//        photoContainer!.mas_updateConstraints { (make) in
//            make?.left.equalTo()(content)
//        }
        
        time = UILabel()
        time?.font = UIFont.systemFont(ofSize: 12)
        time?.textColor = UIColor.lightGray
        self.contentView.addSubview(time!)
        time!.mas_updateConstraints { (make) in
            make?.left.equalTo()(content)
            make?.height.mas_equalTo()(15)
            make?.top.equalTo()(photoContainer?.mas_bottom)?.offset()(10)
            make?.bottom.mas_equalTo()(-15)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
