//
//  Exercice_2.swift
//  Exercices
//
//  Created by SUP'Internet 15 on 28/09/2017.
//  Copyright © 2017 SUP'Internet 15. All rights reserved.
//

import Foundation

func cleanHobbits(arr: Array<String>)->(first: String, last: String, reversedArray: Array<String>, nbElements: Int) {
    var arrTemp = arr
    var arrReversed = Array<String>()
    let first = arrTemp.removeFirst()
    let last = arrTemp.removeLast()
    
    let k = 1;
    //    while arrTemp.count-k > 0 {
    ////        arrReversed.insert(arrTemp[arrTemp.count-k], at: k-1)
    //
    //    }
    
    return (first: first, last: last, reversedArray: arrReversed, nbElements: arrTemp.count) as! (first: String, last: String, reversedArray: Array<String>, nbElements: Int)
}
