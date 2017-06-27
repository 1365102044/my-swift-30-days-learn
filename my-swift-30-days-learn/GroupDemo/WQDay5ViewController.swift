//
//  WQDay5ViewController.swift
//  my-swift-30-days-learn
//
//  Created by 刘文强 on 2017/6/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

import UIKit
@objc (WQDay5ViewController)
class WQDay5ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var imageview = UIImageView()
    var sourData = Array<String>()
    var tem: Float = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "tableview编辑"
        let temp = "werqew,qwer124,qr1234,fqsadfas,r14fds,rwq1234tewr,64356y,653656fgd,r14fds,rwq1234tewr,64356y,653656fgdqwerafasdf,fdgwefgcxbvxc,sdfa"
        sourData = temp.components(separatedBy: ",")
        
        self.view.addSubview(tableview)
        tableview.tableHeaderView = headerview
        tableview.reloadData()
        
        imageview = UIImageView.init(frame: headerview.bounds)
        imageview.image = UIImage.init(named: "100.jpg")
        imageview.contentMode = .scaleAspectFit
        headerview.addSubview(imageview)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offerY = scrollView.contentOffset.y
        let scale =  -offerY/50
        headerview.zoomScale = scale
        
        
    }
    
    
    lazy var headerview: UIScrollView = {
        var headerview = UIScrollView(frame:CGRect(x:0,y:0,width:self.view.bounds.size.width,height:200))
        headerview.backgroundColor = UIColor.brown
        headerview.maximumZoomScale = 10
        headerview.minimumZoomScale = 1
        headerview.contentSize = self.imageview.bounds.size
        return headerview
    }()

    
    lazy var tableview: UITableView = {
        var tableview = UITableView(frame:self.view.bounds)
        tableview.delegate = self
        tableview.dataSource = self
        return tableview
    }()

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleaction = UITableViewRowAction.init(style: .normal, title: "删除") { (UITableViewRowAction, IndexPath) in
        
            self.addlearview(msg: "删除")
            self.sourData.remove(at: indexPath.row)
//            self.tableview.reloadRows(at: [indexPath], with: UITableViewRowAnimation.top)
            self.tableview.reloadData()
        }
        
        let likeaction = UITableViewRowAction.init(style: .normal, title: "😍") { (UITableViewRowAction, IndexPath) in
            
            self.addlearview(msg: "喜欢")
        }
        
        return [deleaction,likeaction]
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = sourData[indexPath.row]
        return cell
    }
    
    func addlearview(msg: String) {
    
        let alearview:UIAlertController = UIAlertController.init(title: "", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        let aler =  UIAlertAction.init(title: "确定", style: UIAlertActionStyle.default) { (UIAlertAction) in
            alearview.dismiss(animated: true, completion: nil)
        }
        
        alearview.addAction(aler)
        self.present(alearview, animated: true) {

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
