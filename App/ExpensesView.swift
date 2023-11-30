//
//  ExpensesView.swift
//  Loginscreen
//
//  Created by Niyati Sanghrajka on 11/27/23.
//

import SwiftUI
import SwiftData

struct ExpenseView: View {
    @State private var totalAmount: Double = 1300
    @State private var expenses: [Expense] = []
    
    @State private var isAddingExpense = false
    @State private var newExpenseTitle = ""
    @State private var newExpenseTotalAmount = ""
    
    var body: some View {
        VStack {
            Text("EXPENSES")
                .font(.body)
            Text("You spent: $\(totalAmount, specifier: "%.2f")")
                .font(.title)
                .padding(.top, 20)
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 10)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                
            }
            .frame(width: 150, height: 150)
            
            ForEach(expenses.indices, id: \.self) { index in
                ExpenseListView(expense: $expenses[index])
            }
            
            // New goal creation box
            if isAddingExpense {
                HStack {
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
                    
                    Button(action: {
                        // Save the new goal
                        if let totalAmount = Double(newExpenseTotalAmount) {
                            expenses.append(Expense(title: newExpenseTitle, totalAmount: Double(newExpenseTotalAmount)!, category: <#String#>))
                                            isAddingExpense = false,
                                            newExpenseTitle = "",
                            newExpenseTotalAmount = ""
                        }
                    }) {
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                            .padding()
                    }
                    
                    Button(action: {
                        // Cancel adding a new goal
                        isAddingExpense = false
                        newExpenseTitle = ""
                        newExpenseTotalAmount = ""
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
            
            // Button to toggle the new goal creation box
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
                //Text("$\(expense.totalAmount, specifier: "%.2f"))
                    //.font(.subheadline)
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

#Preview {
    ExpensesView()
}

