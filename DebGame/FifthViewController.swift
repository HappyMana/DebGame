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
        
        view.backgroundColor = UIColor.black

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
                        print(dateData!)
                        print(weightData!)
                        Data.append(getData(date: dateData!, weight: weightData!))
                    }
                    
                    // グラフの範囲を指定する
                    self.chartView = LineChartView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: 400))
                    // プロットデータ(y軸)を保持する配列
                    var dataEntries = [ChartDataEntry]()
                    Data.enumerated().forEach ({ index, data in
                        let dataEntry = ChartDataEntry(x: Double(index) , y: Double(data.weight) ?? 0.0)
                        dataEntries.append(dataEntry)
                    })
                    // グラフにデータを適用
                    self.chartDataSet = LineChartDataSet(entries: dataEntries, label: "体重")

                    self.chartView.data = LineChartData(dataSet: self.chartDataSet)

                    // X軸(xAxis)
                    self.chartView.xAxis.labelPosition = .bottom // x軸ラベルをグラフの下に表示する
                    let formatter = ChartFormatter(date:Data.map{$0.date})
                    self.chartView.xAxis.valueFormatter = formatter
                        //labelCountはChartDataEntryと同じ数だけ入れます。
                    self.chartView.xAxis.labelCount = 12
                        //granularityは1.0で固定
                    self.chartView.xAxis.granularity = 1.0
                    self.chartView.xAxis.axisLineColor = UIColor.white
                    self.chartView.xAxis.labelTextColor = UIColor.white
                
                    // Y軸(leftAxis/rightAxis)
                    self.chartView.leftAxis.axisMaximum = 100 //y左軸最大値
                    self.chartView.leftAxis.axisMinimum = 0 // y左軸最小値
                    self.chartView.leftAxis.labelCount = 10 // y軸ラベルの数
                    self.chartView.rightAxis.enabled = false // 右側の縦軸ラベルを非表示
                    let ll = ChartLimitLine(limit: 80, label: "目標")
                    self.chartView.rightAxis.addLimitLine(ll)
                    self.chartView.leftAxis.zeroLineColor = UIColor.white
                    self.chartView.leftAxis.axisLineColor = UIColor.white
                    self.chartView.leftAxis.labelTextColor = UIColor.white
                    self.view.addSubview(self.chartView)
                
                    
                case let .failure(error):
                    print("取得に失敗しました: \(error)")
            }
        })
        
        class ChartFormatter: NSObject, IAxisValueFormatter {
            init( date: [Date]) {
                self.date = date
            }
            let date: [Date]
            

            func stringForValue(_ value: Double, axis: AxisBase?) -> String {
                //granularityを１.０、labelCountを１２にしているおかげで引数のvalueは1.0, 2.0, 3.0・・・１１.０となります。
                let index = Int(value)
                let df = DateFormatter()
                df.dateFormat = "MM-dd"
                return df.string(from: date[index])
            }

        }
        
//        // グラフの範囲を指定する
//        chartView = LineChartView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 400))
//        // プロットデータ(y軸)を保持する配列
//        var dataEntries = [ChartDataEntry]()
//
//
////        Data.enumerated().forEach ({ index, data in
////            print("-----")
////            print(data.date)
////            let dataEntry = ChartDataEntry(x: Double(index) , y: Double(data.weight) ?? 0.0)
////            dataEntries.append(dataEntry)
////        })
//
////        chartView.xAxis.valueFormatter = DateAxisValueFormatter(dates)
//
//        // グラフにデータを適用
//        chartDataSet = LineChartDataSet(entries: dataEntries, label: "DataChart")
//
//        chartView.data = LineChartData(dataSet: chartDataSet)
//
//        // X軸(xAxis)
//        chartView.xAxis.labelPosition = .bottom // x軸ラベルをグラフの下に表示する
//
//        // Y軸(leftAxis/rightAxis)
//        chartView.leftAxis.axisMaximum = 100 //y左軸最大値
//        chartView.leftAxis.axisMinimum = 0 // y左軸最小値
//        chartView.leftAxis.labelCount = 10 // y軸ラベルの数
//        chartView.rightAxis.enabled = false // 右側の縦軸ラベルを非表示
//
//        view.addSubview(chartView)
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
