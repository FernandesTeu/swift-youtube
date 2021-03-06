//
//  Video.swift
//  youtubeClone
//
//  Created by Mateus Fernandes on 16/04/21.
//

import Foundation


import Foundation

class Video: NSObject {
    var thumbnailImageName: String?
    var title: String?
    var channel: Channel?
    var numberOfViews: NSNumber?
    var uploadData: NSDate?
}

class Channel: NSObject {
    var channelName: String?
    var profileImageName: String?
}
