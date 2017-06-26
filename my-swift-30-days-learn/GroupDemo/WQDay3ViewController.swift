//
//  WQDay3ViewController.swift
//  timer-test
//
//  Created by 刘文强 on 2017/6/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

import UIKit

@objc (WQDay3ViewController)
class WQDay3ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    var sourdata = Array<NSDate>()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        self.view.addSubview(tableview)
        tableview.addSubview(refresh)
        addnavItem()
    }

    
    
    lazy var tableview: UITableView = {
       var tableview = UITableView.init(frame: self.view.bounds)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.rowHeight = 50
        tableview.tableFooterView = UIView()
        tableview.backgroundColor = UIColor.white
        return tableview
    }()
    
    lazy var refresh: UIRefreshControl = {
        var refresh = UIRefreshControl()
        let dateform = DateFormatter()
        dateform.dateFormat = "yyyy:MM:dd HH:mm:ss"
        refresh.attributedTitle =  NSAttributedString.init(string: dateform.string(from: NSDate() as Date))
        refresh.addTarget(self, action: #selector(pullrefresh), for: .valueChanged)
        refresh.tintColor = UIColor.red
        refresh.backgroundColor = UIColor.gray
        
        return refresh
    }()
    
    func pullrefresh()  {
        sourdata.insert(NSDate(), at: 0)
        tableview.reloadData()
        refresh.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        let dateform = DateFormatter()
        dateform.dateFormat = "yyyy:MM:dd HH:mm:ss"
        let datestr = dateform.string(from: sourdata[indexPath.row] as Date)
        cell.textLabel?.text = datestr
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getcurrenDateStr() -> String {
        let dateform = DateFormatter()
        dateform.dateFormat = "yyyy:MM:dd HH:mm:ss"
        return dateform.string(from: NSDate() as Date)
    }
    
    func addnavItem()  {
        let rightItem = UIBarButtonItem.init(title: "清空", style: .plain, target: self, action: #selector(clearSourdata))
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    func clearSourdata() {
        sourdata.removeAll()
        tableview.reloadData()
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
