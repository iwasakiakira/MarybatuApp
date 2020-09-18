//
//  coiceViewController.swift
//  MarybatuApp
//
//  Created by いわし on 2020/09/12.
//  Copyright © 2020 iwasi. All rights reserved.
//

import UIKit

class coiceViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func makeQuestionButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "makequestionview") as! QuestionViewController
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func replyButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "replyview") as! ViewController
        self.present(vc, animated: true, completion: nil)
    }
  
    

}
