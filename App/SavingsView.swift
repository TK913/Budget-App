//
//  SavingsView.swift
//  Loginscreen
//
//  Created by Niyati Sanghrajka on 11/5/23.
//
import SwiftUI

struct SavingsView: View {
    @State private var savedAmount: Double = 0
    @State private var goals: [Goal] = []

    @State private var isAddingGoal = false
    @State private var newGoalTitle = ""
    @State private var newGoalTotalAmount = ""

    private let databaseManager = DatabaseManager()
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
                VStack {
                    TextField("New Goal Title", text: $newGoalTitle)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                        .padding()

                    TextField("Total Amount", text: $newGoalTotalAmount)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                        .padding()

                    HStack {
                        Button(action: {
                            if let totalAmount = Double(newGoalTotalAmount) {
                                if let userID = UserDefaults.standard.value(forKey: "userID") as? Int {
                                    if let insertedID = databaseManager.insertNewSavingsGoal(goal: 0, totalAmount: totalAmount, userID: userID) {
                                            goals.append(Goal(id: insertedID, title: newGoalTitle, savedAmount: 0, totalAmount: totalAmount))
                                            isAddingGoal = false
                                            newGoalTitle = ""
                                            newGoalTotalAmount = ""
                                    }
                                }
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
        .padding()
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
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 300, height: 20)
                    .foregroundColor(Color.blue.opacity(0.1))
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: goal.savedAmount/goal.totalAmount * 300, height: 20)
                    .foregroundColor(Color.blue)
            }
            .frame(height: 10)
            Text("\(Int(goal.savedAmount / goal.totalAmount * 100))%")
                .font(.caption)
        }
        .padding(10)
        .onAppear {
            if let userID = UserDefaults.standard.value(forKey: "userID") as? Int {
                goals = databaseManager.getSavingsGoalsForUser(userID: userID)
            }
        }
    }
}

struct Goal: Identifiable {
    var id = UUID()
    var title: String
    var savedAmount: Double
    var totalAmount: Double
}

struct SavingsView_Previews: PreviewProvider {
    static var previews: some View {
        SavingsView()
    }
}
