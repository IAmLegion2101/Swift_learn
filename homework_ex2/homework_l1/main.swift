//
//  main.swift
//  HelloSwift_L1
//
//  Created by Антон on 08.04.2021.
//

import Foundation

//print("Hello, World!")
var leg1 = 0
var leg2 = 0
var hypo = 0
var S: Double = 0
var P = 0
print("Enter the angle between 2 legs:")
if let angle = readLine(){
    if Int(angle) == 90{
        print("Enter 2 triangle legs:")
        if let input = readLine(){
            let num = Int(input)
            if num != nil {
                leg1 = Int(input)!
            }else{
                print("illegal char in input")
                exit(1)
            }
        }
        if let input = readLine(){
            let num = Int(input)
            if num != nil {
                leg2 = Int(input)!
            }else{
                print("illegal char in input")
                exit(1)
            }
        }        
    }else{
        print("the triangle is not right")
        exit(1)
    }
}else{
    print("angle is not set!")
    exit(1)
}

print("leg1:" + String(leg1))
print("leg1:" + String(leg2))
hypo = leg1*leg1 + leg2*leg2
print("hypo:" + String(hypo))
P = hypo + leg1 + leg2
print("P:" + String(P))
S = (Double(leg1) + Double(leg2)) * Double(1.0/2.0)
print("S:" + String(S))

