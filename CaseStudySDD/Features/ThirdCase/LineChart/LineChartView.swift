//
//  LineChartView.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import SwiftUI
import Charts

struct LinePortofolio: Identifiable {
    let id = UUID().uuidString
    let month: String
    let amount: Int
}

struct LineChartView: View {
    let data: [Int: Int]
    @State private var list: [LinePortofolio] = []

    var body: some View {
        VStack {
            GroupBox ( "Line Chart") {
                Chart {
                    ForEach(list) { steps in
                        LineMark(
                            x: .value("Month", steps.month),
                            y: .value("Amount", steps.amount)
                        )
                    }
                }
                .frame(height:400)
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            let sortedList = data.sorted { $0.key < $1.key }
            list = sortedList.compactMap { LinePortofolio(month: DateFormatter().shortMonthSymbols[$0.key - 1], amount: $0.value) }
        }
    }
}
