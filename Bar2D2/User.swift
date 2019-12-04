//
//  User.swift
//  Bar2D2
//
//  Created by Jeffery Pereira on 12/2/19.
//  Copyright © 2019 Jeffery Pereira. All rights reserved.
//

import Foundation

class UserClass{
    public var isAdmin: Bool!
    public var username: String!
    public var botID: String!
    init(iA: Bool, un: String, bI: String){
        isAdmin = iA
        username = un
        botID = bI
    }
}
