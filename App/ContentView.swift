//
//  ContentView.swift
//  Loginscreen
//
//  Created by Niyati Sanghrajka on 10/27/23.
//

import SwiftUI
import SQLite3

struct ContentView: View {
        @State private var username = ""
        @State private var password = ""
        @State private var isRegistrationActive = false
        @State private var registrationName = ""
        @State private var registrationUsername = ""
        @State private var registrationEmail = ""
        @State private var registrationPassword = ""
        @State private var isAuthenticated = false
        @State private var incorrectUsername = ""
        @State private var incorrectPassword = ""

        private let databaseManager = DatabaseManager()
    
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
                        if databaseManager.loginUser(username: username, password: password) {
                                        isAuthenticated = true
                                    } else {
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

                    Button(action: {
                        isRegistrationActive = true
                        databaseManager.registerUser(username: registrationUsername, password: registrationPassword, name: registrationName, email: registrationEmail)

                    }) {
                        Text("Register")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(red: 0.0, green: 0.0, blue: 1.0).opacity(0.75))
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(
                        destination: DashboardView(),
                        isActive: $isAuthenticated,
                        label: { EmptyView() }
                    )
                }
                .padding()
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $isRegistrationActive) {
                RegistrationView(
                    isRegistrationActive: $isRegistrationActive,
                    registrationName: $registrationName,
                    registrationUsername: $registrationUsername,
                    registrationEmail: $registrationEmail,
                    registrationPassword: $registrationPassword
                )
            }
        }
    }
}

struct RegistrationView: View {
    @Binding var isRegistrationActive: Bool
    @Binding var registrationName: String
    @Binding var registrationUsername: String
    @Binding var registrationEmail: String
    @Binding var registrationPassword: String

    var body: some View {
        VStack {
            Text("Registration")
                .font(.largeTitle)
                .padding()

            TextField("Name", text: $registrationName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Username", text: $registrationUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Email", text: $registrationEmail)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $registrationPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                isRegistrationActive = false
            }) {
                Text("Register")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green.opacity(0.75))
                    .cornerRadius(10)
            }

            Button(action: {
                isRegistrationActive = false
            }) {
                Text("Cancel")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red.opacity(0.75))
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct ContentViewPreviews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
