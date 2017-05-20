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
    @IBOutlet var capturedImage:UIImage!
    @IBOutlet var test:UIImageView!
    @IBOutlet var toSelectVIew:UIButton!
    
    var num:Int!
       
    //配列上２個やのに下１個しか入ってない時、Tableviewセルの数２こやと動かない
    //var imgArray:[UIImage] = [dog1.jpg,cat1.jpg]
    var imgArray:[UIImage] = []
    var imageColler:Array = ["赤色.jpg","赤色.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        num = 0
        //test.image = capturedImage
        
      /*   imgArray.insert("capturedImage", at: 2)
         imageColler.insert("赤色.jpg", at: 2)
print(imgArray)*/
        
        
        /*//UserDefaults保存関係↓
        // UserDefaultsを使用できるようにする
        let defaults = UserDefaults.standard
        
        // UserDefaultsに保存する
       // defaults.set(str, forKey: "str")
       //   defaults.set(capturedImage, forKey: "img1")
        
        
        // UserDefaultsから値を読み込む
       // let str2:String = defaults.string(forKey: "str")
      // let capturedImage = defaults.data(forKey:"img1")
*/
        }
    
    
   //UserDefaults保存関係↓
   /* public func UIImagePNGRepresentation(_ image: UIImage) -> Data?{

       // return
    }
    func saveImage3(pn:Int,imgs:[UIImage]){
        // UserDefaultsを使用できるようにするe
        let defaults = UserDefaults.standard
        // [UIImage] → [NSData]
        
        // let dataImages: [NSData] = photos.map { (image) -> NSData in
        let dataImages: [Data] = imgArray.map{ (image) -> Data in
            UIKit.UIImagePNGRepresentation(image)!
        }
        
        //
        let photosName:String = "imgArray" + String(pn)//保存名を決定
        defaults.set(dataImages, forKey: photosName)
        
    }*/
    
    
    
    
    /*override func viewWillAppear(_ animated: Bool) {
        //imgArray.insert("capturedImage", at: 2)
        num = num + 1
        print(num)
        if num > 1{
            
        
        imgArray.insert(capturedImage, at: 2)
        imageColler.insert("赤色.jpg", at: 2)
        print(imgArray)
        }
    }*/
    
    
    //Table Viewのセルの数を指定
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArray.count
        
        
    }
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        imgArray.insert(capturedImage, at: 2)
        imageColler.insert("赤色.jpg", at: 2)
        print(imgArray)
        
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

