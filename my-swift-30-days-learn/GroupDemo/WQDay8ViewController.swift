//
//  WQDay8ViewController.swift
//  my-swift-30-days-learn
//
//  Created by 刘文强 on 2017/6/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

import UIKit
@objc (WQDay8ViewController)
class WQDay8ViewController: UIViewController {

    var itemW: Float = 0
    let cols:CFloat  = 3
//    let indifter: String = "collectcell"
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "collecView"
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
     self.view.addSubview(collectView)
    }

    
    lazy var collectView: UICollectionView = {
        let cols = 3
//        let itemW: Float = Float(self.view.frame.size.width-(cols-1)*10/3)
        let itemW = 150
        let layout = UICollectionViewFlowLayout.init()
//        layout.scrollDirection = .horizontal
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width:itemW, height:250)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let collectView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        collectView.delegate = self
        collectView.dataSource  = self
        collectView.register(UICollectionViewCell.classForCoder() , forCellWithReuseIdentifier: "cell")
        return collectView
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

extension WQDay8ViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:UICollectionViewCell = collectView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        
        return cell
    }
}

extension WQDay8ViewController: UICollectionViewDelegate {

}
