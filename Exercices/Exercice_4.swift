//
//  Exercice_4.swift
//  Exercices
//
//  Created by SUP'Internet 15 on 28/09/2017.
//  Copyright © 2017 SUP'Internet 15. All rights reserved.
//

import Foundation


class ApiManager {
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    var baseURL: String
    
    func getRandomUser(completion: @escaping (Any) -> Void) {
        let urlString = URL(string: self.baseURL)
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error)
                } else {
                    if let usableData = data {
                        let json = try? JSONSerialization.jsonObject(with: usableData, options: [])
                        completion(json!)
                    }
                }
            }
            task.resume()
        }
    }
}
