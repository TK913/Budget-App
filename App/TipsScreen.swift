//
//  Tips Page
//
//  Created by Teddy Kelly on 11/04/23.
//

import SwiftUI
//import SwiftData

struct TipsView: View {
    //@State private var username = ""
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                Text("Tips")
                    .frame(alignment:.top)
                    .font(.largeTitle)
                
                Button(action:{
                    print("Test")
                }){
                    Text("Getting Started")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(Color(white: 0.705))
                        .cornerRadius(20)
                        .padding(.horizontal, 10)
                }
                
                Button{
                    print("Test2")
                }label:{
                    List([1, 2, 3], id: \.self) { row in
                        HStack {
                            Button(action: { print("Button at \(row)") }) {
                                Text("Chapter \(row)")
                            }
                        }
                    }
                    .buttonStyle(.plain)
                    .frame(height: 150)
                }
                
                Button(action:{
                    print("Test")
                }){
                    Text("About Saving")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(Color(white: 0.705))
                        .cornerRadius(20)
                        .padding(.horizontal, 10)
                }
                
                Button{
                    print("Test2")
                }label:{
                    List([1, 2, 3], id: \.self) { row in
                        HStack {
                            Button(action: { print("Button at \(row)") }) {
                                Text("Chapter \(row)")
                            }
                        }
                    }
                }
                .buttonStyle(.plain)
                .frame(height: 150)
                
                Button(action:{
                    print("Test")
                }){
                    Text("FAQ")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(Color(white: 0.705))
                        .cornerRadius(20)
                        .padding(.horizontal, 10)
                }
                
                Button{
                    print("Test2")
                }label:{
                    List([1, 2, 3], id: \.self) { row in
                        HStack {
                            Button(action: { print("Button at \(row)") }) {
                                Text("Chapter \(row)")
                            }
                        }
                    }
                    .buttonStyle(.plain)
                    .frame(height: 150)
                }
            }
        }.navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}
