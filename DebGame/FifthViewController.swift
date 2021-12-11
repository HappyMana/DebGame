//
//  FifthViewController.swift
//  DebGame
//
//  Created by 伊藤祐哉 on 2021/12/10.
//

import UIKit
import Charts
import NCMB

class FifthViewController: UIViewController {

    var chartView: LineChartView!
    var chartDataSet: LineChartDataSet!
    // グラフにするデータ
    // データベースから[日付: 体重]の形で取ってきて日付をxValueに入れたらいけるかも
    let Data = [88.0, 99.0, 93.0, 67.0, 45.0, 72.0, 58.0, 91.0, 81.0, 60, 40]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // データを取得
        let data = getData()
        //グラフを表示
        displayChart(data: data)
    }
    
    func getData() -> Dictionary<Date,Double> {
        
        var dataArray:Dictionary<Date,Double> = [:]
        //testクラスを検索するNCMBQueryを作成
        var query : NCMBQuery<NCMBObject> = NCMBQuery.getQuery(className: "results")
        //fieldCが42と一致するデータを検索する条件を設定
        query.where(field: "user_id", equalTo: 1)

        // 検索を行う
        query.findInBackground(callback: { result in
            switch result {
                case let .success(array):
                    print("取得に成功しました 件数: \(array.count)")
                    array.forEach {
                        let data01 = $0 as! NCMBObject
                        let date: Date? = data01["date"]
                        let weight: Double? = data01["weight"]
                        dataArray[date!] = weight!
                    }
                
                case let .failure(error):
                    print("取得に失敗しました: \(error)")
            }
        })
        return dataArray
    }
    
    func displayChart(data: Dictionary<Date,Double>) {
        // グラフの範囲を指定する
        chartView = LineChartView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 400))
        // プロットデータ(y軸)を保持する配列
        var dataEntries = [ChartDataEntry]()

        for (key, value) in data.enumerated() {
            print("------")
            print(key)
            print(value)
//            let dataEntry = ChartDataEntry(x: Date(key), y: Double(value))
//            dataEntries.append(dataEntry)
        }
        // グラフにデータを適用
        chartDataSet = LineChartDataSet(entries: dataEntries, label: "DataChart")

        chartView.data = LineChartData(dataSet: chartDataSet)

        // X軸(xAxis)
        chartView.xAxis.labelPosition = .bottom // x軸ラベルをグラフの下に表示する

        // Y軸(leftAxis/rightAxis)
        chartView.leftAxis.axisMaximum = 100 //y左軸最大値
        chartView.leftAxis.axisMinimum = 0 // y左軸最小値
        chartView.leftAxis.labelCount = 10 // y軸ラベルの数
        chartView.rightAxis.enabled = false // 右側の縦軸ラベルを非表示

        view.addSubview(chartView)

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
