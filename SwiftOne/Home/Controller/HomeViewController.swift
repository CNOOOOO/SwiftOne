//
//  HomeViewController.swift
//  SwiftOne
//
//  Created by Mac2 on 2018/7/20.
//  Copyright © 2018年 Mac2. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SDCycleScrollViewDelegate {
    var collectionView: UICollectionView?
    var hotHeaderView: UIView?
    var recommendHeaderView: UIView?
    var cycleScrollView: SDCycleScrollView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setUpCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cycleScrollView?.adjustWhenControllerViewWillAppera()
    }
    
    func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(HotSaleCollectionViewCell.self, forCellWithReuseIdentifier: "hot")
        collectionView?.register(RecommmendCollectionViewCell.self, forCellWithReuseIdentifier: "recommend")
        collectionView?.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerOne")
        collectionView?.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerTwo")
        collectionView?.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerThree")
        self.view.addSubview(collectionView!)
        collectionView!.mas_updateConstraints({ (make) in
            make!.edges.mas_equalTo()(0)
        })
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }else if section == 1 {
            return 6
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hot", for: indexPath)
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommend", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 15, 0, 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize.zero
        }else if indexPath.section == 1 {
            return CGSize(width: (SCREEN_WIDTH - 35) / 2.0, height: 100)
        }else {
            return CGSize(width: (SCREEN_WIDTH - 35) / 2.0, height: 280)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: SCREEN_WIDTH, height: 230)
        }else {
            return CGSize(width: SCREEN_WIDTH, height: 45)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var headerView = UICollectionReusableView()
        if kind == UICollectionElementKindSectionHeader {
            if indexPath.section == 0 {
                headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerOne", for: indexPath)
                //添加轮播图
                if cycleScrollView == nil {
//                    //本地图片
//                    let images = ["01","02","03"]
//                    cycleScrollView = SDCycleScrollView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 230), imageNamesGroup: images)
                    
                    //网络图片
                    let imageUrls = [
                        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532328399792&di=34e742e3892e060350f3ed52ef85ec01&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fwallpaper%2F1307%2F30%2Fc0%2F23934263_1375169304688.jpg",
                        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532328434935&di=edd9e2e2c7e0ae1da1a458c7e4806062&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fsoftbbs%2F1102%2F12%2Fc0%2F6730629_1297522714362_1024x1024soft.jpg",
                        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532328459563&di=4f31656211f53a434a269c407e6f7cca&imgtype=0&src=http%3A%2F%2Fimg3.iqilu.com%2Fdata%2Fattachment%2Fforum%2F201308%2F21%2F201707lflu7vc4ne7qrnlq.jpg"
                    ]
                    cycleScrollView = SDCycleScrollView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 230), delegate: self, placeholderImage: UIImage.imageWithColor(UIColor.white))
                    cycleScrollView?.delegate = self
                    cycleScrollView?.imageURLStringsGroup = imageUrls
                    cycleScrollView?.autoScrollTimeInterval = 4.0
                    headerView.addSubview(cycleScrollView!)
                }
            }else if indexPath.section == 1 {
                headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerTwo", for: indexPath)
                if hotHeaderView == nil {
                    hotHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 45))
                    hotHeaderView?.backgroundColor = UIColor.white
                    let hotLogo = UIImageView(image: UIImage(named: "hot"))
                    hotHeaderView?.addSubview(hotLogo)
                    hotLogo.mas_updateConstraints { (make) in
                        make?.center.mas_equalTo()(0)
                    }
                    let leftLine = UILabel()
                    leftLine.backgroundColor = UIColor.lightGray
                    hotHeaderView?.addSubview(leftLine)
                    leftLine.mas_updateConstraints { (make) in
                        make?.centerY.mas_equalTo()(0)
                        make?.right.equalTo()(hotLogo.mas_left)?.offset()(-5)
                        make?.width.mas_equalTo()(20)
                        make?.height.mas_equalTo()(0.5)
                    }
                    let rightLine = UILabel()
                    rightLine.backgroundColor = UIColor.lightGray
                    hotHeaderView?.addSubview(rightLine)
                    rightLine.mas_updateConstraints { (make) in
                        make?.centerY.mas_equalTo()(0)
                        make?.left.equalTo()(hotLogo.mas_right)?.offset()(5)
                        make?.width.mas_equalTo()(20)
                        make?.height.mas_equalTo()(0.5)
                    }
                    headerView.addSubview(hotHeaderView!)
                }
            }else {
                headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerThree", for: indexPath)
                if recommendHeaderView == nil {
                    recommendHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 45))
                    recommendHeaderView?.backgroundColor = UIColor.white
                    let recommendLogo = UIImageView(image: UIImage(named: "recommend"))
                    recommendHeaderView?.addSubview(recommendLogo)
                    recommendLogo.mas_updateConstraints { (make) in
                        make?.center.mas_equalTo()(0)
                    }
                    let leftLine = UILabel()
                    leftLine.backgroundColor = UIColor.lightGray
                    recommendHeaderView?.addSubview(leftLine)
                    leftLine.mas_updateConstraints { (make) in
                        make?.centerY.mas_equalTo()(0)
                        make?.right.equalTo()(recommendLogo.mas_left)?.offset()(-5)
                        make?.width.mas_equalTo()(20)
                        make?.height.mas_equalTo()(0.5)
                    }
                    let rightLine = UILabel()
                    rightLine.backgroundColor = UIColor.lightGray
                    recommendHeaderView?.addSubview(rightLine)
                    rightLine.mas_updateConstraints { (make) in
                        make?.centerY.mas_equalTo()(0)
                        make?.left.equalTo()(recommendLogo.mas_right)?.offset()(5)
                        make?.width.mas_equalTo()(20)
                        make?.height.mas_equalTo()(0.5)
                    }
                    headerView.addSubview(recommendHeaderView!)
                }
            }
        }
        return headerView
    }
    
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        print("点击了第\(index + 1)张图片")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
