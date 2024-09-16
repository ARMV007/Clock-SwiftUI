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
        ZStack {
            // Clock background
            Circle()
                .fill(Color.white)
                .overlay(
                    Circle().stroke(Color.black, lineWidth: 4)
                )
                .frame(width: 300, height: 300)
            
            // Hour Marks
            ForEach(0..<12) { i in
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 2, height: 20)
                    .offset(y: -150 + 10)
                    .rotationEffect(.degrees(Double(i) * 30))
            }
            
            // Hour hand
            HandView(width: 6, height: 80)
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
