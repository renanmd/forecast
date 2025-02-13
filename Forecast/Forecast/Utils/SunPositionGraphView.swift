//
//  SunPositionGraphView.swift
//  Forecast
//
//  Created by Renan Diniz on 13/02/25.
//


import SwiftUI

struct SunPositionGraphView: View {
    let sunrise: String
    let sunset: String

    var body: some View {
        VStack {
            // Mocked line graph
            GeometryReader { geometry in
                Path { path in
                    let width = geometry.size.width
                    let height = geometry.size.height
                    path.move(to: CGPoint(x: 0, y: height))
                    path.addCurve(to: CGPoint(x: width, y: height), control1: CGPoint(x: width / 3, y: 0), control2: CGPoint(x: 2 * width / 3, y: 0))
                }
                .stroke(Color.orange, lineWidth: 2)
            }
            .frame(height: 100)

            HStack {
                VStack {
                    Text("Sunrise").font(.caption)
                    Text(sunrise).font(.footnote)
                }
                Spacer()
                VStack {
                    Text("Sunset").font(.caption)
                    Text(sunset).font(.footnote)
                }
            }
            .padding(.top, 8)
        }
    }
}
