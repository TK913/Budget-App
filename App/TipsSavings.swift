//
//  Tips Savings Page
//
//  Created by Teddy Kelly on 11/04/23.
//

import SwiftUI

struct TipsSavingView: View {
    
    var ch1 = "While many recommend you save 10-30% of your income, the amount you can save is actually directly related to how much you earn. For example, if you spend 95% of your income on necessities, saving is the least of your worries. So, instead of going by percentage, pick a monetary amount that you believe you can subtract from your income and then save that in an account directly when you get paid."
    var ch2 = "If your workplace has a 401(k) match or some sort of equivalent, you should first max that out. From there, you can then start up some sort of Roth IRA or you can look into buying total stock market indexes (or ETF’s). For the latter, Vanguard has a “Retire by X date” portfolio that you can refer to. However, please do your own research on the subject before you put your money anywhere."
    var ch3 = "If you have any big financial goals, you should save towards those in addition to saving for retirement. In addition, we recommend that you keep an emergency fund enough to cover 3-6 months of daily expenses in case any unforeseen emergencies happen. The reason for this is because most adults end up in debt because of these sorts of emergencies, and it’s better to be broke than broke and in debt."
    
    var body: some View {
        NavigationView{
            List{
                Text("About Saving")
                    .font(.largeTitle)
                    .frame(alignment:.top)
                VStack{
                    Text("Chapter 1: How Much Should I Save?")
                        .frame(alignment: .leading)
                        .font(.title2)
                    Text(ch1)
                        .padding()
                    
                    Spacer()
                    
                    Text("Chapter 2: Saving For Retirement")
                        .frame(alignment: .leading)
                        .font(.title2)
                    Text(ch2)
                        .padding()
                    
                    Spacer()
                    
                    Text("Chapter 3: What Else Should I Save For?")
                        .frame(alignment: .leading)
                        .font(.title2)
                    Text(ch3)
                        .padding()
                    
                }
            }
        }
    }
}

struct SavingView: PreviewProvider {
    static var previews: some View {
        TipsSavingView()
    }
}
