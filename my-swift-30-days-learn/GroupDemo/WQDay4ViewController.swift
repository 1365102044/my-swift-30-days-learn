//
//  WQDay4ViewController.swift
//  my-swift-30-days-learn
//
//  Created by 刘文强 on 2017/6/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

import UIKit

@objc (WQDay4ViewController)
class WQDay4ViewController: UIViewController,UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(scrollerview)
        scrollerview.contentSize = imageview.bounds.size
        scrollerview.addSubview(imageview)
        
        
        // Do any additional setup after loading the view.
    }

    lazy var imageview: UIImageView = {
        var imageview = UIImageView.init(frame: self.view.bounds)
        imageview.image = UIImage.init(named: "100.jpg")
        imageview.isUserInteractionEnabled = true
        return imageview
    }()
    
    lazy var scrollerview: UIScrollView = {
        var scrollerview = UIScrollView.init(frame: self.view.bounds)
        scrollerview.maximumZoomScale = 5.0
        scrollerview.minimumZoomScale = 1.0
        
        scrollerview.delegate = self
        return scrollerview
    }()
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageview
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
