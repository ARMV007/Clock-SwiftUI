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
                    Circle().stroke(Color.black, lineWidth: 10)
                )
                .frame(width: 300, height: 300)
        }
    }
}
