//
//  SavingsView.swift
//  Loginscreen
//
//  Created by Niyati Sanghrajka on 11/5/23.
//

import SwiftUI
import SwiftData

struct SavingsView: View {
    @State private var savedAmount: Double = 1300
    @State private var goals: [Goal] = [
        Goal(title: "Emergency", savedAmount: 500, totalAmount: 1000),
        Goal(title: "New Car", savedAmount: 800, totalAmount: 1500),
    ]
    
    @State private var isAddingGoal = false
    @State private var newGoalTitle = ""
    @State private var newGoalTotalAmount = ""
    
    var body: some View {
        VStack {
            Text("SAVINGS")
                .font(.body)
            Text("You saved: $\(savedAmount, specifier: "%.2f")")
                .font(.title)
                .padding(.top, 20)
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 10)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(savedAmount / 2500, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.blue)
                    .rotationEffect(.degrees(-90))
                
                Text("\(Int(savedAmount / 2500 * 100))%")
                    .font(.title)
            }
            .frame(width: 150, height: 150)
            
            ForEach(goals.indices, id: \.self) { index in
                SavingsGoalView(goal: $goals[index])
            }
            if isAddingGoal {
                HStack {
                    TextField("New Goal Title", text: $newGoalTitle)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    TextField("Total Amount", text: $newGoalTotalAmount)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    Button(action: {
                        // Save the new goal
                        if let totalAmount = Double(newGoalTotalAmount) {
                            goals.append(Goal(title: newGoalTitle, savedAmount: 0, totalAmount: totalAmount))
                            isAddingGoal = false
                            newGoalTitle = ""
                            newGoalTotalAmount = ""
                        }
                    }) {
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                            .padding()
                    }
                    
                    Button(action: {
                        isAddingGoal = false
                        newGoalTitle = ""
                        newGoalTotalAmount = ""
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .padding()
                    }
                }
                .background(Color.blue.opacity(0.2))
                .cornerRadius(10)
                .padding()
            }
            
            Button(action: {
                isAddingGoal.toggle()
            }) {
                Text("Add Goal")
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
        @Binding var goal: Goal
        
        var body: some View {
            VStack {
                HStack {
                    Text(goal.title)
                        .font(.headline)
                    Spacer()
                    Text("$\(goal.savedAmount, specifier: "%.2f") / $\(goal.totalAmount, specifier: "%.2f")")
                        .font(.subheadline)
                }
                ZStack(alignment: .bottomLeading){
                    RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .frame(width: 300, height: 20)
                        .foregroundColor(Color.blue.opacity(0.1))
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .frame(width: goal.savedAmount/goal.totalAmount * 300, height: 20)
                        .foregroundColor(Color.blue
                            //LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .leading, endPoint: .trailing)
                                //.clipShape(RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                        )
                }
                .frame(height: 10)
                Text("\(Int(goal.savedAmount / goal.totalAmount * 100))%")
                    .font(.caption)
            }
            .padding(10)
        }
    }
    
    struct Goal: Identifiable {
        var id = UUID()
        var title: String
        var savedAmount: Double
        var totalAmount: Double
    }
#Preview {
    SavingsView()
}

