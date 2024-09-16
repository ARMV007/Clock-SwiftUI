//
//  ContentView.swift
//  Clock-SwiftUI
//
//  Created by Abhishek  on 17/09/24.
//
import SwiftUI

struct ContentView: View {
    @State private var currentDate = Date()
    
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
                
                // Hour Marks
                ForEach(0..<12) { i in
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: clockSize * 0.01, height: clockSize * 0.1)
                        .offset(y: -clockSize / 2 + clockSize * 0.05)
                        .rotationEffect(.degrees(Double(i) * 30))
                }
                
                // Hour hand
                HandView(width: clockSize * 0.02, height: clockSize * 0.3)
            }
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)

        }
    }
}

struct HandView: View {
    var width: CGFloat
    var height: CGFloat
    var color: Color = .black

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: width, height: height)
            .offset(y: -height / 2)
    }
}
