//
//
//  
//
//  Created by Ben Chittenden on 11/4/23.
// 

import SwiftUI

struct module_subscription: View {
    
    @State private var Subfilterconfig = SubFilterConfig()
    
    var body: some View {
      
        VStack{
            Text("Sub 1")
            Text("Cost: $10.00\t\t\tRenews: Monthly")
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
