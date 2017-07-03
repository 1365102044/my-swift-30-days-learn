//
//  WQDay6ViewController.swift
//  my-swift-30-days-learn
//
//  Created by 刘文强 on 2017/6/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

import UIKit
import SnapKit

@objc (WQDay6ViewController)
class WQDay6ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ScrollView"
        self.view.backgroundColor = UIColor.white
        
       
        self.view.addSubview(scrollerview)
        for  index in 0..<sourData.count {
            
            let image = UIImage.init(named: sourData[index] as! String)
            let imageview = UIImageView.init(image: image)
            imageview.backgroundColor = UIColor.gray
            scrollerview.addSubview(imageview)
            let W = self.view.frame.size.width
            imageview.snp.makeConstraints({ (make) in
                make.top.equalTo(scrollerview.snp.top)
                make.left.equalTo(scrollerview.snp.left).offset(index * 375)
                make.width.equalTo(W)
                make.height.equalTo(scrollerview.snp.height)
            })
        }
    }

    lazy var scrollerview: UIScrollView = {
        let scrollerview = UIScrollView.init(frame: CGRect(x:0,y:0,width:self.view.frame.size.width,height:400))
        scrollerview.bounces = true
        scrollerview.isPagingEnabled = true
        scrollerview.alwaysBounceVertical = true
        scrollerview.contentSize = CGSize(width:(self.view.frame.size.width*CGFloat(self.sourData.count)), height:400)
        scrollerview.center = self.view.center
        return scrollerview
    }()
    
    lazy var sourData: NSArray = {
        var sourData = NSArray()
        sourData = ["100","100","100"]
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
