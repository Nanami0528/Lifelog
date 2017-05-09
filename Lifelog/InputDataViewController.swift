//
//  InputDataViewController.swift
//  Lifelog
//
//  Created by nanami on 2017/05/09.
//  Copyright © 2017年 nanami. All rights reserved.
//

import UIKit

class InputDataViewController: UIViewController {
    
    @IBOutlet var TextView:UITextView!
    
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

   }

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */


