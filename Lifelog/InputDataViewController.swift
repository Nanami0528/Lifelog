//
//  InputDataViewController.swift
//  Lifelog
//
//  Created by nanami on 2017/05/09.
//  Copyright © 2017年 nanami. All rights reserved.
//

import UIKit

class InputDataViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    @IBOutlet var TextView:UITextView!
    @IBOutlet var photoImageView:UIImageView! //写真表示用ImageView
    
  //  let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func inputdata(){
        //saveData.set
       
        //キーボードを閉じる
        TextView.resignFirstResponder()
    }
    
    
    //写真押した時に呼ばれるメソッド
    @IBAction func TappedPhoto(){
        pickercontroller(sourceType: .photoLibrary)

    }
    
    //アルバムの呼び出しメソッド（アルバムのソースタイプが引数）
    func pickercontroller(sourceType: UIImagePickerControllerSourceType){
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = self
            self.present(picker,animated: true,completion: nil)
        }
    }

    //写真が選択された時に呼び出されるメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.dismiss(animated: true, completion: nil)
        
        //画像を出力
        photoImageView.image = info[UIImagePickerControllerOriginalImage]as?UIImage
    }
    
    
    
    
   }

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */


