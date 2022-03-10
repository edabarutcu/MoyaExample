//
//  User.swift
//  Moya-Test
//
//  Created by detaysoft on 9.03.2022.
//

import Foundation

struct User: Decodable {
    var id: Int
    var name: Int
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
}
struct Address: Decodable {
    var street: String
    var suite: String
    var city:String
    var zipcode:String
}


