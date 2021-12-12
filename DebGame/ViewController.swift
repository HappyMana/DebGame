//
//  ViewController.swift
//  DebGame
//
//  Created by 木下真菜 on 2021/12/05.
//  join 伊藤祐哉 on 2021/12/6.
//

import UIKit
import NCMB

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Screen Size の取得
        let screenWidth = self.view.bounds.width
        
        // ヘッダーの背景画像の表示
        let headerBgImage = UIImageView()
        headerBgImage.image = UIImage(named: "C0C0C0")
        headerBgImage.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 100)
        self.view.addSubview(headerBgImage)
        
        // デブゲームの表示
        let title = UILabel()
        title.frame = CGRect(x:10, y:50, width:200, height:30)
        title.text = "デブゲーム"
        title.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(title)
        
        // ガリ画像の表示
        let gariImage = UIImageView()
        gariImage.image = UIImage(named: "ガリ")
        gariImage.frame = CGRect(x: 150, y: 30, width: 100, height: 75)
        gariImage.contentMode = .scaleAspectFit
        self.view.addSubview(gariImage)

        // ゲームオーバーまでテキストの表示
        let text1 = UILabel()
        text1.frame = CGRect(x:230, y:35, width:200, height:30)
        text1.text = "ゲームオーバーまで"
        text1.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(text1)
        
        // あと○日テキストの表示
        let lifeText = UILabel()
        lifeText.frame = CGRect(x:300, y:65, width:200, height:30)
        lifeText.text = "あと50人"
        lifeText.font = UIFont.systemFont(ofSize: 25)
        self.view.addSubview(lifeText)
        
        // ×日連続クリア中の表示
        var clearDayNum = 0
        let clearDayText = UILabel()
        clearDayText.frame = CGRect(x:10, y:110, width:300, height:30)
        clearDayText.text = "\(clearDayNum)日連続クリア中"
        clearDayText.font = UIFont.systemFont(ofSize: 35)
        self.view.addSubview(clearDayText)
        
        // ゲームマスター画像の表示
        let gameMasterImage = UIImageView()
        gameMasterImage.image = UIImage(named: "ゲームマスター")
        gameMasterImage.frame = CGRect(x: -195, y: 150, width: 800, height: 900)
        gameMasterImage.contentMode = .scaleAspectFit
        self.view.addSubview(gameMasterImage)
        
        // メッセージ背景画像の表示
        let messageBgImage = UIImageView()
        messageBgImage.image = UIImage(named: "メッセージ背景")
        messageBgImage.frame = CGRect(x: -195, y: 150, width: 800, height: 900)
        messageBgImage.contentMode = .center
        self.view.addSubview(messageBgImage)
        
        // ゲームマスター名前の表示
        let gameMasterName = UILabel()
        gameMasterName.frame = CGRect(x:60, y:500, width:200, height:30)
        gameMasterName.text = "ゲームマスター"
        gameMasterName.textColor = UIColor.white
        gameMasterName.font = UIFont.systemFont(ofSize: 25)
        self.view.addSubview(gameMasterName)
        
        // メッセージの表示
        let messageName = UILabel()
        messageName.frame = CGRect(x:60, y:450, width:300, height:300)
        
        var sumCalories: Int = 0
        let uuid = UIDevice.current.identifierForVendor?.uuidString
        // クエリの作成
        var query : NCMBQuery<NCMBObject> = NCMBQuery.getQuery(className: "dish")
        query.where(field: "user_id", equalTo: uuid)
        query.findInBackground(callback: { result in
            switch result {
                case let .success(array):
                    print("取得に成功しました 件数: \(array.count)")
                    array.forEach {
                        let data01 = $0 as! NCMBObject
                        let getCalorie: Int? = data01["calorie"]
                        sumCalories += getCalorie!
                        print(sumCalories)
                    }
                    if (2200 - sumCalories > 0) {
                        messageName.text = "残り\(2200 - sumCalories)kcalです。必要な摂取カロリーを摂取してください"
                        clearDayNum = 1
                    } else {
                        messageName.text = "おめでとうございます！\(sumCalories)kcal摂取し、クリアです！"
                    }
                case let .failure(error):
                    print("取得に失敗しました: \(error)")
            }
        })
        messageName.numberOfLines = 4
        messageName.textColor = UIColor.white
        messageName.textAlignment = NSTextAlignment.center
        messageName.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(messageName)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

