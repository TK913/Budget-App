//
//  DashboardView.swift
//  Budgeting
//
//  Created by Niyati Sanghrajka on 10/27/23.
//

import SwiftUI
import SQLite3

struct DashboardView: View {
    @State private var totalBalance: Double = getIncome(userID)

    private let databaseManager = DatabaseManager()
    var body: some View {
        VStack {
            Text("Welcome back!")
                .font(.largeTitle)
                .padding(.top, 20)
            
            Rectangle()
                .fill(Color.blue)
                .frame(height: 100)
                .cornerRadius(10)
                .overlay(
                    VStack {
                        Text("Your Balance")
                            .font(.callout)
                            .foregroundColor(.white)
                        Text("$\(totalBalance, specifier: "%.2f")")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                )
                .padding(.horizontal)
                .padding(.top, 20)
            
            
            NavigationLink(destination: SavingsView()) {
                DashboardButton(label: "Savings")
            }
            
            NavigationLink(destination: SubscriptionsView()) {
                DashboardButton(label: "Subscriptions")
            }
            
            NavigationLink(destination: ExpenseView()) {
                DashboardButton(label: "Expenses")
            }
            
            
            NavigationLink(destination: TipsView()) {
                DashboardButton(label: "Tips")
            }
            
            NavigationLink(destination: AccountInfoView()) {
                DashboardButton(label: "My Account")
            }
            
            .onAppear {
            }
            
            Spacer()
        }
    }
}

struct DashboardButton: View {
    var label: String
    
    var body: some View {
        Text(label)
            .font(.headline)
            .frame(maxWidth: .infinity, minHeight: 50)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.vertical, 5)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
