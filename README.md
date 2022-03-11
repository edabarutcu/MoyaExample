
# Moya
* Moya is a network abstraction layer. It uses Alamofire and provides us to set up a network manager quickly.


# REQUIREMENT
- iOS 15.2
- Xcode 13.2
- Moya 15.0

# API i use 
We create easily and quickly a network layer using Moya Framework with an example. I’m going to use the API of https://jsonplaceholder.typicode.com to fetch data for the example.


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
  ```
  Create your  Model:
  ```swift
  struct User: Decodable {
    var id: Int
    let name: String
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
```
We should create an API.swift file and create an enum that includes different requests. We should extend the API enum with Moya’s TargetType and conform the required variables. We have baseURL, path, method, sampleData, task, and headers.
```swift
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
```
#### baseURL:

The common prefix of the API URL.

path: The path after baseURL. We need to put dynamic value sometimes. 

#### method:

The HTTP method of request. It can be get, post, put, delete, connect, head, options, patch and trace.

#### sampleData:

You can create a stub data for the response for testing. If you don’t write any test, you can return empty data like in the code.

#### task:

Represents an HTTP task.

We should use requestPlain if we don’t add any query parameter or body. To add query parameters for example: ?api_key=xxx. We should choose requestParameters. Also, we can use requestJSONEncodable for the body with an encodable request model.

#### header:

The headers to be used in the request. When you need a header for the request, you can add headers into the dictionary.



 
