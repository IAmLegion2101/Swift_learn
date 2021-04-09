//
//  main.swift
//  homework_ex1
//
//  Created by Антон on 08.04.2021.
//

import Foundation


func getparam(param:String) -> Double {
    var coef: Double = 0
    var flag: Bool = false
    while !flag {
        print("enter " + param + ":")
        if let input = readLine(){
            if Double(input) != nil{
                if param == "a"{
                    if Double(input) != 0{
                        return Double(input)!
                    }else{
                        print("param a cannot be equal 0")
                    }
                }else{
                  return Double(input)!
                }
                
            }else{
                if input == "exit"{
                    exit(2)
                }
                print("illegal char symbols in input!")
            }
        }
    }
}

var a: Double = 0
var b: Double = 0
var c: Double = 0
print("welcome to quadratic equation solver:")
print("a quadratic equation is an equation in the form: axˆ2+bx+c=0")
print("If you want to close the program, enter exit...")
a = getparam(param: "a")
b = getparam(param: "b")
c = getparam(param: "c")
print("param a: " + String(a))
print("param b: " + String(b))
print("param c: " + String(c))

if b == 0 && c == 0{
    print("equation: " + String(a) + "xˆ2" + "=0")
    print("the solution is 0")
    exit(0)
}
else if b != 0 && c == 0{
    print("equation: " + String(a) + "xˆ2" + String(b) + "x" + "=0")
    print("x1=0")
    print("x1=" + String(Double(-b/a)))
    exit(0)
}else if b == 0 && c != 0{
    print("equation: " + String(a) + "xˆ2" + String(c) + "=0")
    if Double(-c/a) < 0{
        print("no solution...")
        exit(0)
    }
    else if Double(-c/a) > 0{
        var x: Double = 0
        x = Double(Double(-c/a).squareRoot())
        print("x1=" + String(x))
        print("x2=" + String(-x))
        exit(0)
    }else{
        print("x=0")
        exit(0)
    }
}else{
    var D: Double = 0
    D = Double(b*b - 4 * a * c)
    if D < 0{
        print("no solution...")
        exit(0)
    }else if D == 0{
        var x: Double = 0
        x = Double(-b/(2*a))
        print("x=" + String(x))
        exit(0)
    }else{
        var x1: Double = 0
        var x2: Double = 0
        x1 = ((-b - D.squareRoot())/(2*a))
        x2 = ((-b + D.squareRoot())/(2*a))
        print("x1=" + String(x1))
        print("x2=" + String(x2))
        exit(0)
    }
}




    


