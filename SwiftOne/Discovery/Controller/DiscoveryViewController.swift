//
//  DiscoveryViewController.swift
//  SwiftOne
//
//  Created by Mac2 on 2018/7/20.
//  Copyright © 2018年 Mac2. All rights reserved.
//

import UIKit

class DiscoveryViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView?
    var modelArray: [DynamicsModel]?
    lazy var needLoadArray: NSArray = [Any]() as NSArray

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        modelArray = []
        setUpTableView()
    }
    
    func setUpTableView() {
        tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView()
        tableView?.backgroundColor = UIColor.white
        //自适应高度
//        tableView?.estimatedRowHeight = 150
//        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.register(DynamicsTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView!)
        tableView!.mas_updateConstraints({ (make) in
            make?.edges.mas_equalTo()(0)
        })
        
        tableView?.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            [unowned self] in
            self.createModelsWithCount(count: 20, isRefresh: true)
        })
        tableView?.mj_footer = MJRefreshBackNormalFooter.init(refreshingBlock: {
            [unowned self] in
            self.createModelsWithCount(count: 20, isRefresh: false)
        })
        tableView?.mj_header.beginRefreshing()
    }
    
    func createModelsWithCount(count: NSInteger, isRefresh: Bool) {
        if isRefresh == true {
            modelArray?.removeAll()
        }
        let headers = ["01","02","03","04","05","06"]
        let names = ["Jack","Paul","Jimmy","Kobe","Smith","Tyler"]
        let contents = [
                        "和服务和覅我和担惊受😁😁恐还哦啊或发哦分红和发挥税收法律是吉林省吉林市福建省会计数据费是否快速开发商发货客服核实回访客户开始上课发货快速",
                        "合法化佛文化佛🙄🙄文化念佛文化后方和我就能到后来是你我后发货我发到今年进口的佛文化佛后返回武汉酒店活动后无回复我hi服务号佛法我我",
                        "哈佛文化佛违法和我哈佛违法户外和我分开开电脑开发店铺服务呢物品护肤品我发文件费IP房价肯定会念佛我怕耽误护肤品违法和我姐夫IE积分IE合肥",
                        "和覅偶文化🐷🐷氛围分红我违法的看得见覅额非吼吼吼hi符合我方宏伟厚厚的回电话好的好的就很烦我和我",
                        "后维护服务费颇为简单快捷的空间发挥为偶发货物多哄哄我等会哦哦我😂🤣房价我彷佛我我哈佛文化佛文化风景的护肤违法",
                        "毫无🌶🌶防护网我和哈佛我我哈佛额ifhi违法hi文物和覅偶诶嘿我发hi我凤凰网"
        ]
        let times = ["一分钟前","刚刚","两天前","一小时前","一周前","一个月前"]
        
        let images = [
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532328399792&di=34e742e3892e060350f3ed52ef85ec01&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fwallpaper%2F1307%2F30%2Fc0%2F23934263_1375169304688.jpg",
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532328434935&di=edd9e2e2c7e0ae1da1a458c7e4806062&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fsoftbbs%2F1102%2F12%2Fc0%2F6730629_1297522714362_1024x1024soft.jpg",
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532328459563&di=4f31656211f53a434a269c407e6f7cca&imgtype=0&src=http%3A%2F%2Fimg3.iqilu.com%2Fdata%2Fattachment%2Fforum%2F201308%2F21%2F201707lflu7vc4ne7qrnlq.jpg",
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532522986864&di=c17498f7bfa3c46b44f2a3ac4b616d12&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2Fb999a9014c086e063043f8df02087bf40bd1cbbf.jpg",
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532523017054&di=b61e7d06654fc14dc5d72f4be04b5adc&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201407%2F09%2F20140709231354_yzXVi.jpeg",
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532523036303&di=800fdb253b9f6bfa9b252cc30ad755fc&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fwallpaper%2F1304%2F22%2Fc0%2F20119775_1366614602193.jpg",
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532523056381&di=f24ba90d76645915e1ed950ba2e81a72&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201202%2F20%2F20120220172006_mBymU.jpg",
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1533117803&di=ef6f79c6065243b25f84f64be383c61b&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fwallpaper%2F1308%2F15%2Fc5%2F24496292_1376533594775.jpg",
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532523111990&di=125c1c8d612b8927d43227651fefc2eb&imgtype=0&src=http%3A%2F%2Fa4.topitme.com%2Fo%2F201010%2F13%2F12869614041591.jpg"]
        //随机数据
        for _ in 0..<count {
            let headerRandomIndex = Int(arc4random_uniform(6))
            let nameRandomIndex = Int(arc4random_uniform(6))
            let contentRandomIndex = Int(arc4random_uniform(6))
            let timeRandomIndex = Int(arc4random_uniform(6))
            let model = DynamicsModel.init()
            model.headImage = headers[headerRandomIndex]
            model.nickname = names[nameRandomIndex]
            model.content = contents[contentRandomIndex]
            let rect = NSString(string: contents[contentRandomIndex]).boundingRect(with: CGSize(width: SCREEN_WIDTH - 80, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)], context: nil)
            model.time = times[timeRandomIndex]
            
            let random = Int(arc4random_uniform(10))
            var tempImageArray: [String] = []
            for _ in 0..<random {
                let index = Int(arc4random_uniform(9))
                tempImageArray.append(images[index])
            }
            if tempImageArray.isEmpty == false {
                model.images = tempImageArray
                //根据数据将高度计算出来，降低heightForRow高度的计算压力
                if tempImageArray.count == 1 {
                    model.cellHeight = CGFloat(43.0 + rect.size.height + 10.0 + 180.0 + 10.0 + 30.0 + 1)
                }else if tempImageArray.count < 5 {
                    let rowCount = ceil(Double(tempImageArray.count) / 2.0)
                    let height = (SCREEN_WIDTH - 90.0) / 3.0 * CGFloat(rowCount)
                    let height1 = height + CGFloat(5.0 * (rowCount - 1))
                    model.cellHeight = CGFloat(43.0 + rect.size.height + 10.0 + height1 + 10.0 + 30.0 + 1)
                }else {
                    let rowCount = ceil(Double(tempImageArray.count) / 3.0)
                    let height = (SCREEN_WIDTH - 90.0) / 3.0 * CGFloat(rowCount)
                    let height1 = height + CGFloat(5.0 * (rowCount - 1))
                    model.cellHeight = CGFloat(43.0 + rect.size.height + 10.0 + height1 + 10.0 + 30.0 + 1)
                }
            }else {
                model.cellHeight = CGFloat(43.0 + rect.size.height + 10.0 + 30.0 + 1)
            }
            modelArray?.append(model)
        }
        tableView?.mj_header.endRefreshing()
        tableView?.mj_footer.endRefreshing()
        tableView?.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (modelArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:DynamicsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DynamicsTableViewCell
        let model = modelArray![indexPath.row]
        cell.model = model
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model: DynamicsModel = modelArray![indexPath.row]
        return model.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
