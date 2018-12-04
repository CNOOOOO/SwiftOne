//
//  BaseNavigationController.swift
//  SwiftOne
//
//  Created by Mac2 on 2018/7/20.
//  Copyright © 2018年 Mac2. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.tintColor = UIColor.black
        let titleTextAttributes  = [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        self.navigationBar.titleTextAttributes = titleTextAttributes
    }
    
    //获取当前控制器
    func getCurrentController() -> UIViewController {
        var window = UIApplication.shared.keyWindow
        if window?.windowLevel != UIWindowLevelNormal {
            let windows = UIApplication.shared.windows
            for tempWindow in windows {
                if tempWindow.windowLevel == UIWindowLevelNormal {
                    window = tempWindow
                    break
                }
            }
        }
        var result = window?.rootViewController
        if (result?.isKind(of: UITabBarController.self))! {
            result = (result as! UITabBarController).selectedViewController
        }else if (result?.isKind(of: UINavigationController.self))! {
            result = (result as! UINavigationController).visibleViewController
        }else if (result?.presentedViewController != nil) {
            result = result?.presentedViewController
        }
        return result!
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
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
