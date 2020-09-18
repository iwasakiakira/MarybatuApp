//
//  QuestionViewController.swift
//  MarybatuApp
//
//  Created by いわし on 2020/09/12.
//  Copyright © 2020 iwasi. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController,UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quesitionField.delegate = self
    }
    //userが保存した時に内容を入れる配列
    var questions:[[String:Any]] = []
    
    
    
    @IBOutlet weak var quesitionField: UITextField!
    
    
    @IBOutlet weak var marubatuControl: UISegmentedControl!
    //TOPに戻るボタンが押されたときの処理
    @IBAction func tapBackToTopButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func replyButton(_ sender: Any) {
    let vc = self.storyboard?.instantiateViewController(withIdentifier: "replyview") as! ViewController
    self.present(vc, animated: true, completion: nil)
    }
    //問題を保存ボタンが押されたときの処理
    @IBAction func tapSaveButton(_ sender: Any) {
        //問題内容のFieldが入力されているかどうか
        if quesitionField.text != "" {
            //QuestionTextFieldになにか文字が入力されていたときの処理
            
            //○かXかを入れる変数
            var marubatuAnswer:Bool = true
            //SegmentedControlで○が選ばれている(indexが0)とき
            if marubatuControl.selectedSegmentIndex == 0 {
                marubatuAnswer = true
            }else{
                //○以外のとき -> ✗のとき
                marubatuAnswer = false
            }
            
            let userDefaults = UserDefaults.standard
            if  userDefaults.object(forKey: "questions") != nil{
                questions = userDefaults.object(forKey: "questions") as! [[String:Any]]
            }
            
            questions.append(
                ["question":quesitionField.text!,
                 "answer":marubatuAnswer
            ])
          //保存
            userDefaults.set(questions, forKey: "questions")
            //ユーザーにアラートを表示
            showAlert(message: "問題が保存されました｡")
          //テキストフィールドを空にする｡
            quesitionField.text = ""
           
        }
        else{
            showAlert(message: "問題を入力してください｡")
        }
        
    }
    //問題をすべて削除ボタンを押されたときの処理
    @IBAction func tapAllDeleteButton(_ sender: Any) {
        let userDefaults = UserDefaults.standard
         //保存されている問題と解答をすべて削除
        userDefaults.removeObject(forKey: "questions")
        //空の配列にしておく
//        userDefaults.set([], forKey: "questions")
        showAlert(message: "問題を全て削除しました｡")
    }
    func showAlert(message:String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert,animated: true,completion: nil)
    }
    
}

