//
//
//
//
//  Created by Ben Chittenden on 11/4/23.
//

import SwiftUI

struct module_subscription: View {
    
    @State private var Subfilterconfig = SubFilterConfig()
    
    @State var Subscription_data = [SubScriptionData(name: "Amazon Prime", Cost: "139.00", Period: "yearly"),
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

struct SubList: View {
   
    @State @Binding var data: [SubScriptionData]
    
    var body: some View {
         
       ScrollView{
        ForEach(data){ i in
                   OneSub($i)
                   
                }
       }.alignmentGuide(VerticalAlignment.top) { _ in 0 }
            
    }
}

struct OneSub:View {
    @Binding var sub: SubScriptionData
    var body: some View {
             VStack{
                        Button{
                                print("Test")
                        }label: {
                            Text(sub.name)
                        }
                        Text("Cost:" + sub.cost + "\t\t\tRenews:" +  sub.Period)
                    }
                    .border(.gray)
    }
}
    
struct SubScriptionData:Identifiable{
        var id:String {name}
        let name: String
        let Cost: String
        let Period: String
        
}

struct Subscription_Previews: PreviewProvider {
    static var previews: some View {
        module_subscription()
    }
}


///#Preview {
    //SwiftUIView()
///}
