//
//  Exercice_5.swift
//  Exercices
//
//  Created by SUP'Internet 05 on 02/10/2017.
//  Copyright © 2017 SUP'Internet 15. All rights reserved.
//

import Foundation

extension ApiManager {
    func getRandomUserHydratedWithPerson(completion: @escaping (Person) -> Void) {
        self.getRandomUser { json in
            var last = ""
            var first = ""
            var title = ""
            var dob = ""
            var email = ""
            var gender = ""
            
            let obj = json as! [String: Any]
            if let result = obj["results"] as? NSArray {
                let data = result[0] as? [String: Any]
                
                dob = data?["dob"] as! String
                print("Birthdate : \(dob)\n")
                
                email = data?["email"] as! String
                print("Email : \(email)\n")
                
                gender = data?["gender"] as! String
                print("Gender : \(gender)\n")
                
                if let name = result.value(forKey: "name") as? NSArray {
                    let data = name[0] as? [String: Any]
                    
                    first = data?["first"] as! String
                    print("FirstName : \(first)\n")
                    
                    last = data?["last"] as! String
                    print("LastName : \(last)\n")
                    
                    title = data?["title"] as! String
                    print("Title : \(title)\n")
                }
            }
            completion(Person(firstname: first, lastname: last, gender: Person.Gender(rawValue: gender)!, email: email, birthdate: (date: dob, format: "yyyy-MM-dd HH:mm:ss")))
        }
    }
}
