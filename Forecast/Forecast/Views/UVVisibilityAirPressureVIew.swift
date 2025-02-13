//
//  UVVisibilityAirPressureVIew.swift
//  Forecast
//
//  Created by Renan Diniz on 13/02/25.
//

import SwiftUI

struct UVVisibilityAirPressureVIew: View {
    let uvIndex: Int
    let visibility: Int
    let airPressure: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Maximum UV Index")
                    .font(.caption)
                Spacer()
                Text("\(uvIndex)")
                    .font(.caption)
            }
            HStack {
                Text("Average visibility")
                    .font(.caption)
                Spacer()
                Text("\(visibility) m")
                    .font(.caption)
            }
            
            HStack {
                Text("Average air Pressure")
                    .font(.caption)
                Spacer()
                Text("\(airPressure) mbar")
                    .font(.caption)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1).background(RoundedRectangle(cornerRadius: 10).fill(Color.white)))
        .padding(.vertical, 8)
    }
}
