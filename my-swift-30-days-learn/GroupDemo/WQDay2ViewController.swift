//
//  WQDay2ViewController.swift
//  timer-test
//
//  Created by 刘文强 on 2017/6/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

import UIKit
import SnapKit

@objc (WQDay2ViewController)
class WQDay2ViewController: UIViewController, UITextViewDelegate{

    var mytextView  = UITextView()
    var numberText = UILabel()
    var palaceText = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "textview"
        self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        loadNavItem()
        loadTextView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(note:)), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(textchangeseletor(noti:)), name: Notification.Name.UITextViewTextDidEndEditing, object: nil)
        
        // Do any additional setup after loading the view.
    }

    
    func loadTextView() {
        
//        let screenW = UIScreen.main.bounds.size.width
//        let screenH = UIScreen.main.bounds.size.height
        
        mytextView = UITextView()
        self.view.addSubview(mytextView)
        mytextView.delegate = self
        mytextView.backgroundColor = UIColor.white
        mytextView.layer.borderColor = UIColor.gray.cgColor
        mytextView.layer.borderWidth = 1
        
        numberText = UILabel.init()
        mytextView.addSubview(numberText)
        numberText.text = "100"
        numberText.backgroundColor = UIColor.brown
        numberText.alpha = 0.5
        
        palaceText = UILabel()
        mytextView.addSubview(palaceText)
        palaceText.backgroundColor = UIColor.clear
        palaceText.textColor = UIColor.gray
        palaceText.alpha = 0.6
        palaceText.text = "请输入内容"
        
        mytextView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(10+64)
            make.left.equalTo(self.view).offset(10)
            make.right.equalTo(self.view.snp.right).offset(-10)
            make.height.equalTo(300)
        }
        
        numberText.snp.makeConstraints { (make) in
            make.right.equalTo(mytextView.snp.right).offset(-10)
            make.bottom.equalTo(mytextView.snp.bottom).offset(-5)
            make.height.equalTo(20)
            make.width.equalTo(50)
        }
        
        palaceText.snp.makeConstraints { (make) in
            make.left.equalTo(mytextView.snp.left).offset(5)
            make.top.equalTo(mytextView.snp.top).offset(5)
            make.height.equalTo(20)
            make.width.equalTo(100)
        }
    }
    
    func keyboardWillChangeFrame(note:Notification) {
//        let duration = note.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
//        let endframe = (note.userInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//        let y = endframe.origin.y
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        mytextView.resignFirstResponder()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let temp = textView.text
        if  temp != nil && temp != ""{
            palaceText.isHidden = true
        } else {
            palaceText.isHidden = false
        }
    }

    
    func loadNavItem()  {
        let leftitem = UIBarButtonItem.init(title: "close", style: .plain, target: self, action: #selector(clickleftItem));
        self.navigationItem.leftBarButtonItem = leftitem;
        let rightitem = UIBarButtonItem.init(title: "clear", style: .plain, target: self, action: #selector(clickrightItem))
        self.navigationItem.rightBarButtonItem = rightitem
    }
    
    func clickleftItem()  {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func clickrightItem() {
        
        mytextView.text = ""
        palaceText.isHidden = false
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
