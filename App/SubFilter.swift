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

            }label:{

                Text("price")

            }
            Button{

            }label:{
    
            Text("A-Z")
    
            }
            HStack
            {
                Button{

                }label:{

                Image(systemName: "arrowshape.down.fill")
        
                }
                Button{
    
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

