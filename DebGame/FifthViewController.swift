//
//  FifthViewController.swift
//  DebGame
//
//  Created by 伊藤祐哉 on 2021/12/10.
//

import UIKit
import Charts

class FifthViewController: UIViewController {

    var chartView: LineChartView!
    var chartDataSet: LineChartDataSet!
    // グラフにするデータ
    // データベースから[日付: 体重]の形で取ってきて日付をxValueに入れたらいけるかも
    let Data = [88.0, 99.0, 93.0, 67.0, 45.0, 72.0, 58.0, 91.0, 81.0, 60, 40]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //グラフを表示
        displayChart(data: Data)
    }
    
    func displayChart(data: [Double]) {
        // グラフの範囲を指定する
        chartView = LineChartView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 400))
        // プロットデータ(y軸)を保持する配列
        var dataEntries = [ChartDataEntry]()
        
        for (xValue, yVlaue) in data.enumerated() {
            let dataEntry = ChartDataEntry(x: Double(xValue), y: yVlaue)
            dataEntries.append(dataEntry)
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
