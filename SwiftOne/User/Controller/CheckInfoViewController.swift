//
//  CheckInfoViewController.swift
//  SwiftOne
//
//  Created by Mac2 on 2018/8/6.
//  Copyright © 2018年 Mac2. All rights reserved.
//

import UIKit

class CheckInfoViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "个人信息"
        //imageView画圆角
        let imageView = UIImageView.init(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        imageView.center = self.view.center
        self.view.addSubview(imageView)
        let image = imageNamed("pic")
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, UIScreen.main.scale)
        UIBezierPath.init(roundedRect: imageView.bounds, cornerRadius: 10.0).addClip()
        image?.draw(in: imageView.bounds)
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //view画圆角
        let redView = UIView.init(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        var center = redView.center
        center.x = self.view.center.x
        redView.center = center
        redView.backgroundColor = UIColor.red
        let path = UIBezierPath.init(roundedRect: redView.bounds, cornerRadius: 10.0);
        path.addClip()
        let subLayer = CAShapeLayer()
        subLayer.lineWidth = 3
        subLayer.path = path.cgPath
        subLayer.fillColor = UIColor.clear.cgColor
        subLayer.strokeColor = UIColor.green.cgColor
        redView.layer.addSublayer(subLayer)
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        redView.layer.mask = layer
        self.view.addSubview(redView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func backToPreView() {
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
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
