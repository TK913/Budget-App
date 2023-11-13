//
//  Tips Basics Page
//
//  Created by Teddy Kelly on 11/04/23.
//

import SwiftUI

struct TipsBasicsView: View {
    
    var ch1 = "The practice of budgeting is simple. It is to manage your spending such that you spend more on what you plan to and less on what you don’t plan to. As such, most of the process of budgeting is about discipline and habit-forming. This app attempts to help guide you through the habit forming process by making it easier to plan your spending. However, only you can choose to check the app, and thus we recommend that you firmly understand what role this app will play in your future spending, and then continue to hold yourself accountable."
    var ch2 = "So, what do we mean by “plan to spend”? Well, for example, if you were to buy groceries at the store, you should first have a shopping list so you don’t buy anything unnecessary. Or, if you want to spend x amount of money, you should make sure that you only have that much on hand so it’s impossible for you to overspend. Quite simply, the more prepared you are, the less you will spend on impulse."
    var ch3 = "As mentioned before, some tricks for budgeting include lists and limits. However, what’s truly the most important with budgeting is understanding. Before you buy anything, you should always be asking yourself “why am I buying this?” Whether you buy the product or not isn’t important, what’s important is that you’re buying whatever you want to buy because you CHOSE to do so. As long as you consider each purchase to be a meaningful choice, then you are already 80 percent of the way to being a successful budgeter."
    
    var body: some View {
        NavigationView{
            List{
                Text("Budgeting Basics")
                    .font(.largeTitle)
                    .frame(alignment:.top)
                VStack{
                    Text("Chapter 1: The Basics")
                        .frame(alignment: .leading)
                        .font(.title2)
                    Text(ch1)
                        .padding()
                    
                    Spacer()
                    
                    Text("Chapter 2: The Power of Planning")
                        .frame(alignment: .leading)
                        .font(.title2)
                    Text(ch2)
                        .padding()
                    
                    Spacer()
                    
                    Text("Chapter 3: The Budgeting Mindset")
                        .frame(alignment: .leading)
                        .font(.title2)
                    Text(ch3)
                        .padding()
                    
                }
            }
        }
    }
}

struct BasicsView: PreviewProvider {
    static var previews: some View {
        TipsBasicsView()
    }
}
