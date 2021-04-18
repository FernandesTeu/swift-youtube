//
//  Video.swift
//  youtubeClone
//
//  Created by Mateus Fernandes Pinto on 13/04/21.
//

import Foundation

struct Video {
    let urlApi = "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json"
    
    func getVideo() {
        
        if let url  = URL(string: urlApi) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
             
                if error != nil {
                    print(error?.localizedDescription as Any)
                }
                
                if let saveData = data {
                    
                }
            }
            
            task.resume()
        }
    }
}



Video: Codable {
    
    var title: String?
    var number_of_views: NSNumber?
    var thumbnail_image_name: String?
    var duration: NSNumber?
    var channel: Channel?
    
    init(<#parameters#>) {
        <#statements#>
    }
}

class Channel: Codable {
    var name: String?
    var profile_image_name: String?
}
//
//"title": "Taylor Swift - I Knew You Were Trouble (Exclusive)",
//    "number_of_views": 319644991,
//    "thumbnail_image_name": "https://s3-us-west-2.amazonaws.com/youtubeassets/taylor_swift_i_knew_you_were_trouble.jpg",
//    "channel": {
//      "name": "Taylor Fan Forever",
//      "profile_image_name": "https://s3-us-west-2.amazonaws.com/youtubeassets/taylor_fan_forever_profile.jpg"
//    },
//    "duration": 210
