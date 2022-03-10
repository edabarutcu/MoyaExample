//
//  UserService.swift
//  Moya-Test
//
//  Created by detaysoft on 9.03.2022.
//

import Foundation
import Moya

enum Users {
    enum usersTitle: TargetType {
        case names
        
        var baseURL: URL {
               return URL(string: "https://jsonplaceholder.typicode.com")!
           }
        
        var path: String {
            switch self {
            case .names:
                return "/users"
            }
        }
        
        var method: Moya.Method {
            return .get
        }
        
        var task: Task {
            switch self {
            case .names:
                return .requestPlain
            }
        }
        
        var headers: [String : String]? {
            return nil
        }
    }
}


