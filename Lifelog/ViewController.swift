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
   // @IBOutlet var test:UIImageView!
    @IBOutlet var toSelectVIew:UIButton!
    
   
    
    
    //配列上２個やのに下１個しか入ってない時、Tableviewセルの数２こやと動かない
    //var imgArray:[UIImage] = [dog1.jpg,cat1.jpg]
    var imgArray:[UIImage] = []
    var imageColler:Array = ["赤色.jpg","赤色.jpg","赤色.jpg","赤色.jpg","赤色.jpg"]
    var test:[Data] = []
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
              //test.image = capturedImage
        
        
        
    
        }
    
    
    
    
    
    

    
    
    
    
  override func viewWillAppear(_ animated: Bool) {
   
    // !=はノットイコールやから   nilではない = 画像がある という意味
    //capturedImageがあったら表示
    if  capturedImage != nil {
        
        imgArray.insert(capturedImage, at: 0)
      //  imageColler.insert("赤色.jpg", at: 0)
        print(imgArray)
        
 
        let userDefaults = UserDefaults.standard
        
        //今までに保存したデータがあるか確認　もしあったら
        //!=はノットイコールやから   nilではない = 画像がある という意味
        if (userDefaults.object(forKey: "imageData") != nil){
            print("データあり")
            //savedDataにuserDefaultsを呼び出す
            let savedData = userDefaults.object(forKey: "imageData")as![Data]
            //imgArrayにuserDefaultsに保存されていたデータを追加（[savedData]保存されている数だけ追加）
            for i in 0..<savedData.count {
                
                imgArray.append(UIImage(data:savedData[i])!)
                
            }
        }
        //二回目の場合　新しいのに古いのを追加した完成版を改めて保存
        // [UIImage] → [Data]
        let data: [Data] = imgArray.map { (image) -> Data in
            UIImagePNGRepresentation(image)!
        }
        
        userDefaults.set(data, forKey: "imageData")
        //userDefaultsをplistファイルへの出力と同期する。
        userDefaults.synchronize()
        print(userDefaults,"←写真保存")
        
        //imgArray =  userDefaults.objectForKey("imageData") as! [NSData]
   
        // UserDefaultsから値を読み込む
        //imgArray = userDefaults.object(forKey: "imageData") as! [UIImage]
          test = userDefaults.object(forKey: "imageData") as! [Data]
        print(test,"←保存できてる？")

        
    }
 
 
 
 
 
    }
    
    
    //Table Viewのセルの数を指定 imgArrayの数だけtableViewのセルを作る
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArray.count
        
        
    }
    
    //各セルの要素を設定する
    //cellForRowAt:セルがテーブルビューの特定の場所に挿入されるように情報取り出して！！
    //indexPath:選択したところ！
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath)
       
        
      
        
        
        // Tag番号 1 で UIImageView インスタンスの生成
        let imageView = table.viewWithTag(1) as! UIImageView
       // imgArrayの配列の画像をcellの行ごとに（indexPath.row）、imageViewに追加して行く
        //imageView.image = imgArray[indexPath.row]
       // print(indexPath.row,"←indexPath.row　行数入ってた")
       // imageView.image =  UIImage(data: test[indexPath.row])
         imageView.image =  imgArray[indexPath.row]
        
        // Tag番号 ２ で UILabel インスタンスの生成
        let imageView2 = table.viewWithTag(2) as! UIImageView
        // imageCollerの配列の画像をcellの行ごとに（indexPath.row）、imageViewに追加して行く
        imageView2.image = UIImage(named:"\(imageColler[indexPath.row])")
   
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

