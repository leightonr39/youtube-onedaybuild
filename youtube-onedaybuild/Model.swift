//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Leighton  Rangi on 28/05/20.
//  Copyright © 2020 Leighton  Rangi. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos(){
        
        // Create URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil || data == nil {
                return
            }
            
            do {
                
                // Parsing the data into the video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601 // specifying date type so it knows how to convert JSON string data into date type. This tells the decoder that if it finds dates in the JSON, it will be of this format.
                
                let response = try decoder.decode(Response.self, from: data!)
                // This method above will decode the JSON data, ability to filter through the swift files for decoding. Because this method throws, we must wrap it in some error handling such as 'do'and 'catch'.
                
                dump(response) // throws everything into the console for checking
            }
                
            catch {
                
            }
            

            
        }
        // Kick off the task
        dataTask.resume()
        
    }
    
}
