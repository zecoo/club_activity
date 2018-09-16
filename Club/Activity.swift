//
//  Activity.swift
//  Club
//
//  Created by 张泽锟 on 2017/7/12.
//  Copyright © 2017年 张泽锟. All rights reserved.
//

import UIKit
let user: String = "22Kon"
class Activity: NSObject {
    var title: String
    var detail: String
    var image: String
    var clubName: String
    var time: String
    var location: String
    var comments: [String] = [String]()
    var isLiked: Bool = false
    
    init (title: String, detail: String, image: String, clubName: String, time: String, location: String){
        self.title = title
        self.detail = detail
        self.image = image
        self.clubName = clubName
        self.time = time
        self.location = location
    }
}
