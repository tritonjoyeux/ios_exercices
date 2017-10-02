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

print(apiManager.getRandomUserHydratedWithPerson(completion: { person in
    person.show()
}))

RunLoop.main.run()
