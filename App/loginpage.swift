//
//  ContentView.swift
//  Loginscreen
//
//  Created by Niyati Sanghrajka on 10/27/23.
//

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
