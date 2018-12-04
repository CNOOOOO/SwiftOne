//
//  MainTabbarController.swift
//  SwiftOne
//
//  Created by Mac2 on 2018/7/20.
//  Copyright © 2018年 Mac2. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false
        //方式一
//        let homeController = HomeViewController()
//        homeController.navigationItem.title = "首页"
//        let discoveryController = DiscoveryViewController()
//        discoveryController.navigationItem.title = "发现"
//        let shoppingController = ShoppingViewController()
//        shoppingController.navigationItem.title = "购物车"
//        let userController = UserViewController()
//        userController.navigationItem.title = "个人中心"
//        let controllers = [homeController, discoveryController, shoppingController, userController]
//        for controller in controllers {
//            let navi = BaseNavigationController(rootViewController: controller)
//            addChildViewController(navi)
//        }
//        let barItem01 = UITabBarItem(title: "首页", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
//        homeController.tabBarItem = barItem01
//        let barItem02 = UITabBarItem(title: "发现", image: UIImage(named: "discovery"), selectedImage: UIImage(named: "discovery"))
//        discoveryController.tabBarItem = barItem02
//        let barItem03 = UITabBarItem(title: "购物车", image: UIImage(named: "shopping"), selectedImage: UIImage(named: "shopping"))
//        shoppingController.tabBarItem = barItem03
//        let barItem04 = UITabBarItem(title: "个人中心", image: UIImage(named: "user"), selectedImage: UIImage(named: "user"))
//        userController.tabBarItem = barItem04
//        self.tabBar.tintColor = UIColor.red
//        self.selectedIndex = 1
        
        
        //方式二
        setUpTabbar()
        addChildViewController(HomeViewController(), title: "首页", normalImage: "home", selectedImage: "home")
        addChildViewController(DiscoveryViewController(), title: "发现", normalImage: "discovery", selectedImage: "discovery")
        addChildViewController(ShoppingViewController(), title: "购物车", normalImage: "shopping", selectedImage: "shopping")
        addChildViewController(UserViewController(), title: "个人中心", normalImage: "user", selectedImage: "user")
        self.selectedIndex = 1
    }
    
    //自定义tabbar样式
    fileprivate func setUpTabbar() {
        //tabbar顶部横线
        let rect = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 0.5)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor.clear.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.tabBar.shadowImage = image
        self.tabBar.backgroundImage = UIImage()
        //tabbar工具栏背景色
        self.tabBar.barTintColor = UIColor.white
        //设置tabbar工具栏字体颜色(选中和未选中)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.purple], for: .normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.gray], for: .selected)
        
        UITabBarItem.appearance().setTitleTextAttributes(NSDictionary(object: UIColor.gray, forKey: NSAttributedStringKey.foregroundColor as NSCopying) as? [NSAttributedStringKey : Any], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(NSDictionary(object: UIColor.purple, forKey: NSAttributedStringKey.foregroundColor as NSCopying) as? [NSAttributedStringKey : Any], for: .selected)
        
        //设置图片选中时的颜色
        self.tabBar.tintColor = UIColor.purple
    }
    
    //添加子控制器方法
    func addChildViewController(_ childController: UIViewController, title: String, normalImage: String, selectedImage: String) {
        childController.title = title
        childController.tabBarItem.image = UIImage(named: normalImage)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImage)
        let navi = BaseNavigationController()
        navi.addChildViewController(childController)
        addChildViewController(navi)
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
