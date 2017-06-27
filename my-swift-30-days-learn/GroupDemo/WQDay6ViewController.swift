//
//  WQDay6ViewController.swift
//  my-swift-30-days-learn
//
//  Created by 刘文强 on 2017/6/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

import UIKit

@objc (WQDay6ViewController)
class WQDay6ViewController: WQTableViewRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tableview.tableHeaderView?.addSubview(scrollerview)
        
    }

    lazy var scrollerview: UIScrollView = {
        let scrollerview = UIScrollView.init(frame: CGRect(x:0,y:0,width:self.view.frame.width,height:300))
        scrollerview.bounces = true
        scrollerview.alwaysBounceVertical = true
        return scrollerview
    }()
    
    lazy var sourData: NSArray = {
        let sourData = NSArray()
        
        return sourData
    }()
    
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
