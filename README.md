# MoyaExample

### in this repository we will learn to use moya

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
 
 
