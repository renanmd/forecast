import SwiftUI

struct SunPositionView: View {
    let sunRiseTime: String
    let sunSetTime: String
    let currentTime: Double // Current time in 24-hour format, e.g., 14.5 for 2:30 PM
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Sun position")
                .font(.caption)
            
            // Sun Position Graph
            GeometryReader { geometry in
                ZStack {
                    // Base line
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: geometry.size.height / 2))
                        path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height / 2))
                    }
                    .stroke(Color.gray, lineWidth: 2)
                    
                    // Sun curve (parabolic path)
                    Path { path in
                        let width = geometry.size.width
                        let height = geometry.size.height
                        
                        path.move(to: CGPoint(x: 0, y: height / 2))
                        path.addQuadCurve(to: CGPoint(x: width, y: height / 2), control: CGPoint(x: width / 2, y: 0))
                    }
                    .stroke(Color.orange, lineWidth: 3)
                    
                    // Marker for current time
                    let position = geometry.size.width * CGFloat(currentTime / 24.0)
                    Circle()
                        .fill(Color.yellow)
                        .frame(width: 10, height: 10)
                        .position(x: position, y: geometry.size.height / 2 - 20)
                }
            }
            .frame(height: 100)
            
            HStack {
                VStack {
                    Text("Sunrise")
                        .font(.caption)
                    Text("\(sunRiseTime) Uhr")
                        .font(.caption)
                }
                Spacer()
                VStack {
                    Text("Sunset")
                        .font(.caption)
                    Text("\(sunSetTime) Uhr")
                        .font(.caption)
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1).background(RoundedRectangle(cornerRadius: 10).fill(Color.white)))
        .padding(.vertical, 8)
    }
}
