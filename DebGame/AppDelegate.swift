//
//  AppDelegate.swift
//  DebGame
//
//  Created by 木下真菜 on 2021/12/05.
//

import UIKit
import NCMB

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // APIキーの設定とSDK初期化
        NCMB.initialize(applicationKey: "159acc172e44eec55b24c4b1410266713b87db1ecf65fe8833947fd13de14d96", clientKey: "e684e2fd10baf383bbffa90ec916c1860c3f8d4d714f6a837b205a16a861eae9")
        
        //クラスの作成
        
        //userクラス
        let game_user : NCMBObject = NCMBObject(className: "game_user")
        
        game_user["user_id"] = ""
        game_user["gender"] = true
        game_user["birthday"] = Date()
        game_user["height"] = 0.00
        game_user["target_weight"] = 0.00
        game_user["notification"] = true
        game_user["life"] = 0
        game_user["continue_clear_days_counter"] = 0
        
        game_user.saveInBackground(callback: { result in
            switch result{
                case .success:
                    print("userの保存に成功しました")
                case .failure(_):
                    print("userの保存に失敗しました")
            }
        })
        
        //dishクラス
        let dish : NCMBObject = NCMBObject(className: "dish")
        
        dish["dish"] = ""
        dish["user_id"] = ""
        dish["date"] = Date()
        dish["time_zone"] = ""
        dish["dish_name"] = ""
        dish["calorie"] = 0
        dish["photo"] = ""
        
        dish.saveInBackground(callback: { result in
            switch result{
                case .success:
                    print("dishの保存に成功しました")
                case .failure(_):
                    print("dishの保存に失敗しました")
            }
        })
        
        //resultクラス
        let results : NCMBObject = NCMBObject(className: "results")
        
        results["user_id"] = ""
        results["date"] = Date()
        results["result"] = true
        results["weight"] = 0.00
        
        results.saveInBackground(callback: { result in
            switch result{
                case .success:
                    print("resultsの保存に成功しました")
                case .failure(_):
                    print("resultsの保存に失敗しました")
            }
        })
        
        let uuid = UIDevice.current.identifierForVendor?.uuidString
        
            NCMBUser.logInInBackground(userName: uuid!, password: uuid!, callback: { result in
                switch result {
                    case .success:
                        // ログインに成功した場合の処理
                        print("ログインに成功しました")
                    case let .failure(error):
                        // ログインに失敗した場合の処理
                        print("ログインに失敗しました: (error)")
                        //初回の場合
                        let user = NCMBUser()

                        user.userName = uuid
                        user.password = uuid

                        user.signUpInBackground(callback: { result in
                switch result {
                    case .success:
                        print("新規登録に成功しました")
                    case .failure(_):
                        print("新規登録に失敗しました")
                }
            })
        }
        })
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

