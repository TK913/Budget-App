//
// 
//  
//
//  Created by Ben Chittenden on 11/4/23.
//

import Foundation
struct SubFilterConfig{
   var isPresented = false

    var Subscription_data = [SubScriptionData(name: "Amazon Prime", Cost: "139.00", Period: "yearly"),
                             SubScriptionData(name: " Disney+", Cost: "139.99", Period: "yearly"),
                             SubScriptionData(name: "Netflix", Cost: "15.49", Period: "monthly")]
 
    mutating func prestentfilter()
    {
        isPresented = true
    }
    
    mutating func done()
    {
        isPresented = false
    }
    
}

struct SubScriptionData:Identifiable{
        var id:String {name}
        let name: String
        let Cost: String
        let Period: String
        
}
