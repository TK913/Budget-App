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
            
            Spacer() // Push the button to the bottom of the screen
            
            Button(action: {
                // Add a new goal with default values
                goals.append(Goal(title: "New Goal", savedAmount: 0, totalAmount: 100))
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
    
    
    /*import SwiftUI
     
     struct ContentView: View {
     @State private var savedAmount: Double = 1000
     @State private var goals: [Goal] = [
     Goal(title: "Emergency", savedAmount: 500, totalAmount: 1000),
     Goal(title: "New Car", savedAmount: 800, totalAmount: 1500),
     Goal(title: "Vacation", savedAmount: 200, totalAmount: 800)
     ]
     
     @State private var isAddingGoal = false
     @State private var newGoalName = ""
     @State private var newGoalTotalAmount = ""
     
     var body: some View {
     #if os(macOS)
     return makeMacBody()
     #else
     return makeIOSBody()
     #endif
     }
     
     #if os(macOS)
     func makeMacBody() -> some View {
     NavigationView {
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
     .trim(from: 0.0, to: CGFloat(min(savedAmount / 1000, 1.0)))
     .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
     .foregroundColor(Color.blue)
     .rotationEffect(.degrees(-90))
     
     Text("\(Int(savedAmount / 1000 * 100))%")
     .font(.title)
     }
     .frame(width: 150, height: 150)
     
     List {
     ForEach(goals.indices, id: \.self) { index in
     NavigationLink(destination: GoalEditView(goal: $goals[index])) {
     SavingsGoalView(goal: $goals[index])
     }
     }
     }
     
     Spacer() // Push the button to the bottom of the screen
     }
     .navigationTitle("Savings Goals")
     .toolbar {
     Button(action: {
     isAddingGoal = true
     }) {
     Text("Add Goal")
     }
     }
     .sheet(isPresented: $isAddingGoal) {
     NewGoalView(goals: $goals, newGoalName: $newGoalName, newGoalTotalAmount: $newGoalTotalAmount)
     }
     }
     }
     #endif
     
     func makeIOSBody() -> some View {
     NavigationView {
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
     .trim(from: 0.0, to: CGFloat(min(savedAmount / 1000, 1.0)))
     .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
     .foregroundColor(Color.blue)
     .rotationEffect(.degrees(-90))
     
     Text("\(Int(savedAmount / 1000 * 100))%")
     .font(.title)
     }
     .frame(width: 150, height: 150)
     
     List {
     ForEach(goals.indices, id: \.self) { index in
     NavigationLink(destination: GoalEditView(goal: $goals[index])) {
     SavingsGoalView(goal: $goals[index])
     }
     }
     }
     
     Spacer() // Push the button to the bottom of the screen
     }
     .navigationBarTitle("Savings Goals")
     .navigationBarItems(trailing: Button(action: {
     isAddingGoal = true
     }) {
     Text("Add Goal")
     .font(.headline)
     .foregroundColor(.white)
     .padding()
     .background(Color.blue)
     .cornerRadius(10)
     }
     .sheet(isPresented: $isAddingGoal) {
     NewGoalView(goals: $goals, newGoalName: $newGoalName, newGoalTotalAmount: $newGoalTotalAmount)
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
     ZStack {
     GeometryReader { geometry in
     Rectangle()
     .frame(width: geometry.size.width, height: 10)
     .foregroundColor(Color.blue)
     
     Rectangle()
     .frame(width: geometry.size.width, height: 10)
     .opacity(0.3)
     .foregroundColor(.gray)
     }
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
     
     struct GoalEditView: View {
     @Binding var goal: Goal
     
     var body: some View {
     Form {
     Section {
     TextField("Goal Name", text: $goal.title)
     TextField("Total Amount", text: $goal.totalAmount)
     .keyboardType(.decimalPad)
     }
     
     Button(action: {
     // Handle the save action
     }) {
     Text("Save Goal")
     }
     }
     .navigationTitle("Edit Goal")
     }
     }
     
     struct NewGoalView: View {
     @Binding var goals: [Goal]
     @Binding var newGoalName: String
     @Binding var newGoalTotalAmount: String
     
     var body: some View {
     Form {
     Section {
     TextField("Goal Name", text: $newGoalName)
     TextField("Total Amount", text: $newGoalTotalAmount)
     .keyboardType(.decimalPad)
     }
     
     Button(action: {
     if let totalAmount = Double(newGoalTotalAmount) {
     goals.append(Goal(title: newGoalName, savedAmount: 0, totalAmount: totalAmount))
     newGoalName = ""
     newGoalTotalAmount = ""
     }
     }) {
     Text("Add Goal")
     }
     }
     .navigationTitle("New Goal")
     }
     }*/
    
#Preview {
    SavingsView()
}

