//
//  PhotoContainer.swift
//  SwiftOne
//
//  Created by Mac2 on 2018/7/24.
//  Copyright © 2018年 Mac2. All rights reserved.
//

import UIKit

class PhotoContainer: UIView, SDPhotoBrowserDelegate {
    var browser: SDPhotoBrowser?
    lazy var imageViewArray = [Any]()
    var pictureUrls: [String]? {
        //属性观察
        didSet{
            _ = self.subviews.map({$0.removeFromSuperview()})
            if pictureUrls?.count == 0 {
                self.frame.size.height = 0
                return
            }
            let itemW = itemWidthForPictureUrls(pictureUrls!)
            var itemH: CGFloat = 0.0
            if pictureUrls?.count == 1 {
                //耗时操作，阻塞主线程
//                let url = URL(string: pictureUrls!.first!)
//                let data = NSData.init(contentsOf: url!)
//                let image = UIImage(data: data! as Data)
//                if ((image?.size.width) != nil) {
//                    itemH = (image?.size.height)! / (image?.size.width)! * itemW
//                }
                itemH = itemW
            }else {
                itemH = itemW
            }
            //每行item个数
            let perRowItemCount = perRowItemCountForPictureUrls(pictureUrls!)
            let margin:CGFloat = 5.0
            //行数
            let rowCount:Int = Int(ceilf(Float((pictureUrls?.count)!) / Float(perRowItemCount)))
            for (idx, obj) in (pictureUrls?.enumerated())! {
                let columnIndex = idx % perRowItemCount
                let rowIndex = idx / perRowItemCount
                //每次创建
//                let imageView = UIImageView()
//                imageView.clipsToBounds = true
//                imageView.contentMode = .scaleAspectFill
//                imageView.isUserInteractionEnabled = true
//                imageView.tag = idx
                //创建好隐藏、显示
                let imageView:UIImageView = imageViewArray[idx] as! UIImageView
                imageView.isHidden = false
                imageView.sd_setImage(with: URL(string: obj), placeholderImage: UIImage.imageWithColor(UIColor.gray))
                self.addSubview(imageView)
                
                let colnum = (idx + 1) % perRowItemCount
                let row = (idx + 1) / perRowItemCount
                var index: Int
                if row == 0 {
                    if colnum > 0 {
                        index = 1
                    }else {
                        index = 0
                    }
                }else {
                    if colnum > 0 {
                        index = row + 1
                    }else {
                        index = row
                    }
                }
                
                imageView.mas_updateConstraints { (make) in
                    make?.left.mas_equalTo()(CGFloat(columnIndex) * (itemW + margin))
                    make?.top.mas_equalTo()(CGFloat(rowIndex) * (itemH + margin))
                    make?.bottom.mas_equalTo()(CGFloat((index - rowCount)) * (itemH + margin))
                    make?.width.mas_equalTo()(itemW)
                    make?.height.mas_equalTo()(itemH)?.priorityHigh()()
                }
                let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapImageView(tap:)))
                imageView.addGestureRecognizer(tap)
            }
            let w:CGFloat = CGFloat(perRowItemCount) * itemW + CGFloat(perRowItemCount - 1) * margin
            let h:CGFloat = CGFloat(rowCount) * itemH + CGFloat(rowCount - 1) * margin
            self.frame.size.width = w
            self.frame.size.height = h
        }
    }
    
    //每个item的宽度
    func itemWidthForPictureUrls(_ urls: [String]) -> CGFloat {
        if urls.count == 1 {
            return 180
        }else {
            return (SCREEN_WIDTH - 90) / 3.0
        }
    }
    
    //每行item的个数
    func perRowItemCountForPictureUrls(_ urls:[String]) -> NSInteger {
        if urls.count < 3 {
            return urls.count
        }else if urls.count <= 4 {
            return 2
        }else {
            return 3
        }
    }
    
    @objc func tapImageView(tap: UITapGestureRecognizer) {
        let imageView = tap.view
        browser = SDPhotoBrowser.init()
        browser?.currentImageIndex = (imageView?.tag)!
        browser?.sourceImagesContainerView = self
        browser?.imageCount = (pictureUrls?.count)!
        browser?.delegate = self
        browser?.show()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        browser = nil
    }
    
    func photoBrowser(_ browser: SDPhotoBrowser!, highQualityImageURLFor index: Int) -> URL! {
        let url = URL(string: pictureUrls![index])
        return url
    }
    
    func photoBrowser(_ browser: SDPhotoBrowser!, placeholderImageFor index: Int) -> UIImage! {
        let imageView:UIImageView = self.subviews[index] as! UIImageView
        return imageView.image
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createImageViews()
    }
    
    func createImageViews() {
        for i in 0..<9 {
            let imageView = UIImageView()
            //避免多点触控
            imageView.isExclusiveTouch = true
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            imageView.isUserInteractionEnabled = true
            imageView.tag = i
            imageView.isHidden = true
            imageViewArray.append(imageView)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
