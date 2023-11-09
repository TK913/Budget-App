//
//  
//  
//
//  Created by Ben Chittenden on 11/4/23.
//

import SwiftUI

struct SubList: View {
   
    var body: some View {
         
       ScrollView{
            VStack{
            //call to conntroller to get list of subscriptions from model
            //for loop to display names, prices, and periods
                for i in 0..<3{
                    VStack{
                        Button{
        
                        }label: {
                            Text(Subscription_data[i][0])
                        }
                        Text("Cost: $\(Subscription_data[i[1]])\t\t\tRenews: \(Subscription_data[i][2])")
                    }
                    .border(.gray)
                }
            }.alignmentGuide(VerticalAlignment.top) { _ in 0 }
             
        }
            
    }
}

