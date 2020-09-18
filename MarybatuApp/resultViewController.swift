//
//  resultViewController.swift
//  MarybatuApp
//
//  Created by いわし on 2020/09/12.
//  Copyright © 2020 iwasi. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {

    var correct = 0
    var childCallBack: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctAnswerLabel.text = "\(correct)問正解！"
    }
    

    
    @IBAction func TopBackButton(_ sender: Any) {
//         self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
       // 遷移するViewを定義する.このas!はswift1.2では as?だったかと。
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "startview") as! coiceViewController
       // アニメーションを設定する.
       //secondViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
       // 値渡ししたい時 hoge -> piyo
       //secondViewController.piyo = self.hoge
       // Viewの移動する.
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    @IBOutlet weak var correctAnswerLabel: UILabel!
     // 1. 遷移先に渡したい値を格納する変数を用意する
   
   func getCorrectAnswerNumber(for correctAnswer: Int){
           
           let correctAnswer = "\(correctAnswer)問正解！"
           
   //        print("インスタンス接続ok",correctAnswerNumber)
    
           DispatchQueue.main.async {
               print("ラベル前接続ok",correctAnswer)
//           self.correctAnswerLabel?.text = correctAnswer
          self.correctAnswerLabel.text = String(correctAnswer)
               print("ラベル後接続ok",correctAnswer)
           }
       }
    
   
   
    
}

