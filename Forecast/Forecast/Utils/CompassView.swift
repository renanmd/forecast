//
//  CompassView.swift
//  Forecast
//
//  Created by Renan Diniz on 13/02/25.
//


import SwiftUI

struct CompassView: View {
    let direction: String

    var body: some View {
        VStack {
            Image(systemName: "location.north.fill")
                .rotationEffect(.degrees(45)) // Mocked rotation for NE
                .font(.largeTitle)
                .foregroundColor(.blue)

            Text(direction).font(.caption).padding(.top, 4)
        }
    }
}
