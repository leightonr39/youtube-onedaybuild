//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by Leighton  Rangi on 28/05/20.
//  Copyright © 2020 Leighton  Rangi. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = ""
    static var PLAYLIST_ID = "UUlIu4g8ffdgqSdynwet1aWw"
    static var API_URL =
    "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
}
