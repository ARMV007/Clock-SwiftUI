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
                    .frame(width: 5, height: 20)
                    .offset(y: -150 + 10)
                    .rotationEffect(.degrees(Double(i) * 30))
            }
        }
    }
}
