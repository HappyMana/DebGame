//
//  SecondViewController2.swift
//  DebGame
//
//  Created by 伊藤祐哉 on 2021/12/11.
//

import UIKit

class SecondViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func foodAddButton(_ sender: Any) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondView3") as! SecondViewController3
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
        
        print("食べたもの追加画面に遷移しました")
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("今日の画面に戻りました")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
