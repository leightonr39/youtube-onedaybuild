//
//  Response.swift
//  youtube-onedaybuild
//
//  Created by Leighton  Rangi on 4/06/20.
//  Copyright © 2020 Leighton  Rangi. All rights reserved.
//

import Foundation

struct Response : Decodable {
    
    var items: [Video]? // Declaring items datatype as an array of objects option for any data that is in the object array of the Video.swift file
    
    enum CodingKeys:String, CodingKey {
        
        case items
    }
    
    init (from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
        // Used 'Bool' type to specify our type as an 'Array of video objects'
    }
}
