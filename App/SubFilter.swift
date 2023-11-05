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
            Text("price")
            Text("A-Z")
            HStack
            {
                Image(systemName: "arrowshape.down.fill")
                Image(systemName: "arrowshape.up.fill")
            }
            Button{
                config.done()
            } label: {
                Text("apply")
            }
        }
    }
}

