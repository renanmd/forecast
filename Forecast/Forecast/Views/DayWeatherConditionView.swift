import SwiftUI

struct DayWeatherConditionView: View {
    let dayHighTemp: String
    let dayCondition: String
    let subtitleDayHighTemp: String
    let dayLowTemperature: String
    let subtitleDayLowTemp: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(dayCondition).font(.headline)
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text(dayHighTemp).font(.title)
                    Text(subtitleDayHighTemp).font(.caption).foregroundColor(.gray)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text(dayLowTemperature).font(.title3)
                    Text(subtitleDayLowTemp).font(.caption).foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1).background(RoundedRectangle(cornerRadius: 10).fill(Color.white)))
        .padding(.vertical, 8)
    }
}
