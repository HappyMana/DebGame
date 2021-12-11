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
        
        view.backgroundColor = UIColor.black
        
        //戻るボタン
        let backButton = UIButton()
        
        backButton.frame = CGRect(x: 30, y: 50, width: 50, height: 30)
        backButton.addTarget(self, action: #selector(self.tapButton(_:)), for: UIControl.Event.touchUpInside)
        backButton.backgroundColor = UIColor.black
        backButton.setTitle("ボタン", for: UIControl.State.normal)
        self.view.addSubview(backButton)
        
        //料理追加ボタン
        let addDishButton = UIButton()             // buttonを生成
        
        addDishButton.frame = CGRect(x: 300, y: 500, width: 50, height: 30)
        addDishButton.addTarget(self, action: #selector(self.plusButton(_:)), for: UIControl.Event.touchUpInside)
        addDishButton.backgroundColor = UIColor.black
        addDishButton.setTitle("ボタン", for: UIControl.State.normal)
        self.view.addSubview(addDishButton)
        
        // Do any additional setup after loading the view.
    }
    // tapButton
    @objc func tapButton(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
            print("戻るボタンがタップされました。")
    }
    
    @objc func plusButton(_ sender: UIButton){
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondView3") as! SecondViewController3
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
            print("料理追加ボタンがタップされました。")
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
