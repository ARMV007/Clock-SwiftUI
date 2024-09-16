//
//  ContentView.swift
//  Clock-SwiftUI
//
//  Created by Abhishek  on 17/09/24.
//
import SwiftUI

struct ContentView: View {
    @State private var currentDate = Date()
    @State private var totalSeconds: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            let clockSize = min(geometry.size.width, geometry.size.height) * 0.8
            
            ZStack {
                // Clock background
                Circle()
                    .fill(Color.white)
                    .overlay(
                        Circle().stroke(Color.black, lineWidth: 4)
                    )
                    .frame(width: clockSize, height: clockSize)
                
                // Hour Marks with rounded corners
                ForEach(0..<12) { i in
                    RoundedRectangle(cornerRadius: clockSize * 0.005)
                        .fill(Color.black)
                        .frame(width: clockSize * 0.01, height: clockSize * 0.1)
                        .offset(y: -clockSize / 2 + clockSize * 0.05)
                        .rotationEffect(.degrees(Double(i) * 30))
                }
                
                // Hour hand with rounded corners
               HandView(width: clockSize * 0.02, height: clockSize * 0.3, cornerRadius: clockSize * 0.01)
                   .rotationEffect(.degrees(hourHandAngle(for: currentDate)))
                   .animation(.linear(duration: 0.5), value: currentDate)
               
               // Minute hand with rounded corners
               HandView(width: clockSize * 0.015, height: clockSize * 0.4, cornerRadius: clockSize * 0.01)
                   .rotationEffect(.degrees(minuteHandAngle(for: currentDate)))
                   .animation(.linear(duration: 0.5), value: currentDate)
               
               // Second hand with rounded corners
               HandView(width: clockSize * 0.005, height: clockSize * 0.45, color: .red, cornerRadius: clockSize * 0.0025)
                   .rotationEffect(.degrees(secondHandAngle()))
                   .animation(.linear(duration: 0.5), value: totalSeconds)
             

            }
            .onAppear(perform: startTimer)
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)

        }
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.currentDate = Date()
            totalSeconds+=1
        }
    }
    
    func hourHandAngle(for date: Date) -> Double {
        let calendar = Calendar.current
        let hour = Double(calendar.component(.hour, from: date) % 12)
        let minute = Double(calendar.component(.minute, from: date))
        return (hour + minute / 60) * 30 // 360 degrees / 12 hours = 30 degrees per hour
    }
    
    func minuteHandAngle(for date: Date) -> Double {
        let calendar = Calendar.current
        let minute = Double(calendar.component(.minute, from: date))
        return minute * 6 // 360 degrees / 60 minutes = 6 degrees per minute
    }
    
    func secondHandAngle() -> Double {
        return Double(totalSeconds % 60) * 6 // 360 degrees / 60 seconds = 6 degrees per second
    }
}


struct HandView: View {
    var width: CGFloat
    var height: CGFloat
    var color: Color = .black
    var cornerRadius: CGFloat

    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(color)
            .frame(width: width, height: height)
            .offset(y: -height / 2)
    }
}
