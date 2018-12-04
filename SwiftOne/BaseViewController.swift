//
//  BaseViewController.swift
//  SwiftOne
//
//  Created by Mac2 on 2018/7/20.
//  Copyright © 2018年 Mac2. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let backItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backToPreView))
        self.navigationItem.leftBarButtonItem = backItem
    }
    
    @objc func backToPreView() {
        self.navigationController?.popViewController(animated: true)
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
