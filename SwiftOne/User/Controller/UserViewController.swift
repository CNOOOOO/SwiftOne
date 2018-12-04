//
//  UserViewController.swift
//  SwiftOne
//
//  Created by Mac2 on 2018/7/20.
//  Copyright © 2018年 Mac2. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView?
    var navigationView: UIView?
    var settingButton: UIButton?
    var titleLabel: UILabel?
    var headerView: UIView?
    var headerImageView: UIImageView?
    var userHeader: UIImageView?
    var nickname: UILabel?
    var checkInfoButton: UIButton?
    var signInButton: UIButton?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setUpTableView()
        setUpNavigationBar()
        if #available(iOS 11.0, *) {
            tableView?.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
//    }
    
    func setUpTableView() {
        tableView = UITableView.init(frame: CGRect.zero, style: .grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.backgroundColor = UIColor.white
        tableView?.tableFooterView = UIView()
        tableView?.separatorStyle = .none
        tableView?.register(OrderTableViewCell.self, forCellReuseIdentifier: "orderCell")
        tableView?.register(FuctionsTableViewCell.self, forCellReuseIdentifier: "functionsCell")
        tableView?.register(DefaultTableViewCell.self, forCellReuseIdentifier: "defaultCell")
        //顶部视图
        headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 300))
        headerView?.backgroundColor = UIColor.white
        //顶部视图图片
        headerImageView = UIImageView.init(frame: (headerView?.bounds)!)
        headerImageView?.image = imageNamed("05")
        headerImageView?.contentMode = .scaleAspectFill
        headerImageView?.clipsToBounds = true
        //将图片底部设置成圆弧
        let headLayer = CAShapeLayer()
        let headPath = UIBezierPath.init(arcCenter: CGPoint(x: (headerImageView?.frame.size.width)! * 1.4, y: (headerImageView?.frame.size.width)! * 1.4), radius: (headerImageView?.frame.size.width)! * 1.4, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        headLayer.frame = CGRect(x: -(headerImageView?.frame.size.width)! * 1.8 / 2.0, y: -((headerImageView?.frame.size.width)! - (headerImageView?.frame.size.height)!) - (headerImageView?.frame.size.width)! * 1.8 , width: (headerImageView?.frame.size.width)! * 2.8, height: (headerImageView?.frame.size.width)! * 2.8)
        headLayer.path = headPath.cgPath
        headerView?.layer.mask = headLayer
        headerView?.addSubview(headerImageView!)
        //头像
        userHeader = UIImageView.init(frame: CGRect(x: (SCREEN_WIDTH * 0.5 - 40), y: 50, width: 80, height: 80))
        userHeader?.image = imageNamed("pic")
        //绘制带描边的圆形头像
        let subLayer = CAShapeLayer()
        subLayer.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        subLayer.cornerRadius = 40
        subLayer.borderColor = UIColor.white.cgColor
        subLayer.borderWidth = 3
        userHeader?.layer.addSublayer(subLayer)
        let path = UIBezierPath.init(arcCenter: CGPoint(x: 40, y: 40), radius: 40, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        userHeader?.layer.mask = layer
        headerView?.addSubview(userHeader!)
        //昵称
        nickname = UILabel()
        nickname?.text = "Moker_C"
        nickname?.textColor = UIColor.white
        nickname?.textAlignment = .center
        nickname?.font = UIFont.boldSystemFont(ofSize: 17)
        headerView?.addSubview(nickname!)
        nickname!.mas_updateConstraints { (make) in
            make?.centerX.mas_equalTo()(0)
            make?.top.equalTo()(userHeader?.mas_bottom)?.offset()(10)
            make?.height.mas_equalTo()(18)
        }
        //资料完善度查询按钮
        checkInfoButton = UIButton.init(type: .custom)
        checkInfoButton?.setImage(imageNamed("rightArrow"), for: .normal)
        checkInfoButton?.setTitle("资料完整度60%", for: .normal)
        checkInfoButton?.setTitleColor(UIColor.init(white: 1, alpha: 1.0), for: .normal)
        checkInfoButton?.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        let image:UIImage = imageNamed("rightArrow")!
        checkInfoButton?.titleEdgeInsets = UIEdgeInsetsMake(0, -image.size.width, 0, image.size.width)
        let rect = NSString(string: "资料完整度60%").boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: (checkInfoButton?.titleLabel?.bounds.size.height)!), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: checkInfoButton!.titleLabel!.font], context: nil)
        checkInfoButton?.imageEdgeInsets = UIEdgeInsetsMake(0, rect.size.width, 0, -rect.size.width)
        checkInfoButton?.addTarget(self, action: #selector(checkInfo), for: .touchUpInside)
        headerView?.addSubview(checkInfoButton!)
        checkInfoButton!.mas_updateConstraints { (make) in
            make?.centerX.mas_equalTo()(0)
            make?.top.equalTo()(nickname?.mas_bottom)?.offset()(10)
        }
        //签到按钮
        signInButton = UIButton.init(type: .custom)
        signInButton?.layer.masksToBounds = true
        signInButton?.layer.cornerRadius = 20
        signInButton?.backgroundColor = UIColor.white
        signInButton?.setTitle("签到+5积分", for: .normal)
        signInButton?.setTitleColor(UIColor.red, for: .normal)
        signInButton?.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        signInButton?.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        headerView?.addSubview(signInButton!)
        signInButton!.mas_updateConstraints { (make) in
            make?.centerX.mas_equalTo()(0)
            make?.top.equalTo()(checkInfoButton?.mas_bottom)?.offset()(20)
            make?.width.mas_equalTo()(120)
            make?.height.mas_equalTo()(40)
        }
        tableView?.tableHeaderView = headerView
        self.view.addSubview(tableView!)
        tableView!.mas_updateConstraints { (make) in
            make?.edges.mas_equalTo()(0)
        }
    }
    
    @objc func checkInfo() {
        let infoController = CheckInfoViewController()
        self.navigationController?.pushViewController(infoController, animated: true)
    }
    
    @objc func signIn() {
        print("sign in!")
    }
    
    func setUpNavigationBar() {
        let naviHeight = (self.navigationController?.navigationBar.frame.size.height)! + UIApplication.shared.statusBarFrame.size.height
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let naviBarHeight = self.navigationController?.navigationBar.frame.size.height
        navigationView = UIView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: naviHeight))
        navigationView?.backgroundColor = UIColor.init(white: 1, alpha: 0)
        settingButton = UIButton.init(type: .custom)
        settingButton?.frame = CGRect(x: SCREEN_WIDTH - 40, y: statusBarHeight, width: 40, height: naviBarHeight!)
        settingButton?.setImage(imageNamed("setWhite"), for: .normal)
        navigationView?.addSubview(settingButton!)
        
        titleLabel = UILabel.init(frame: CGRect(x:0, y: 0, width: SCREEN_WIDTH * 0.6, height: naviBarHeight!))
        titleLabel?.center = CGPoint(x: SCREEN_WIDTH * 0.5, y: statusBarHeight + (naviHeight - statusBarHeight) / 2.0)
        titleLabel?.text = "个人中心"
        titleLabel?.textColor = UIColor.clear
        titleLabel?.font = UIFont.systemFont(ofSize: 15)
        titleLabel?.textAlignment = .center
        navigationView?.addSubview(titleLabel!)
        
        self.view.addSubview(navigationView!)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1 {
            return 1
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell: OrderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderTableViewCell
            cell.ordersBlock = {
                (button) ->() in
                print("button \(String(describing: button.titleLabel?.text)) clicked")
            }
            return cell
        }else if indexPath.section == 1 {
            let cell: FuctionsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "functionsCell", for: indexPath) as! FuctionsTableViewCell
            cell.functionsBlock = {
                (button) ->() in
                print("button \(String(describing: button.titleLabel?.text)) clicked")
            }
            return cell
        }else {
            let cell: DefaultTableViewCell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! DefaultTableViewCell
            cell.titleLabel?.text = "浏览记录"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 160
        }else if indexPath.section == 1 {
            return 160.5
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.000000000001
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0000000000001
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = BGColor
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
         return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            print("item \(indexPath.row)")
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY <= 0 {
            let totalOffset = 300 - offsetY
            let scale = totalOffset / 300
            headerImageView?.frame = CGRect(x: -(SCREEN_WIDTH * scale - SCREEN_WIDTH) / 2.0, y: offsetY, width: SCREEN_WIDTH * scale, height: totalOffset)
            navigationView?.backgroundColor = UIColor.init(white: 1, alpha: 0)
            settingButton?.setImage(imageNamed("setWhite"), for: .normal)
            titleLabel?.textColor = UIColor.clear
        }else {
            let scale = offsetY / (300 - (navigationView?.bounds.size.height)!)
            navigationView?.backgroundColor = UIColor.init(white: 1, alpha: scale)
            titleLabel?.textColor = UIColor.init(white: 0, alpha: scale)
            if scale > 0.5 {
                settingButton?.setImage(imageNamed("setBlack"), for: .normal)
            }else {
               settingButton?.setImage(imageNamed("setWhite"), for: .normal)
            }
        }
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
