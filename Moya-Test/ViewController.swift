//
//  ViewController.swift
//  Moya-Test
//
//  Created by detaysoft on 9.03.2022.
//

import UIKit
import Moya

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var users = [User]()
    let service = MoyaProvider<Users.usersTitle>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
}






