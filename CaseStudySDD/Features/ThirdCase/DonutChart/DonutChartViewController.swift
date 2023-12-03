//
//  DonutChartViewController.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit
import DGCharts

final class DonutChartViewController: UIViewController, DonutChartPresenterOutput, ChartViewDelegate {
    // MARK: - IBOutlets
    @IBOutlet weak var donutChartView: PieChartView!

    // MARK: - Variables
    var input: DonutChartInteractorInput?
    var router: DonutChartRoutingDelegate?
    
    private var data: [DonutChart.TransactionData] = []
    
    // MARK: - Initalizer
    init(_ data: [DonutChart.TransactionData]) {
        super.init(nibName: nil, bundle: nil)
        self.data = data
        DonutChartConfigurator.configure(viewController: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        DonutChartConfigurator.configure(viewController: self)
    }

  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Donut Chart"
    donutChartView.delegate = self
    customizeChart(dataPoints: data.map{ $0.label }, values: data.map{ Double($0.percentage) ?? 0.0 })
  }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let image = UIImage(systemName: "chevron.left")
        let backButton = UIBarButtonItem(
            image: image,
            style: .plain,
            target: self,
            action: #selector(didTapBack)
        )
        setupCustomNavbar(backButton: backButton, showBottomHairline: true)
    }
    
    @objc private func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Methods
    func customizeChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0 ..< dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
        }
    
        let donutChartDataSet = PieChartDataSet(entries: dataEntries, label: "")
        donutChartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)

        let donutChartData = PieChartData(dataSet: donutChartDataSet)
        donutChartView.data = donutChartData
        
        let format = NumberFormatter()
        format.numberStyle = .percent
        format.maximumFractionDigits = 2
        format.multiplier = 1.0
        format.percentSymbol = "%"
        format.zeroSymbol = ""
        let formatter = DefaultValueFormatter(formatter: format)
        donutChartData.setValueFormatter(formatter)
    }
    
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
        var colors: [UIColor] = []
        for _ in 0 ..< numbersOfColor {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        return colors
    }
    
    // MARK: - Delegate
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        if let dataSet = chartView.data?.dataSets[highlight.dataSetIndex] {
            let sliceIndex: Int = dataSet.entryIndex( entry: entry)
            let item = data[sliceIndex]
            router?.openTransactionHistoryPage(trxTitle: item.label, list: item.data)
        }
    }
}
