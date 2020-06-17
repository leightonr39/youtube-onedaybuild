//
//  Video.swift
//  youtube-onedaybuild
//
//  Created by Leighton  Rangi on 28/05/20.
//  Copyright © 2020 Leighton  Rangi. All rights reserved.
//

import Foundation

struct  Video: Decodable {
    // Above is read as our 'Video' object is Decodable
    // We will be using JSON parsing which is essential when working with API's.
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys : String, CodingKey {
        //This section is for declaring.
        
        // Specifying the set of keys that we are interested in from the API call. Use 'Case' for each key. The specification 'String' datatype will allow us to use our var names as ojects for the cases.
        
        case snippet
        case thumbnails
        case high
        case resourceId
        // Must specify cases for 'Parent' JSON objects if we want to access their arrays.
        
        
        case published = "publishedAt"
        case title // this name 'title' matches our the JSON name so we leave it as is.
        case description
        case thumbnail = "url" // You only need to specify the keys NOT the values for JSON
        case videoId
    }
    
    init (from decoder : Decoder) throws{
        // This is an initialiser. The 'container' is basically a JSON object.
       let container = try decoder.container(keyedBy: CodingKeys.self)
        // Above read as 'try' grabbing the container/object array from our  API using specified values we made in 'CodingKeys' enum and storing them in our constant 'container'. Will throw an error if there is any.
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey:.snippet)
        // This wil essentially look for the 'snippet' JSON key fromm our API and grab the array container and assign it to our constant var to be used as an object/instance.
        
        
        // Parse title using string type decoder
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        // Read as our 'title' property is equal to API JSON 'title' key.
        
        
        
        // Parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        
        
        // Parse the public date
        self.published = try snippetContainer.decode(Date.self, forKey: .published) // used 'Bool' type to assign as 'Date'
        
        
        
        // Parse thumbnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails) // Access further into the JSON API arrays for the thumbnails
        
        let highcontainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high) // Access further into the JSON API arrays for the high res thumbnail
        
        self.thumbnail = try highcontainer.decode(String.self, forKey: .thumbnail)
        
        
        // Parse Video ID
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId) // Access further into the JSON API arrays for the videoID key data
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}
