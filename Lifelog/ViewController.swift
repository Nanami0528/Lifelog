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
    //var imageArray:[UIImage] = [dog1.jpg,cat1.jpg]
    var imageArray:[UIImage] = []
    //var imageColler:Array = ["赤色.jpg","赤色.jpg","赤色.jpg","赤色.jpg","赤色.jpg"]
    var test:[Data] = []
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
              //test.image = capturedImage
        
        
        
    
        }
    
    
    
    
    
    

    
    
    
    
  override func viewWillAppear(_ animated: Bool) {
   
    // !=はノットイコールやから   [nilではない = 画像がある] という意味
    //capturedImageがあったら表示
    if  capturedImage != nil {
       
        //配列の指定の箇所に要素を挿入(insert)する
        imageArray.insert(capturedImage, at: 0)
//       imageColler.insert("赤色.jpg", at: 0)
        print(imageArray)
        
        //インスタンスの作成→UserDefaultsの宣言
        let userDefaults = UserDefaults.standard
        
        //!=はノットイコールやから   [nilではない = 画像がある] という意味
        //今までに保存したデータがあるか確認　もしあったら
        if (userDefaults.object(forKey: "imageData") != nil){
            print("データあり")
            //savedDataにuserDefaultsを呼び出す
            let savedData = userDefaults.object(forKey: "imageData")as![Data]
            
            //imageArrayにuserDefaultsに保存されていたデータを追加（[savedData]保存されている数だけ追加）
            for i in 0..<savedData.count {
                
                //入ってる配列の後ろに要素を追加append
                imageArray.append(UIImage(data:savedData[i])!)
                
            }
         /*-----------------for-in ~指定範囲から順に値を取り出して実行------------------
             for 変数 in 開始値..<最終値 { // 最終値を含まない  （...←この点が三つやと最終値含む）
             // 処理
             }
            
         ------------------------------------*/
        }
        //二回目の場合　新しいのに古いのを追加した完成版を改めて保存
        
        // [UIImage] → [Data]
        let data: [Data] = imageArray.map { (image) -> Data in
            UIImagePNGRepresentation(image)!
        }
        
        //dataを[imageData]というキーでuserDefaultに保存
        userDefaults.set(data, forKey: "imageData")
        
        //userDefaultsをplistファイルへの出力と同期する。
        userDefaults.synchronize()
        print(userDefaults,"←写真保存")
        
        //imageArray =  userDefaults.objectForKey("imageData") as! [NSData]
   
        // UserDefaultsから値を読み込む
        //imageArray = userDefaults.object(forKey: "imageData") as! [UIImage]
        
        //↓これいらんかも
         test = userDefaults.object(forKey: "imageData") as! [Data]
        print(test,"←保存できてる？")

        
    }
 
 
 
 
 
    }
    
    
    //Table Viewのセルの数を指定 imageArrayの数だけtableViewのセルを作る
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
        
        
    }
    
    //各セルの要素を設定する
    //cellForRowAt:セルがテーブルビューの特定の場所に挿入されるように情報取り出して！！
    //indexPath:選択したところ！
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
       
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath)
       
        
      
        
        
        // Tag番号 1 で UIImageView インスタンスの生成
        let imageView = table.viewWithTag(1) as! UIImageView
       // imageArrayの配列の画像をcellの行ごとに（indexPath.row）、imageViewに追加して行く
        //imageView.image = imageArray[indexPath.row]
       // print(indexPath.row,"←indexPath.row　行数入ってた")
       // imageView.image =  UIImage(data: test[indexPath.row])
         imageView.image =  imageArray[indexPath.row]
        
        // Tag番号 ２ で UILabel インスタンスの生成
//        let imageView2 = table.viewWithTag(2) as! UIImageView
        // imageCollerの配列の画像をcellの行ごとに（indexPath.row）、imageViewに追加して行く
//        imageView2.image = UIImage(named:"\(imageColler[indexPath.row])")
   
        /* // Tag番号 ３ で UILabel インスタンスの生成
        let label2 = table.viewWithTag(3) as! UILabel
        label2.text = "\(imageTitles[indexPath.row])"*/
        
        
        
        
        return cell
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // セルの削除許可の設定
    func tableView(_ tableView: UITableView,canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            // 削除
             imageArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            
           /* // データの保存
            let defaults = UserDefaults.standard
            defaults.set(Data(), forKey: "imageData")
            defaults.synchronize()
          */
            
            
        }
    }

    
    
    


}

