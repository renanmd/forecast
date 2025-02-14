import SwiftUI

struct DetailedWeatherView: View {
    @StateObject var viewModel: DetailedWeatherViewModel

    var body: some View {
        NavigationView {
            VStack {
                List {
                    DayWeatherConditionView(
                        dayHighTemp: "21C",
                        dayCondition: viewModel.weatherCondition,
                        subtitleDayHighTemp: "High value",
                        dayLowTemperature: "10C",
                        subtitleDayLowTemp: "Low value"
                    )
                    .listRowSeparator(
                        .hidden
                    )
                    
                    ProbabilityRainView(probabilityRain: 9, averageHumidity: 75)
                        .listRowSeparator(.hidden)
                    
                    WindSpeedView(windSpeed: 16, windDirection: "NE")
                        .listRowSeparator(.hidden)
                    
                    UVVisibilityAirPressureVIew(uvIndex: 7, visibility: 927, airPressure: 1024)
                        .listRowSeparator(.hidden)
                    
                    SunPositionView(sunRiseTime: "06:44", sunSetTime: "19:14", currentTime: 13)
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitle(viewModel.dayOfWeek, displayMode: .inline)
            .navigationBarBackButtonHidden(false)
            .padding()
        }
    }
}
