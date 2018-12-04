//
//  ShoppingViewController.swift
//  SwiftOne
//
//  Created by Mac2 on 2018/7/20.
//  Copyright © 2018年 Mac2. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
    var collectionView: UICollectionView?
    var guessYouLikeView: UIView?
    var balanceVeiw: BalanceView?
    var totalPrice = 0.0
    lazy var shoppingCartProducts = [Any]()
    lazy var numbers = [Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        numbers = ["5","2","4","1","1","1","1","2","1","10"]
        createModels()
        setUpCollectionView()
        addBalanceView()
    }
    
    func createModels() {
        shoppingCartProducts.removeAll()
        balanceVeiw?.chooseAllButton?.isSelected = false
        totalPrice = 0.00
        self.totalPrice(price: String(format: "%.2lf", self.totalPrice))
        self.balanceVeiw?.balanceButton?.backgroundColor = UIColor.lightGray
        self.balanceVeiw?.balanceButton?.isUserInteractionEnabled = false
        let images = [
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532929496373&di=dfaaa6da7bd035d74c79568889232a9a&imgtype=0&src=http%3A%2F%2Fpic1.secoo.com%2Fpush%2F13%2F8%2F5b9ba9aee0ec43ada623bdfca3c78841.JPG",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532929554069&di=b1d5d4857bf74c4d94d00331b17322d7&imgtype=0&src=http%3A%2F%2Fimg.popo.cn%2Fuploadfile%2F2017%2F0531%2F1496227719665483.png",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1533524306&di=a2ef736e34ce9b2594df5e9888d96640&imgtype=jpg&er=1&src=http%3A%2F%2Fa.vpimg3.com%2Fupload%2Fmerchandise%2F179709%2FPUFFYPUPPY-PGXZ01P5556-2.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532929659190&di=464da0ebac2b119d9ba51f73472af627&imgtype=0&src=http%3A%2F%2Fp2.ifengimg.com%2Fa%2F2017_47%2Fb8bca1ea1094d68_size338_w584_h426.png",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532929698516&di=e29fb3bf982c4a7f504c689f90172d0a&imgtype=0&src=http%3A%2F%2Fshihuo.hupucdn.com%2Ftrade%2Fgoods%2Fstyle%2F201709%2F1310%2F16e4094fa1d8a1cd182ae17ad5beb507.png",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532929780220&di=f6f1103ff4103c141853dbe3b0459598&imgtype=0&src=http%3A%2F%2Fimage.it168.com%2Fn%2F640x480%2F5%2F5978%2F5978810.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532929860294&di=02d29ada7afa078e262838ef8c3be115&imgtype=0&src=http%3A%2F%2Fimage5.buy.ccb.com%2Fmerchant%2F201712%2F1079778850%2F1522566070194_4.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532929903303&di=528bc1a5a50c803c534aedf02321484a&imgtype=0&src=http%3A%2F%2Fec4.images-amazon.com%2Fimages%2FI%2F81Y8QJDkN8L._SL1500_.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1533524668&di=1a895074ea596278801dde425f6dd85e&imgtype=jpg&er=1&src=http%3A%2F%2Fi2.sinaimg.cn%2Fty%2Fk%2Fp%2F2010-10-27%2FU5360P6T12D5273440F168DT20101027174156.jpg",
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1532929979321&di=aa359a182d0cf3cf9b89712ec1d6df40&imgtype=0&src=http%3A%2F%2Fimg2.99114.com%2Fgroup1%2FM00%2F07%2FA6%2FwKgGMFkUvpOABRy9AAiZfGNPbR8437.jpg"
        ]
        let names = ["夏季纯棉T恤 2018新款 不褪色不变形 火热促销中","韩版新款白色T恤衫，买一送一，加入购物车参与抢购将送精美礼品","精品男士夏装爆款以售卖3万件，限时促销，先到先得","京东618狂欢节，iPhone X惊降500，值得入手","京东自营618爆款，数量有限抢完为止，部分地区暂时无货","Mac Pro 2018新款 core i7 512G固态硬盘，银灰色","iPad 4 黑色 128G 一年保修 7天包退 一流售后 安心服务","NBA官方指定用球，斯伯丁Y-670，7号篮球，耐磨，室内室外用球","科比3代紫金战靴，限时促销，直降300，球场王者的标配","库里新款球衣火热预售中，预售价只要230，支持你心中的萌神，感受三分信条"]
        let models = ["黑色，XL","白色，M","藏青 XXL","iphoneX 256 银色","iphone8 plus 金色 256","Mac Pro i7 512G","iPad 4 128G 黑色","斯伯丁 7号比赛专用球","科比三代球鞋 42","库里球衣 XL"]
        let prices = ["190","160","200","9899","7100","21000","4200","900","1300","230"]
        for item in 0...9 {
            let model = ShoppingCartModel()
            model.image = images[item]
            model.name = names[item]
            model.model = models[item]
            model.price = prices[item]
            model.number = numbers[item] as? String
            model.isSelected = "0"
            shoppingCartProducts.append(model)
        }
        collectionView?.mj_header.endRefreshing()
        collectionView?.reloadData()
    }
    
    func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout.init()
        collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(ShoppingCartCollectionViewCell.self, forCellWithReuseIdentifier: "item")
        collectionView?.register(RecommmendCollectionViewCell.self, forCellWithReuseIdentifier: "recommend")
        collectionView?.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        self.view.addSubview(collectionView!)
        collectionView!.mas_updateConstraints { (make) in
            make?.top.left().right().mas_equalTo()(0)
            make?.bottom.mas_equalTo()(-45)
        }
        collectionView?.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            [unowned self] in
            self.createModels()
        })
    }
    
    func addBalanceView() {
        balanceVeiw = BalanceView()
        self.view.addSubview(balanceVeiw!)
        balanceVeiw!.mas_updateConstraints { (make) in
            make?.left.bottom().right().mas_equalTo()(0)
            make?.height.mas_equalTo()(45)
        }
        balanceVeiw?.chooseAllProducts = {
            (isChooseAll) ->() in
            if self.shoppingCartProducts.count > 0 {
                self.totalPrice = 0.0
                if isChooseAll == true {
                    for i in 0..<self.shoppingCartProducts.count {
                        let model: ShoppingCartModel = self.shoppingCartProducts[i] as! ShoppingCartModel
                        model.isSelected = "1"
                        self.totalPrice += Double(model.price!)! * Double(model.number!)!
                    }
                    self.balanceVeiw?.balanceButton?.backgroundColor = UIColor.red
                    self.balanceVeiw?.balanceButton?.isUserInteractionEnabled = true
                    self.collectionView?.reloadData()
                }else {
                    for i in 0..<self.shoppingCartProducts.count {
                        let model: ShoppingCartModel = self.shoppingCartProducts[i] as! ShoppingCartModel
                        model.isSelected = "0"
                    }
                    self.balanceVeiw?.balanceButton?.backgroundColor = UIColor.lightGray
                    self.balanceVeiw?.balanceButton?.isUserInteractionEnabled = false
                    self.collectionView?.reloadData()
                }
                self.totalPrice(price: String(format: "%.2lf", self.totalPrice))
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return shoppingCartProducts.count
        }else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell: ShoppingCartCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! ShoppingCartCollectionViewCell
            //给数量编辑框添加tag值，便于区分改动的是哪一个的值
            cell.numberTextfield?.tag = indexPath.item
            cell.numberTextfield?.delegate = self
            NotificationCenter.default.addObserver(self, selector: #selector(textfieldTextDidChanged(obj:)), name: .UITextFieldTextDidChange, object: cell.numberTextfield)
            //选择按钮
            cell.chooseProduct = {
                (isChoose) ->() in
                var ifSelectedAll = true
                if isChoose == true {
                    let chooseModel: ShoppingCartModel = self.shoppingCartProducts[indexPath.item] as! ShoppingCartModel
                    chooseModel.isSelected = "1"
                    self.shoppingCartProducts.remove(at: indexPath.item)
                    self.shoppingCartProducts.insert(chooseModel, at: indexPath.item)
                    self.totalPrice += Double(chooseModel.price!)! * Double(chooseModel.number!)!
                    for i in 0..<self.shoppingCartProducts.count {
                        let model: ShoppingCartModel = self.shoppingCartProducts[i] as! ShoppingCartModel
                        if model.isSelected == "0" {
                            ifSelectedAll = false
                        }
                    }
                    self.balanceVeiw?.balanceButton?.backgroundColor = UIColor.red
                    self.balanceVeiw?.balanceButton?.isUserInteractionEnabled = true
                }else {
                    ifSelectedAll = false
                    let model: ShoppingCartModel = self.shoppingCartProducts[indexPath.item] as! ShoppingCartModel
                    model.isSelected = "0"
                    self.shoppingCartProducts.remove(at: indexPath.item)
                    self.shoppingCartProducts.insert(model, at: indexPath.item)
                    self.totalPrice -= Double(model.price!)! * Double(model.number!)!
                    if self.totalPrice == 0.00 {
                        self.balanceVeiw?.balanceButton?.backgroundColor = UIColor.lightGray
                        self.balanceVeiw?.balanceButton?.isUserInteractionEnabled = false
                    }
                }
                if ifSelectedAll == true {
                    self.balanceVeiw?.chooseAllButton?.isSelected = true
                }else {
                    self.balanceVeiw?.chooseAllButton?.isSelected = false
                }
                self.totalPrice(price: String(format: "%.2lf", self.totalPrice))
            }
            //加按钮
            cell.addProducts = {
                (addButton) ->() in
                let model: ShoppingCartModel = self.shoppingCartProducts[indexPath.item] as! ShoppingCartModel
                cell.reduceButton?.isEnabled = true
                cell.reduceButton?.alpha = 1.0
                let number = Int((cell.numberTextfield?.text)!)
                if number! < 99 {
                    cell.numberTextfield?.text = String(format: "%d", number! + 1)
                    model.number = String(format: "%d", number! + 1)
                    self.numbers.remove(at: indexPath.item)
                    self.numbers.insert(String(format: "%d", number! + 1), at: indexPath.item)
                    if model.isSelected == "1" {
                        self.totalPrice += Double(model.price!)!
                        self.totalPrice(price: String(format: "%.2lf", self.totalPrice))
                    }
                }
            }
            //减按钮
            cell.reduceProducts = {
                (reduceButton) ->() in
                let model: ShoppingCartModel = self.shoppingCartProducts[indexPath.item] as! ShoppingCartModel
                cell.addButton?.isEnabled = true
                cell.addButton?.alpha = 1.0
                let number = Int((cell.numberTextfield?.text)!)
                if number! > 1 {
                    cell.numberTextfield?.text = String(format: "%d", number! - 1)
                    model.number = String(format: "%d", number! - 1)
                    self.numbers.remove(at: indexPath.item)
                    self.numbers.insert(String(format: "%d", number! - 1), at: indexPath.item)
                    if model.isSelected == "1" {
                        self.totalPrice -= Double(model.price!)!
                        self.totalPrice(price: String(format: "%.2lf", self.totalPrice))
                    }
                }
            }
            cell.model = shoppingCartProducts[indexPath.item] as? ShoppingCartModel
            return cell
        }else {
            let cell: RecommmendCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommend", for: indexPath) as! RecommmendCollectionViewCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var headerView = UICollectionReusableView()
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header", for: indexPath)
        if kind == UICollectionElementKindSectionHeader {
            if indexPath.section == 1 {
                if guessYouLikeView == nil {
                    guessYouLikeView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 45))
                    guessYouLikeView?.backgroundColor = UIColor.white
                    headerView.addSubview(guessYouLikeView!)
                    let headerButton = UIButton.init(type: .custom)
                    headerButton.isUserInteractionEnabled = false
                    headerButton.setImage(imageNamed("like"), for: .normal)
                    headerButton.setTitle("猜你喜欢", for: .normal)
                    headerButton.setTitleColor(UIColor.black, for: .normal)
                    headerButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
                    headerButton.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, -3)
                    headerButton.imageEdgeInsets = UIEdgeInsetsMake(0, -3, 0, 3)
                    guessYouLikeView?.addSubview(headerButton)
                    headerButton.mas_updateConstraints({ (make) in
                        make?.center.mas_equalTo()(0)
                    })
                }
            }
        }
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return CGSize(width: SCREEN_WIDTH, height: 45)
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets.zero
        }
        return UIEdgeInsetsMake(0, 15, 0, 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: SCREEN_WIDTH, height: 100)
        }
        return CGSize(width: (SCREEN_WIDTH - 35) / 2.0, height: 280)
    }
    
    func totalPrice(price: String) {
        //第一部分
        let multipleAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)]
        let attributeString = NSMutableAttributedString(string: "总计：", attributes: multipleAttributes)//有属性变化的情况下，用可变属性字符串
        //第二部分
        let newMultipleAttributes = [NSAttributedStringKey.foregroundColor: UIColor.red, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        let newAttributeString = NSAttributedString(string: "¥ " + price, attributes: newMultipleAttributes)
        attributeString.append(newAttributeString)
        balanceVeiw?.totalPrice?.attributedText = attributeString
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return validateNumberByRegExp(string: string)
    }
    
    func validateNumberByRegExp(string: String) -> Bool {
        var isValid = true
        let length = string.count
        if length > 0 {
            let numberRegexp = "^[0-9]*$"
            let numberPredicate = NSPredicate.init(format: "SELF MATCHES %@", numberRegexp)
            isValid = numberPredicate.evaluate(with: string)
        }
        return isValid
    }
    
    @objc func textfieldTextDidChanged(obj: NSNotification) {
        let textField: UITextField = obj.object as! UITextField
        if textField.text?.count == 0 {
            return
        }
        let model: ShoppingCartModel = self.shoppingCartProducts[textField.tag] as! ShoppingCartModel
        if Double(textField.text!)! <= 0.0 {
            textField.text = "1"
        }else if Double(textField.text!)! > 99.0 {
            textField.text = "99"
        }
        if model.isSelected == "1" {
            self.totalPrice += Double(model.price!)! * (Double(textField.text!)! - Double(model.number!)!)
            self.totalPrice(price: String(format: "%.2lf", self.totalPrice))
        }
        model.number = textField.text!
        self.numbers.remove(at: textField.tag)
        self.numbers.insert(textField.text!, at: textField.tag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(noti:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(noit:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyBoardWillShow(noti: NSNotification) {
        let info: NSDictionary = noti.userInfo! as NSDictionary
        let value: NSValue = info.object(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let rect = value.cgRectValue
        collectionView?.contentInset = UIEdgeInsetsMake((collectionView?.contentInset.top)!, 0, rect.size.height, 0)
    }
    
    @objc func keyBoardWillHide(noit: NSNotification) {
        collectionView?.contentInset = UIEdgeInsetsMake((collectionView?.contentInset.top)!, 0, 0, 0)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        collectionView?.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
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
