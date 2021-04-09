//
//  main.swift
//  Homework_ex3
//
//  Created by Антон on 08.04.2021.
//

import Foundation
var sum: Double = 0.0
var percent: Int = 0

print("Enter the sum:")
if let input = readLine(){
    let num = Double(input)
    if num != nil{
        sum = Double(input)!
    }else{
        print("wrong sum")
        exit(1)
    }
}else{
    print("wrong arg")
    exit(1)
}
print("Enter the percent:")
if let input = readLine(){
    let num = Int(input)
    if num != nil{
        percent = Int(input)!
    }else{
        print("wrong percent")
        exit(1)
    }
}else{
    print("wrong arg")
    exit(1)
}
print("percent:" + String(percent))
print("percent:" + String(sum))
var res: Double = 0.0
for _ in 1...5 {
    res += sum + sum * (Double(percent)/100)
}
print("Result:" + String(res))




