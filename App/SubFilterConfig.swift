//
//
//
//
//  Created by Ben Chittenden on 11/4/23.
//

import Foundation
struct SubFilterConfig{
   var isPresented = false
 
    mutating func prestentfilter()
    {
        isPresented = true
    }
    
    mutating func done()
    {
        isPresented = false
    }
    
}
