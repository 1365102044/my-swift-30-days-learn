//
//  ViewController.swift
//  timer-test
//
//  Created by 刘文强 on 2017/6/23.
//  Copyright © 2017年 inborn. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    //    var tabelview = UITableView()
    var data = Array<String>()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "30-Day-Learn"
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.view.addSubview(tableview)
        
    }
    
    lazy var tableview: UITableView = {
        var  tabelview = UITableView(frame: self.view.bounds)
        tabelview.delegate = self
        tabelview.dataSource = self
        tabelview.rowHeight = 50;
        return tabelview
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let curenrow = indexPath.row + 1;
        let didselctVCstr = "WQDay\(curenrow)ViewController"
//        self.navigationController?.pushViewController(VCSTRING_TO_VIEWCONTROLLER(didselctVCstr)!, animated: true)
        self.navigationController?.pushViewController(WQDay4ViewController(), animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        let tempstr = "第\(indexPath.row)天的练习"
        cell.textLabel?.text = tempstr
        cell.textLabel?.textColor = UIColor.green
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    /// 类文件字符串转换为ViewController
    ///
    /// - Parameter childControllerName: VC的字符串
    /// - Returns: ViewController
    func VCSTRING_TO_VIEWCONTROLLER(_ childControllerName: String) -> UIViewController?{
        
        // 1.获取命名空间
        // 通过字典的键来取值,如果键名不存在,那么取出来的值有可能就为没值.所以通过字典取出的值的类型为AnyObject?
        guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
            print("命名空间不存在")
            return nil
        }
        // 2.通过命名空间和类名转换成类
        var cls : AnyClass? = NSClassFromString(childControllerName)
        
        // swift 中通过Class创建一个对象,必须告诉系统Class的类型
        guard let clsType = cls as? UIViewController.Type else {
            print("无法转换成UIViewController")
            
            cls = NSClassFromString("WQDay1ViewController")
            let clstype = cls as? UIViewController.Type
            let childController = clstype?.init()
            return childController
        }
        // 3.通过Class创建对象
        let childController = clsType.init()
        
        return childController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

