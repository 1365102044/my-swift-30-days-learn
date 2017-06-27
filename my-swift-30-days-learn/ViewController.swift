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
    
    var timer = Timer()
    var data = Array<String>()
    var numberTimer:Double = 0.0
    var alearView = UIAlertView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "30-Day-Learn"
        self.view.addSubview(tableview)
        
        
    }
    
    func addTimer()  {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(starTimer), userInfo: nil, repeats: true)
        timer.fire()
    }
    func starTimer() {
        numberTimer = numberTimer + 0.1
        alearView.title = ("温馨提示(\(numberTimer))")
        if numberTimer > 2.0 {
            timer.invalidate()
            numberTimer = 0.0
            alearView.dismiss(withClickedButtonIndex: 0, animated: true)
        }
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
        self.navigationController?.pushViewController(VCSTRING_TO_VIEWCONTROLLER(didselctVCstr)!, animated: true)
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

    
    func VCSTRING_TO_VIEWCONTROLLER(_ childControllerName: String) -> UIViewController?{
        
        
        var cls : AnyClass? = NSClassFromString(childControllerName)
        
        // swift 中通过Class创建一个对象,必须告诉系统Class的类型
        guard let clsType = cls as? UIViewController.Type else {
            
            
            addlearVeiw(mesg: childControllerName)
            
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
    
    func addlearVeiw(mesg:String)  {
        
        addTimer()
        
        alearView = UIAlertView.init(title: "温馨提示(0.0)", message: mesg, delegate: self, cancelButtonTitle: "知道了")
        alearView.show()
    }
}

