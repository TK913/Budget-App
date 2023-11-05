//
//  Tips Page
//
//  Created by Teddy Kelly on 11/04/23.
//

import SwiftUI
//import SwiftData

struct ContentView: View {
    //@State private var username = ""
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.white
                    .ignoresSafeArea()
                VStack{
                    Text("Tips")
                        .frame(maxHeight: .infinity, alignment: .topLeading)
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
