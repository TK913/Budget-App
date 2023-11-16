//
//
//  
//
//  Created by Ben Chittenden on 11/4/23.
// 

import SwiftUI

struct SubscriptionsView: View {
    
    @State private var Subfilterconfig = SubFilterConfig()
    
    private struct SubScriptionData:Identifiable{
        var id:String {name}
        let name: String
        let Cost: String
        let Period: String
        
    }
    @State public var Subscription_data = [SubScriptionData(name: "Amazon Prime", Cost: "139.00", Period: "yearly"),
                                            SubScriptionData(name: " Disney+", Cost: "139.99", Period: "yearly"),
                                            SubScriptionData(name: "Netflix", Cost: "15.49", Period: "monthly")]
    
    var body: some View {
           SubList(data: $Subscription_data)
           .toolbar{
            ToolbarItem{
                Button{
                    Subfilterconfig.prestentfilter()
                    
                } label: {
                    Image(systemName: "slider.horizontal.3")
                }
                .sheet(isPresented: $Subfilterconfig.isPresented)
                {
                   SubFilter(config: $Subfilterconfig)
                }
            }
        }
    }
}

struct SubscriptionsView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionsView()
    }
}

///#Preview {
    //SwiftUIView()
///}
