//
//  WeatherDetailItemView.swift
//  Forecast
//
//  Created by Renan Diniz on 13/02/25.
//


import SwiftUI

struct WeatherDetailItemView: View {
    let title: String
    let leftDetail: String?
    let leftSubDetail: String?
    let rightDetail: String?
    let rightSubDetail: String?
    var showProgressBar: Bool = false
    var progress: Double = 0.0
    var showCompass: Bool = false
    var windDirection: String? = nil
    var showSunGraph: Bool = false
    var sunrise: String? = nil
    var sunset: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline)

            if let leftDetail = leftDetail {
                HStack {
                    VStack(alignment: .leading) {
                        Text(leftDetail).font(.title3)
                        if let leftSubDetail = leftSubDetail {
                            Text(leftSubDetail).font(.caption).foregroundColor(.gray)
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text(leftDetail).font(.title3)
                        if let rightDetail = rightDetail {
                            Text(rightDetail).font(.title3)
                        }
                        if let leftSubDetail = leftSubDetail {
                            Text(leftSubDetail).font(.caption).foregroundColor(.gray)
                        }
                    }
                }
            }

            if showProgressBar {
                ProgressView(value: progress)
                    .progressViewStyle(LinearProgressViewStyle())
            }

            if showCompass {
                CompassView(direction: windDirection ?? "N")
            }

            if showSunGraph {
                SunPositionGraphView(sunrise: sunrise ?? "", sunset: sunset ?? "")
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1).background(RoundedRectangle(cornerRadius: 10).fill(Color.white)))
        .padding(.vertical, 8)
    }
}
