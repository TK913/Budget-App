//
//  ExpensesView.swift
//  Loginscreen
//
//  Created by Niyati Sanghrajka on 11/27/23.
//
import SwiftUI

struct ExpenseView: View {
    @State private var income: Double = getIncome(userID)
    @State private var totalSpent: Double = 0
    @State private var expenses: [Expense] = []

    @State private var isAddingExpense = false
    @State private var newExpenseTitle = ""
    @State private var newExpenseTotalAmount = ""
    @State private var selectedCategory = "Housing"

    var categories = ["Housing", "Transportation", "Food", "Utilities", "Healthcare", "Savings", "Personal", "Entertainment", "Other"]

    var body: some View {
        VStack {
            Text("EXPENSES")
                .font(.body)

            Text("You Spent: $\(totalSpent, specifier: "%.2f")")
                .font(.title)
                .padding(.top, 20)

            ZStack {
                Circle()
                    .stroke(lineWidth: 10)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(totalSpent / income, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.blue)
                    .rotationEffect(.degrees(-90))
            }
            .frame(width: 150, height: 150)

            ForEach(expenses.indices, id: \.self) { index in
                ExpenseListView(expense: $expenses[index])
            }

            if isAddingExpense {
                VStack {
                    TextField("New Expense Title", text: $newExpenseTitle)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)

                    TextField("Total Amount", text: $newExpenseTotalAmount)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)

                    Picker("Category", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()

                    HStack {
                        Button(action: {
                            if let totalAmount = Double(newExpenseTotalAmount) {
                                let newExpense = Expense(title: newExpenseTitle, totalAmount: totalAmount, category: selectedCategory)
                                expenses.append(newExpense)
                                totalSpent += totalAmount

                                let databaseManager = DatabaseManager()
                                databaseManager.insertNewExpense(price: totalAmount, category: selectedCategory, userID: 1)

                                isAddingExpense = false
                                newExpenseTitle = ""
                                newExpenseTotalAmount = ""
                                selectedCategory = "Housing"
                            }
                        }) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.green)
                                .padding()
                        }

                        Button(action: {
                            isAddingExpense = false
                            newExpenseTitle = ""
                            newExpenseTotalAmount = ""
                            selectedCategory = "Housing"
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
                isAddingExpense.toggle()
            }) {
                Text("Add Expense")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}

struct ExpenseListView: View {
    @Binding var expense: Expense

    var body: some View {
        VStack {
            HStack {
                Text(expense.title)
                    .font(.headline)

                Text(expense.category)
                    .font(.caption)

                Spacer()
            }
        }
        .padding(10)
    }
}

struct Expense: Identifiable {
    var id = UUID()
    var title: String
    var totalAmount: Double
    var category: String
}

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseView()
    }
}

