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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        struct getData {
            var date: Date
            var weight: Double

            init(date: Date, weight: Double) {
                self.date = date
                self.weight = weight
            }
        }
         
        var Data = [getData]()
    
        //testクラスを検索するNCMBQueryを作成
        var query : NCMBQuery<NCMBObject> = NCMBQuery.getQuery(className: "results")
        query.where(field: "user_id", equalTo: 1)

        // 検索を行う
        query.findInBackground(callback: { result in
            switch result {
                case let .success(array):
                    print("取得に成功しました 件数: \(array.count)")
                    array.forEach {
                        let data01 = $0 as! NCMBObject
                        let dateData: Date? = data01["date"]
                        let weightData: Double? = data01["weight"]
                        Data.append(getData(date: dateData!, weight: weightData!))
                    }
                
                case let .failure(error):
                    print("取得に失敗しました: \(error)")
            }
        })
        
        // グラフの範囲を指定する
        chartView = LineChartView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 400))
        // プロットデータ(y軸)を保持する配列
        let dataEntries = [ChartDataEntry]()

        
        Data.forEach { data in
            print("-----")
            print(data.weight)
//            let dataEntry = ChartDataEntry(x: Date(data.date) , y: Double(data.weight) ?? 0.0)
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
