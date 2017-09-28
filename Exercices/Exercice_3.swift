//
//  Exercice_3.swift
//  Exercices
//
//  Created by SUP'Internet 15 on 28/09/2017.
//  Copyright © 2017 SUP'Internet 15. All rights reserved.
//

import Foundation

extension String {
    func toDate(format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let date = formatter.date(from: self)
        if let dateF = date {
            return dateF
        }
        return Date()
    }
}

extension Date {
    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let myString = formatter.string(from: self)
        return myString
    }
    
    func getYearDifferenceFrom(date: Date) -> Int {
        let calendar = NSCalendar.current
        
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: date)
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        return components.day! / 365
    }
}

struct Email: CustomStringConvertible {
    var email: String?
    
    init(email: String) {
        self.email = email
    }
    
    func isValid() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self.email)
    }
    
    var description: String {
        return "\(self.email!)"
    }
}

class Existence {
    var birthdate: Date
    var age: Int
    
    init(date: Date?) {
        self.birthdate = date!
        self.age = self.birthdate.getYearDifferenceFrom(date: Date())
    }
    
    func willProbablyDieSoon() -> Bool {
        return self.age > 100
    }
}

class Person: Existence {
    enum Gender {
        case Male, Female, Other
    }
    
    var gender: Gender
    var firstname: String
    var lastname: String
    var email: Email
    
    init(firstname: String, lastname: String, gender: Gender, email: String, birthdate: (date: String, format: String)) {
        self.firstname = firstname
        self.lastname = lastname
        self.gender = gender
        self.email = Email(email: email)
        super.init(date: birthdate.date.toDate(format: birthdate.format))
    }
    
    init(firstname: String, lastname: String, gender: Gender, email: String, birthdate: Date) {
        self.firstname = firstname
        self.lastname = lastname
        self.gender = gender
        self.email = Email(email: email)
        super.init(date: birthdate)
    }
    
    func show() {
        
        print("firstname : \(self.firstname) ")
        print("lastname : \(self.lastname) ")
        
        switch self.gender {
        case .Male:
            print("gender : Male")
        case .Female:
            print("gender : Male")
        case .Other:
            print("gender : Other")
        }
        
        print("email valid : \(self.email.isValid())")
        print("email : \(self.email)")
        
        print("birthdate : \(self.birthdate)")
        print("age : \(self.age)")
        print("will die soon : \(self.willProbablyDieSoon())")
        
    }
}















