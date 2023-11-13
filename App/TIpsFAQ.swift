//
//  Tips FAQ Page
//
//  Created by Teddy Kelly on 11/04/23.
//

import SwiftUI

struct TipsFAQView: View {
    
    var ch1 = "Other than knowing how to spend and save money, you hopefully shouldn’t need to have any foreknowledge! In fact, this section of the app was made for you to allow yourself to get a good handle of what sort of functions this app has on offer, and so, as long as you read what’s on offer, you should be okay. However, if you do find what’s on offer lacking, we recommend looking for advice on the internet. One course we know of is the Personal Finance course on Khan Academy, so feel free to start there (it’s free)."
    var ch2 = "Quite frankly, that depends on you! All this app is here for is to act as a tool for your usage. As long as you feel you are achieving your financial milestones, then you are using this app in the best way you can!"
    var ch3 = "We recommend checking at least once a month (preferably at the time when your subscriptions are due) to make sure you aren’t paying for anything that you don’t want to be paying for. However, don’t be afraid to check more frequently than that as long as it gives you comfort."
    
    var body: some View {
        NavigationView{
            List{
                Text("FAQ")
                    .font(.largeTitle)
                    .frame(alignment:.top)
                VStack{
                    Text("Chapter 1: How much do I need to know?")
                        .frame(alignment: .leading)
                        .font(.title2)
                    Text(ch1)
                        .padding()
                    
                    Spacer()
                    
                    Text("Chapter 2: What’s the best way to use this app?")
                        .frame(alignment: .leading)
                        .font(.title2)
                    Text(ch2)
                        .padding()
                    
                    Spacer()
                    
                    Text("Chapter 3: How often should I check in?")
                        .frame(alignment: .leading)
                        .font(.title2)
                    Text(ch3)
                        .padding()
                    
                }
            }
        }
    }
}

struct FAQView: PreviewProvider {
    static var previews: some View {
        TipsFAQView()
    }
}
