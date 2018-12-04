//
//  ViewController.swift
//  SwiftOne
//
//  Created by Mac2 on 2018/7/19.
//  Copyright © 2018年 Mac2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var backgroundImageView: UIImageView?
    var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "hello"
        self.view.backgroundColor = UIColor.white
        
        let rightItem = UIBarButtonItem.init(title: "Down", style: .plain, target: self, action: #selector(rightItemClick))
        self.navigationItem.rightBarButtonItem = rightItem

        self.addSubViews()
    }
    
    @objc func rightItemClick() {
        print("right item clicked")
    }
    
    func addSubViews() {
        let navi_height = (self.navigationController?.navigationBar.bounds.size.height)! + UIApplication.shared.statusBarFrame.size.height
        backgroundImageView = UIImageView(image: UIImage.init(named: "pic"))
        backgroundImageView?.frame = CGRect(x: 0, y: navi_height, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - navi_height)
        self.view.addSubview(backgroundImageView!)
        
        tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView!.delegate = self
        tableView!.dataSource = self
        tableView!.backgroundColor = UIColor.white
        tableView!.tableFooterView = UIView()
        tableView!.register(FirstTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView!)
        tableView!.mas_updateConstraints { (make) in
            make!.top.mas_equalTo()(navi_height)
            make!.left.right().bottom().mas_equalTo()(0)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FirstTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FirstTableViewCell
        cell.titleLabel?.text = String(format: "%ld", indexPath.row as CLong)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did select row: \(indexPath.row)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

