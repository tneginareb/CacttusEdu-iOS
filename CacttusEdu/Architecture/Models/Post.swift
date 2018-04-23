//
//  Post.swift
//  CacttusEdu
//
//  Created by Gent Berani on 4/23/18.
//  Copyright © 2018 CacttusEdu. All rights reserved.
//

import UIKit

class Post: NSObject {

    let id: String
    let user_id: String
    let username: String
    let photo_url: String
    let pershkrimi: String
    let created_date: String
    
    init(jsonObject: [String : AnyObject]) {
        self.id = jsonObject["id"] as? String ?? ""
        self.user_id = jsonObject["user_id"] as? String ?? ""
        self.username = jsonObject["username"] as? String ?? ""
        self.photo_url = jsonObject["photo_url"] as? String ?? ""
        self.pershkrimi = jsonObject["pershkrimi"] as? String ?? ""
        self.created_date = jsonObject["created_date"] as? String ?? ""
    }
    

}

/*
 [String : AnyObject]
 "id": "296",
 "user_id": "0",
 "username": "",
 "photo_url": "http://appsix.net/paintbook/photos/",
 "pershkrimi": "",
 "created_date": "2018-04-22 03:07:05"

 */
