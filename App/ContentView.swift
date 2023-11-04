//
//  ContentView.swift
//  savingsmodule
//
//  Created by Niyati Sanghrajka on 11/2/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    let emergencySavings: Double = 500
    let carSavings: Double = 800
    let vacationSavings: Double = 200
    let savedAmount: Double = 1500

    var body: some View {
        VStack {
            Text("You saved: $\(savedAmount, specifier: "%.2f")")
                .font(.title)
                .padding(.top, 20)

            ZStack {
                Circle()
                    .stroke(lineWidth: 10)
                    .opacity(0.3)
                    .foregroundColor(.gray)

                Circle()
                    .trim(from: 0.0, to: CGFloat(min(savedAmount / 3300, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.blue)
                    .rotationEffect(.degrees(-90))

                Text("\(Int(savedAmount / 3300 * 100))%")
                    .font(.title)
            }
            .frame(width: 150, height: 150)

            SavingsGoalView(title: "Emergency", savedAmount: emergencySavings, totalAmount: 1000)
            SavingsGoalView(title: "New Car", savedAmount: carSavings, totalAmount: 1500)
            SavingsGoalView(title: "Vacation", savedAmount: vacationSavings, totalAmount: 800)
            
            Button(action: {
            // Handle the action for adding a new goal
            }) {
                Text("New Goal")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}

struct SavingsGoalView: View {
    var title: String
    var savedAmount: Double
    var totalAmount: Double

    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                Text("$\(savedAmount, specifier: "%.2f") / $\(totalAmount, specifier: "%.2f")")
                    .font(.subheadline)
            }
            ZStack(alignment: .bottomLeading){
                RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .frame(width: 200, height: 20)
                    .foregroundColor(Color.black.opacity(0.1))
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 100, height: 20)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.1)]), startPoint: .leading, endPoint: .trailing)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                    )
            }
            .frame(height: 10)
            Text("\(Int(savedAmount / totalAmount * 100))%")
                .font(.caption)
        }
        .padding(10)
    }
}

    struct SavingsModule: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
