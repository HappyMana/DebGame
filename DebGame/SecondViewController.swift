//
//  SecondViewController.swift
//  DebGame
//
//  Created by 伊藤祐哉 on 2021/12/10.
//

import UIKit
import NCMB

class SecondViewController: UIViewController {
    
    var weightTextB:String? = ""
    var weightTextC:String? = ""
    var weightTextD:String? = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        //今日の体重ラベル
        let todayLabel = UILabel()
        todayLabel.frame = CGRect(x:70, y: 200, width: UIScreen.main.bounds.size.width, height: 45)
        todayLabel.text = "今日の体重"
        todayLabel.textColor = UIColor.white
        todayLabel.font = UIFont(name: "HiraKakuProN-W6", size: 30)
        self.view.addSubview(todayLabel)
        
        //体重入力テキスト
        let weightText = UITextField()
        weightText.frame = CGRect(x: 0, y: 250, width: UIScreen.main.bounds.size.width, height: 40)
        weightText.placeholder = "kg"
        weightText.keyboardType = .decimalPad
        weightText.borderStyle = .roundedRect
        self.view.addSubview(weightText)
        weightText.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
        
        
        //体重追加ぼたん
        let weightButton = UIButton()
        
        weightButton.frame = CGRect(x: 330, y: 300 , width: 100, height: 30)
        weightButton.addTarget(self, action: #selector(weightButton( _:)), for: UIControl.Event.touchUpInside)
        weightButton.backgroundColor = UIColor.black
        weightButton.setTitle("決定", for: UIControl.State.normal)
        self.view.addSubview(weightButton)

        
        //食べたものラベル
        let eatLabel = UILabel()
        eatLabel.frame = CGRect(x: 70, y: 350, width: UIScreen.main.bounds.size.width, height: 45)
        eatLabel.text = "今日食べたもの"
        eatLabel.textColor = UIColor.white
        eatLabel.font = UIFont(name: "HiraKakuPro-w6", size: 30)
        self.view.addSubview(eatLabel)
        
        //料理名入力テキスト
        let dishNameText = UITextField()
        dishNameText.frame = CGRect(x: 0, y: 400, width: UIScreen.main.bounds.size.width, height: 40)
        dishNameText.placeholder = "料理名を入力してください"
        dishNameText.keyboardType = .default
        dishNameText.borderStyle = .roundedRect
        self.view.addSubview(dishNameText)
        dishNameText.addTarget(self, action: #selector(textFieldChange2), for: .editingChanged)
        
        
        //カロリー入力テキスト
        let calText = UITextField()
        calText.frame = CGRect(x: 0, y: 450, width: UIScreen.main.bounds.size.width, height: 40)
        calText.placeholder = "kcak"
        calText.keyboardType = .decimalPad
        calText.borderStyle = .roundedRect
        self.view.addSubview(calText)
        calText.addTarget(self, action: #selector(textFieldChange3), for: .editingChanged)
        
        
        //追加ぼたん
        let addButton = UIButton()
        
        addButton.frame = CGRect(x: 330, y: 500, width: 100, height: 30)
        addButton.addTarget(self, action: #selector(self.addButton(_:)), for: UIControl.Event.touchUpInside)
        addButton.backgroundColor = UIColor.black
        addButton.setTitle("追加する", for: UIControl.State.normal)
        self.view.addSubview(addButton)
        
        //ブラウザボタン
        let browserButton = UIButton()
        
        browserButton.frame = CGRect(x: 200, y: 700, width: 250, height: 30)
        browserButton.addTarget(self, action: #selector(self.browserButton(_:)), for: UIControl.Event.touchUpInside)
        browserButton.backgroundColor = UIColor.black
        browserButton.setTitle("カロリーを調べる", for: UIControl.State.normal)
        self.view.addSubview(browserButton)
        
        }
   
    
    //カロリーを調べるために、ブラウザを起動する
    @objc func browserButton(_ sender: UIButton){
        let url = URL(string: "https://www.google.com/")
        UIApplication.shared.open(url!)
            print("ブラウザボタンがタップされました。")
    }
    
    //食べたもの追加
    @objc func addButton(_ sender: UIButton){
        let dish : NCMBObject = NCMBObject(className: "dish")
        
        let uuid = UIDevice.current.identifierForVendor?.uuidString
        dish["user_id"] = uuid
        dish["dish_name"] = weightTextC
        dish["calorie"] = weightTextD
        
        dish.saveInBackground(callback: { result in
            switch result{
                case .success:
                    print("dishの保存に成功しました")
                case .failure(_):
                    print("dishの保存に失敗しました")
            }
        })
            print("食べたもの追加ボタンが押されました")
    }
    
    
    @objc func textFieldChange( _ sender: UITextField){
        weightTextB = sender.text
    }
    @objc func textFieldChange2( _ sender: UITextField){
        weightTextC = sender.text
    }
    @objc func textFieldChange3( _ sender: UITextField){
        weightTextD = sender.text
    }
    
    
    //体重追加
    @objc func weightButton( _ sender :UIButton){
        let uuid = UIDevice.current.identifierForVendor?.uuidString
                
        guard let text = weightTextB else {return}
        let dNum: Double = NSString(string: text).doubleValue
                
                //resultクラス
                let results : NCMBObject = NCMBObject(className: "results")
                
                results["user_id"] = uuid
                results["date"] = Date()
                results["result"] = true
                results["weight"] = dNum
                
                results.saveInBackground(callback: { result in
                    switch result{
                        case .success:
                            print("resultsの保存に成功しました")
                        case .failure(_):
                            print("resultsの保存に失敗しました")
                    }
                })
                    weightTextB = ""

            print("ブラウザボタンがタップされました。")
    }
        
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


