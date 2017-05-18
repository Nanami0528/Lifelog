//
//  ViewController.swift
//  Lifelog
//
//  Created by nanami on 2017/05/05.
//  Copyright © 2017年 nanami. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    @IBOutlet var table:UITableView!
    @IBOutlet var capturedImage:UIImage?
    @IBOutlet var test:UIImageView!
    @IBOutlet var toSelectVIew:UIButton!
       
    //配列上２個やのに下１個しか入ってない時、Tableviewセルの数２こやと動かない
    var imgArray:NSArray = ["dog1.jpg","cat1.jpg"]
    var imageColler:NSArray = ["赤色.jpg","赤色.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test.image = capturedImage
        
    }
    
    //Table Viewのセルの数を指定
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath)
        
        let imgA = UIImage(named:"\(imgArray[indexPath.row])")
        let imgC = UIImage(named:"\(imageColler[indexPath.row])")
        
        // Tag番号 1 で UIImageView インスタンスの生成
        let imageView = table.viewWithTag(1) as! UIImageView
        imageView.image = imgA
        
        
        // Tag番号 ２ で UILabel インスタンスの生成
        let imageView2 = table.viewWithTag(2) as! UIImageView
        imageView2.image = imgC
       
        /* // Tag番号 ３ で UILabel インスタンスの生成
        let label2 = table.viewWithTag(3) as! UILabel
        label2.text = "\(imageTitles[indexPath.row])"*/
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  



}

