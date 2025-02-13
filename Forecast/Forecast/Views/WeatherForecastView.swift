//
//  WeatherForecastView.swift
//  Forecast
//
//  Created by Renan Diniz on 13/02/25.
//
import SwiftUI

struct WeatherForecastView: View {
    @StateObject private var viewModel = WeatherForecastViewModel()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                // Title
                Text("Weather Forecast")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom)

                // Location Section
                HStack {
                    Text("Location")
                        .font(.headline)

                    Spacer()

                    Text(viewModel.cityName)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke())
                }

                // Weather List
                List(viewModel.weatherData) { forecast in
                    WeatherListItemView(forecast: forecast)
                        .listRowInsets(EdgeInsets()) // Remove default padding
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())

                Spacer()
            }
            .padding()
        }
        .task {
            await viewModel.fetchWeather()
        }
    }
}
