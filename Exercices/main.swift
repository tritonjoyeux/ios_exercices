//
//  main.swift
//  Exercices
//
//  Created by SUP'Internet 15 on 28/09/2017.
//  Copyright © 2017 SUP'Internet 15. All rights reserved.
//

import Foundation

let emir = Person(firstname: "Emir", lastname: "Azaiez", gender: .Male, email: "emir.azaiez@gmail.com", birthdate: (date: "1900-01-11 07:20:24 +0000", format: "yyyy-MM-dd hh:mm:ss ZZZZ"))

//print(emir.show())

let apiManager = ApiManager(baseURL: "https://api.randomuser.me/")

func printMyUser(json: Any) -> Void {
    let obj = json as! [String: Any]
    if let result = obj["results"] as? NSArray {
        let data = result[0] as? [String: Any]
        
        let email = data?["email"]
        print("Email : \(email!)\n")
        
        let gender = data?["gender"]
        print("Gender : \(gender!)\n")
        
        if let name = result.value(forKey: "name") as? NSArray {
            let data = name[0] as? [String: Any]
            
            let first = data?["first"]
            print("FirstName : \(first!)\n")
            
            let last = data?["last"]
            print("LastName : \(last!)\n")
            
            let title = data?["title"]
            print("Title : \(title!)\n")
        }
    }
}

apiManager.getRandomUser(completion: printMyUser)
RunLoop.main.run()
