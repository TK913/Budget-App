//
//  ContentView.swift
//  Loginscreen
//
//  Created by Niyati Sanghrajka on 10/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username = "niyati"
    @State private var password = "budget"
    @State private var incorrectUsername = ""
    @State private var incorrectPassword = ""
    @State private var showingLogin = false
    @State private var isAuthenticated = false // A state to track authentication

    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                VStack {
                    Text("Budget Buddy")
                        .font(.largeTitle
                            .weight(.bold))
                        .foregroundColor(Color(red: 0.0, green: 0.0, blue: 1.0).opacity(0.75))
                        .padding()
                    
                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action: {
                        // Basic login logic - check for valid username and password
                        if username == "niyati" && password == "budget" {
                            // Successful login
                            isAuthenticated = true // Set authentication state
                        } else {
                            // Incorrect username or password
                            incorrectUsername = "Incorrect username"
                            incorrectPassword = "Incorrect password"
                        }
                    }) {
                        Text("Login")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(red: 0.0, green: 0.0, blue: 1.0).opacity(0.75))
                            .cornerRadius(10)
                    }
                    
                    Text(incorrectUsername)
                        .foregroundColor(.red)
                    Text(incorrectPassword)
                        .foregroundColor(.red)
                    
                    // Use NavigationLink to navigate to a different view when isAuthenticated is true
                    NavigationLink(
                        destination: DashboardView(),
                        isActive: $isAuthenticated,
                        label: { EmptyView() }
                    )
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*
import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var incorrectUsername = ""
    @State private var incorrectPassword = ""
    @State private var showingLogin = false
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                VStack{
                    Text("Login")
                        .font(.largeTitle)
                        .padding()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/

