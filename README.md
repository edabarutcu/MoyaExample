# MoyaExample

# APIManager
* A clear way to write network layer with moya framework

# REQUIREMENT
- ios 15.2
- Xcode 13.2
- Moya 11.0

# API i use 
https://jsonplaceholder.typicode.com/users


## USAGE

 You can access an API like this:
 
 ```swift
    var users = [User]()
    var service = MoyaProvider<Users.usersTitle>()
        
        service.request(.names) { (result) in
            switch result {
            case .success(let response):
                let users = try! JSONDecoder().decode([User].self, from: response.data)
                self.users = users
                self.tableView.reloadData()
                print(users)
            case .failure(let error):
                print(error)
            }
        }
 
 
