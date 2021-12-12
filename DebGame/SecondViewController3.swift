//
//  SecondViewController3.swift
//  DebGame
//
//  Created by 伊藤祐哉 on 2021/12/11.
//

import UIKit

class SecondViewController3: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        //料理名入力テキスト
        let dishNameText = UITextField()
        dishNameText.frame = CGRect(x: 0, y: 350, width: UIScreen.main.bounds.size.width, height: 40)
        dishNameText.placeholder = "料理名を入力してください"
        dishNameText.keyboardType = .decimalPad
        dishNameText.borderStyle = .roundedRect
        self.view.addSubview(dishNameText)
        
        
        //カロリー入力テキスト
        let calText = UITextField()
        calText.frame = CGRect(x: 0, y: 450, width: UIScreen.main.bounds.size.width, height: 40)
        calText.placeholder = "kcak"
        calText.keyboardType = .decimalPad
        calText.borderStyle = .roundedRect
        self.view.addSubview(calText)
        
        
        //戻るボタン
        let backButton = UIButton()
        
        backButton.frame = CGRect(x: 30, y: 50, width: 50, height: 30)
        backButton.addTarget(self, action: #selector(self.tapButton(_:)), for: UIControl.Event.touchUpInside)
        backButton.backgroundColor = UIColor.black
        backButton.setTitle("ボタン", for: UIControl.State.normal)
        self.view.addSubview(backButton)
        
        //カメラボタン
        let cameraButton = UIButton()
        
        cameraButton.frame = CGRect(x: 150, y: 300, width: 50, height: 30)
        cameraButton.addTarget(self, action: #selector(self.cameraButton(_:)), for: UIControl.Event.touchUpInside)
        cameraButton.backgroundColor = UIColor.black
        cameraButton.setTitle("ボタン", for: UIControl.State.normal)
        self.view.addSubview(cameraButton)
        
        //追加ボタン
        let addButton = UIButton()
        
        addButton.frame = CGRect(x: 50, y: 700, width: 50, height: 30)
        addButton.addTarget(self, action: #selector(self.tapButton(_:)), for: UIControl.Event.touchUpInside)
        addButton.backgroundColor = UIColor.black
        addButton.setTitle("ボタン", for: UIControl.State.normal)
        self.view.addSubview(addButton)
        
        //ブラウザボタン
        let browserButton = UIButton()
        
        browserButton.frame = CGRect(x: 350, y: 700, width: 50, height: 30)
        browserButton.addTarget(self, action: #selector(self.browserButton(_:)), for: UIControl.Event.touchUpInside)
        browserButton.backgroundColor = UIColor.black
        browserButton.setTitle("ボタン", for: UIControl.State.normal)
        self.view.addSubview(browserButton)
        // Do any additional setup after loading the view.
    }
    
    //前の画面に戻る
    @objc func tapButton(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
            print("戻るボタンがタップされました。")
    }
    //カメラを起動する
    @objc func cameraButton(_ sender: UIButton){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        present(imagePicker, animated: true)
            print("戻るボタンがタップされました。")
    }
    //入力した料理を追加する
    
    //カロリーを調べるために、ブラウザを起動する
    @objc func browserButton(_ sender: UIButton){
        let url = URL(string: "https://www.google.com/")
        UIApplication.shared.open(url!)
            print("ブラウザボタンがタップされました。")
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
