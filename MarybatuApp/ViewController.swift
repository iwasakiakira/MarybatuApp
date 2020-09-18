//
//  ViewController.swift
//  MarybatuApp
//
//  Created by いわし on 2020/09/12.
//  Copyright © 2020 iwasi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }
    override func viewWillAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "questions") != nil{
            questions = userDefaults.object(forKey: "questions")as! [[String:Any]]
            showQuestion()
       
            
        }else{
            // 問題がなかった場合の処理
            questionLabel.text = "問題がありません｡問題を作りましょう｡"
            trueButton.isEnabled = false
            falseButton.isEnabled = false
        }
    }
    @IBOutlet weak var questionLabel: UILabel!
    
    var currentQuestionNum:Int = 0
    var questions : [[String:Any]] = []
    var correctAnswer = 0
    
    //    let questions:[[String:Any]] = [
    //        ["question":"iphoneの開発者環境はXcodaである","answer":false],
    //        ["question":"ワンピース作者は尾田栄一郎である","answer":true],
    //        ["question":"真実はいつもひとつである","answer":true]
    //    ]
    func showQuestion()  {
        if (questions.count > currentQuestionNum){
            let question = questions[currentQuestionNum]
            if let que = question["question"] as? String{
                //問題文の表示
                questionLabel.text = que
                trueButton.isEnabled = true
                falseButton.isEnabled = true
            }
        }
    }

   
            
   
    // アラートを表示する関数
    func showAlert(message:String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        if  (currentQuestionNum >= questions.count) {
            
            let close = UIAlertAction(title: "閉じる", style: .default, handler: {(action:UIAlertAction!)in
                   
                //アラートが消えるのと画面遷移が重ならないように0.5秒後に画面遷移するようにしてる
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        // 0.5秒後に実行したい処理
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "resultview") as! resultViewController
                        self.present(vc, animated: true, completion: nil)
                    }
                self.goResult()
                }
                )
                alert.addAction(close)
                present(alert,animated: true,completion: nil)
        }else {
            let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
            alert.addAction(close)
            present(alert,animated: true,completion: nil)
        }
        
        }
    
    func goResult(){
        let next = self.storyboard?.instantiateViewController(identifier: "resultview")as! resultViewController
        next.correct = correctAnswer
        self.present(next,animated: true,completion: nil)
        
    }
    
    func showAlert2(message:String){
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close2 = UIAlertAction(title: "閉じる", style: .default, handler: {(action:UIAlertAction!)in
            //アラートが消えるのと画面遷移が重ならないように0.5秒後に画面遷移するようにしてる
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                // 0.5秒後に実行したい処理
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "resultview") as! resultViewController
                self.present(vc, animated: true, completion: nil)
//                let next = self.storyboard?.instantiateViewController(withIdentifier: "result") as! resultViewController
//                self.present(next, animated: true, completion: nil)

                
            }
        }
        )
        alert.addAction(close2)
        present(alert,animated: true,completion: nil)
    }
    
    
    //    var correctAnswers = 0
    func checkAnswer(userAnswer:Bool){
        
        let question = questions[currentQuestionNum]
        currentQuestionNum += 1
        if let ans = question["answer"] as? Bool{
            if userAnswer == ans{
                correctAnswer += 1
                showAlert(message: "正解!")
            }else{
                showAlert(message: "不正解!")
            }
            
            
//                        if userAnswer == ans{
//                // 正解
//                //currentQuestionNumを1足して次の問題に進む
//                currentQuestionNum += 1
//                correctAnswer += 1
//                if(currentQuestionNum >= questions.count){
//                    showAlert2(message: "お疲れさまです｡\nリザルト画面に移行します｡")
//                }else {
//                    showAlert(message: "正解!!")
//                }
//            }else {
//                //不正解
//                //                進む
//                currentQuestionNum += 1
//                if (currentQuestionNum >= questions.count) {
//                    showAlert2(message: "お疲れさまです｡\nリザルト画面に移行します｡")
//                } else {
//                    showAlert(message: "不正解!!")
//                }
//            }
        }else {
            print("答えが入っていません｡")
            return
        }
        //currentQuestionNumの値が問題数以上だったら最初の問題に戻す
        //        if currentQuestionNum >= questions.count {
        //                showAlert2(message: "お疲れさまです｡")
        //
        //                let vc = self.storyboard?.instantiateViewController(withIdentifier: "resultview") as! resultViewController
        //                self.present(vc, animated: true, completion: nil)
        //        }
        //問題の表示
        //正解だったら次の問題、不正解であれば同じ問題が再表示されます。
        showQuestion()
    }
    
    
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    @IBAction func trueButton(_ sender: Any) {
        checkAnswer(userAnswer: true)
    }
    @IBAction func falseButton(_ sender: Any) {
        checkAnswer(userAnswer: false)
    }
    @IBAction func backTopButton(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
}
    @IBAction func makeQwestionButton(_ sender: Any) {
   let vc = self.storyboard?.instantiateViewController(withIdentifier: "makequestionview") as! QuestionViewController
   self.present(vc, animated: true, completion: nil)
    }
    
    
}



