//
//  main.swift
//  Homework_ex2
//
//  Created by Антон on 11.04.2021.
//

import Foundation

/*Функция проверки деления на 3 без остатка*/
func mod_three(_ item: Int) -> Bool {
    if item % 3 == 0{
        return true
    }else{
        return false
    }
}

func create_fib_seq() -> [Decimal] {
    var fibSeq: [Decimal] = []
    for i in 0...99{
        if i < 2{
            fibSeq.append(Decimal(i + 1))
        }else{
            fibSeq.append(fibSeq[i - 1] + fibSeq[i - 2])
        }
    }
    return fibSeq
}
/* Функция поиска чисел по Эратосфену*/
func create_siple_arr(_ num: Int) -> [Decimal]{
    var mas: [Decimal] = []
    for i in 0...(num) {
        mas.append(Decimal(i))
    }
    mas[1] = 0
    var iCounter: Int = 2
    while iCounter <= (num) {
        if mas[iCounter] != 0 {
            var jCounter: Int = iCounter + iCounter
            while jCounter <= (num) {
                mas[jCounter] = 0
                //mas.remove(at: jCounter)
                jCounter = jCounter + iCounter
            }
        }
        iCounter += 1
    }
    let res: [Decimal] = mas.filter{$0 != 0}
    return res
}
//создаем массив
var mas: [Int] = []
// цикл заполнения
for i in 0...99 {
    mas.append(i+1)
}
 //удаление чисел которые, не делятся на 3 без остатка
for item in mas{
    let flag: Bool = mod_three(item)
    if flag == false{
        print("deleted item: " + String(item))
        mas.remove(at: mas.firstIndex(of: item)!)
    }
}
var fibSeq: [Decimal] = []
fibSeq = create_fib_seq()
print(fibSeq)
//5 задание (заполнить массив 100 простыми числами по Эратосфену)
var simpleNums: [Decimal] = []
var arrCount: Int = 100
while simpleNums.count < 100{
    simpleNums = create_siple_arr(arrCount)
    arrCount += 100
}
if simpleNums.count > 100 {
    let simpleNumsSlice: [Decimal] = Array(simpleNums[0...99])
    print(simpleNumsSlice)
}
print(simpleNums)

