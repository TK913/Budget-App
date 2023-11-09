//
//
//  
//
//  Created by Ben Chittenden on 11/4/23.
// 

import SwiftUI

struct module_subscription: View {
    
    @State private var Subfilterconfig = SubFilterConfig()
     private var Subscription_data = [["Amazon prime", 139,"annual"]
                                     ["Disney+",139.99,"yearly"]
                                     ["Netflix"15.49,"monthly"]  ]
    
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

struct Subscription_Previews: PreviewProvider {
    static var previews: some View {
        module_subscription()
    }
}

///#Preview {
    //SwiftUIView()
///}
