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
    
    //スクリーンショット
    @IBOutlet var screenShot: UIImage!
    @IBOutlet var capturedImage : UIImage!
    @IBOutlet var screenShotView:UIView!
    
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
    
    
    //スクリーンショット関係
    
    private func getScreenShot() -> UIImage {
        // キャプチャする範囲を取得.
        let rect = screenShotView.frame
        
        // ビットマップ画像のcontextを作成.
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        // 対象のview内の描画をcontextに複写する.
        self.view.layer.render(in: context)
        // 現在のcontextのビットマップをUIImageとして取得.
        let capturedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        // contextを閉じる.
        UIGraphicsEndImageContext()
        
        return capturedImage
    }
    
    @IBAction func go (){
        // キャプチャ画像を取得 capturedImageのimageにセット.
        capturedImage = getScreenShot() as UIImage
        
        
        //画面遷移
        performSegue(withIdentifier: "toViewController", sender: nil)
               
    }
    
    
    override func prepare(for segue:UIStoryboardSegue,sender:Any?){
        if segue.identifier == "toViewController" {
       let viewcontroller = segue.destination as! ViewController
        viewcontroller.capturedImage = capturedImage
            
            
        }
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


