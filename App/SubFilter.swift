//
//  
//  
//
//  Created by Ben Chittenden on 11/4/23.
//

import SwiftUI

struct SubFilter: View {
    @Binding var config: SubFilterConfig
    var body: some View {
        VStack{
            Button
            {
                print("test2")
            }label:{

                Text("price")

            }
            Button{
                print("test3")
            }label:{
    
            Text("A-Z")
    
            }
            HStack
            {
                Button{
                    print("test4")
                }label:{

                Image(systemName: "arrowshape.down.fill")
        
                }
                Button{
                    print("test5")
                }label:{    

                Image(systemName: "arrowshape.up.fill")
    
                }
            }
            Button{
                config.done()
            } label: {
                Text("apply")
            }
        }
    }
}

