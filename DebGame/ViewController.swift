//
//  ViewController.swift
//  DebGame
//
//  Created by 木下真菜 on 2021/12/05.
//  join 伊藤祐哉 on 2021/12/6.
//

import UIKit

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
        
        // デスゲームの表示
        let title = UILabel()
        title.frame = CGRect(x:10, y:50, width:200, height:30)
        title.text = "デスゲーム"
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
        let clearDayText = UILabel()
        clearDayText.frame = CGRect(x:10, y:110, width:300, height:30)
        clearDayText.text = "0日連続クリア中"
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
        messageName.frame = CGRect(x:60, y:550, width:300, height:100)
        messageName.text = "必要な摂取カロリーを摂取してください"
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

