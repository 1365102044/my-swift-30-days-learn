//
//  WQDay1ViewController.swift
//  timer-test
//
//  Created by 刘文强 on 2017/6/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

import UIKit

@objc (WQDay1ViewController)
class WQDay1ViewController: UIViewController {

    
    var toplable = UILabel()
    var timer:Timer!
    var lableNumber:Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        toplable.backgroundColor = UIColor.gray
        toplable.text = String(0)
        self.view.addSubview(toplable)
        toplable.textAlignment = NSTextAlignment.center
        toplable.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(300)
            make.top.equalTo(self.view)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        toplable.font = UIFont.systemFont(ofSize: 15, weight: 5)
        toplable.textColor = UIColor.black
        
        let startBtn:UIButton  = UIButton()
        startBtn.backgroundColor = UIColor.brown
        startBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        startBtn.setTitle("开始", for: UIControlState.normal)
        self.view.addSubview(startBtn)
        startBtn.addTarget(self, action: #selector(startHandle), for: .touchUpInside)
        startBtn.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.frame.width/2)
            make.left.bottom.equalTo(self.view)
            make.top.equalTo(toplable.snp.bottom)
        }
        
        let stopBtn = UIButton()
        stopBtn.setTitle("暂停", for: .normal)
        stopBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        stopBtn.backgroundColor = UIColor.yellow
        stopBtn.addTarget(self, action: #selector(stopHandle), for: .touchUpInside)
        self.view.addSubview(stopBtn)
        stopBtn.snp.makeConstraints { (make) in
            make.left.equalTo(startBtn.snp.right)
            make.bottom.right.equalTo(self.view)
            make.top.equalTo(toplable.snp.bottom)
        }
        
        
        //        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(starTimer), userInfo: nil, repeats: true)
        
    }
    
    func starTimer()  {
        
        self.lableNumber = self.lableNumber + 0.1
        self.toplable.text = String(format:"%.1f",self.lableNumber)
        
    }
    
    func startHandle()  {
        if ((self.timer == nil)) {
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
                
                self.starTimer()
            })
            self.timer.fire()
        }else{
            
            self.timer.fire()
        }
    }
    
    func stopHandle()  {
        guard let timerforDistory = self.timer else{return}
        timerforDistory.invalidate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
