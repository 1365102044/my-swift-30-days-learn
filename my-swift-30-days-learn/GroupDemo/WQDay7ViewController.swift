//
//  WQDay7ViewController.swift
//  my-swift-30-days-learn
//
//  Created by 刘文强 on 2017/6/27.
//  Copyright © 2017年 inborn. All rights reserved.
//
/**
 总结： 
    所要监听的属性对象要使用 dynamic 修饰
    (监听对象，和被监听对象都是nsobjct 的子类)
    注册
    代理方法
    移除监听
 
 */


import UIKit

@objc (WQDay7ViewController)
class WQDay7ViewController: UIViewController, UITextFieldDelegate {

    dynamic var name : String = ""
    private var name_key = "name_key"
    private var keyboard_key = "keyboard_key"
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "KVO"
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.view.addSubview(textfiled)
        
        /**
         注册
         */
        self.addObserver(self, forKeyPath: "name", options: [.new, .old] , context: &name_key)

//
//        self.addObserver(self, forKeyPath: UIKeyboardFrameEndUserInfoKey, options: [.old, .new], context: &keyboard_key)
    
    
    }

    lazy var textfiled: UITextField = {
        let textfiled = UITextField.init(frame: CGRect(x:100,y:100,width:200,height:30))
        textfiled.placeholder = "输入"
        textfiled.delegate = self
        textfiled.clearButtonMode = .whileEditing
        textfiled.clearButtonRect(forBounds: CGRect(x:10,y:10,width:20,height:20))
        textfiled.backgroundColor = .brown
        return textfiled
    }()

    func textFieldDidEndEditing(_ textField: UITextField) {
        self.name = textfiled.text!
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textfiled.resignFirstResponder()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if context == &name_key {
            
            if let old = change?[NSKeyValueChangeKey.oldKey]{
                
                print("---------oldvalue:\(old)");
            }
            
            if let newvalue = change?[NSKeyValueChangeKey.newKey]{
                
                print("++++++++newvalue:\(newvalue)");
                
            }else {
            
                super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            }
            
        }
        
        if context == &keyboard_key {
            
            if let oldframe = change?[NSKeyValueChangeKey.oldKey]{
            
                print("======keyboard=====\(oldframe)")
            }
            
        }
    }

    deinit {
        self.removeObserver(self, forKeyPath: "name", context: &name_key)
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
