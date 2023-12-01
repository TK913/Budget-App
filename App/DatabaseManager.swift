//
//  Database Manager.swift
//  Budgeting
//
//  Created by Niyati Sanghrajka on 11/20/23.
//

import Foundation
import SQLite

class DatabaseManager {
    private var db: Connection?
    
    init() {
        do {
            let path = NSSearchPathForDirectoriesInDomains(
                .documentDirectory, .userDomainMask, true
            ).first!
            
            db = try Connection("/Users/niyatisanghrajka/Desktop/Budgeting/Budgeting/bdb.db")
        } catch {
            print("Error connecting to database: \(error)")
        }
    }
    
    
    func registerUser(username: String, password: String, name: String, email: String) {
        let insert = User.table.insert(
            User.username <- username,
            User.password <- password,
            User.name <- name,
            User.email <- email
        )
        
        do {
            try db?.run(insert)
        } catch {
            print("Error inserting user")
        }
    }
    
    func loginUser(username: String, password: String) -> Bool {
        let query = User.table.filter(User.username == username && User.password == password)
        
        do {
            let users = try db?.prepare(query)
            return users?.first != nil
        } catch {
            print("Error querying user:")
            return false
        }
    }
    
    func insertBudget(userID: Int, income: Double, payFrequency: String) {
        do {
            let insert = Budget.table.insert(
                Budget.income <- income,
                Budget.payFrequency <- payFrequency,
                Budget.userID <- userID
            )
            try db?.run(insert)
        } catch {
            print("Error inserting budget: \(error)")
        }
    }
    func getIncome(userID: Int) -> UserBudget? {
        let query = Budget.table.filter(Budget.userID == userID)
        do {
            if let result = try db?.pluck(query) {
                let income = try result.get(Budget.income)
                
                return UserBudget(income: income)
            }
        } catch {
            print("Error fetching user budget: \(error)")
        }
        return nil
    }
    func insertNewSavingsGoal(goal: Double, totalAmount: Double, userID: Int) -> Int? {
        do {
            let insert = Saving.table.insert(
                Saving.goal <- goal,
                Saving.totalAmount <- totalAmount,
                Saving.userID <- userID
            )

            let insertedID = try db?.run(insert)
            return insertedID
        } catch {
            print("Error inserting savings goal: \(error)")
            return nil
        }
    }
    func insertNewExpense(price: Double, category: String, userID: Int) {
        let insert = Expense.table.insert(
            Expenses.price <- price,
            Expenses.category <- category,
            Expenses.userID <- userID
        )

        do {
            try db?.run(insert)
        } catch {
            print("Error inserting expense: \(error)")
        }
    }
}

struct User {
    static let table = Table("Users")

    static let id = Expression<Int>("id")
    static let username = Expression<String>("username")
    static let password = Expression<String>("password")
    static let name = Expression<String>("name")
    static let email = Expression<String>("email")
    static let income = Expression<Double>("total_balance")
}

struct Budget {
    static let table = Table("Budget")

    static let id = Expression<Int>("BudgetID")
    static let income = Expression<Double>("income")
    static let payFrequency = Expression<String>("pay_frequency")
    static let userID = Expression<Int>("UserID")
}
struct Saving {
        static let table = Table("Savings")

        static let id = Expression<Int>("SavingsID")
        static let goal = Expression<Double>("Goal")
        static let totalAmount = Expression<Double>("TotalAmount")
        static let userID = Expression<Int>("UserID")
    }
struct Expenses {
    static let table = Table("Expenses")

    static let id = Expression<Int>("ExpensesID")
    static let price = Expression<Double>("Price")
    static let category = Expression<String>("Category")
    static let userID = Expression<Int>("UserID")
}
