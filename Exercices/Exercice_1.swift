//
//  Exercice_1.swift
//  Exercices
//
//  Created by SUP'Internet 15 on 28/09/2017.
//  Copyright © 2017 SUP'Internet 15. All rights reserved.
//

import Foundation

func condog(str: String, prefix: Character, suffix: String) -> String {
    return [String(prefix),str,suffix].joined(separator: "")
}
