//
//  main.swift
//  Homework_4
//
//  Created by Антон on 17.04.2021.
//

/*
1.	Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
2.	Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
3.	Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет TrunkCar, а какие – SportCar. Добавить эти действия в перечисление.
4.	В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
5.	Создать несколько объектов каждого класса. Применить к ним различные действия.
6.	Вывести значения свойств экземпляров в консоль.
*/

import Foundation

enum WindowState{
    case opened
    case closed
}

enum EngineState{
    case powerOn
    case powerOff
}

enum Actions{
    case powerOff
    case powerOn
    case winOpen
    case winClose
    case addBag(cargo: Int)
    case removeBag(cargo: Int)
    case getState
    case actNtwoO
    case deactNtwoO
    case canPass
}

class Car {    
    var mark: String
    var model: String
    var type: String
    var year: Int
    var maxSpeed: Double
    var isEngineOn: EngineState
    var isWindowOpen: WindowState
    
    init(mark: String, model: String, type: String, year: Int, maxSpeed: Double, isEngineOn: EngineState = .powerOff, isWindowOpen: WindowState = .closed) {
        self.mark = mark
        self.model = model
        self.type = type
        self.year = year
        self.maxSpeed = maxSpeed
        self.isEngineOn = isEngineOn
        self.isWindowOpen = isWindowOpen
    }
    
    func actionsWithCar(action: Actions) {
            print("do actions with a car: " + self.mark + "...")
            switch action {
            case .powerOn:
                self.isEngineOn = .powerOn
                print ("Car do: 'Wrom-wrom'")
            case .powerOff:
                self.isEngineOn = .powerOff
                print ("Car is silent")
            case .winOpen:
                print("Windows opened")
            case .winClose:
                print("Windows opened")
            case .getState:
                print( "Mark: \(mark), Year: \(year), Engine state: \(isEngineOn), Window state: \(isWindowOpen)")
            default:
                print("u can't do it with this car!")
                
            }
        }
}

class sportCar:Car {
    var hasNtwoO: Bool
    var countrySide: String
    init(mark: String, model: String, type: String, year: Int, maxSpeed: Double, isEngineOn: EngineState = .powerOff, isWindowOpen: WindowState = .closed, hasNtwoO: Bool, countrySide: String) {
        self.hasNtwoO = hasNtwoO
        self.countrySide = countrySide
        super.init(mark: mark, model: model, type: type, year: year, maxSpeed: maxSpeed, isEngineOn: isEngineOn, isWindowOpen: isWindowOpen)
    }
    
   override func actionsWithCar(action: Actions) {
        switch (action) {
        case .actNtwoO:
            if (self.hasNtwoO) {
                print("N20 activated!")
            } else {
                print("car hasn't N20")
            }
        case .deactNtwoO:
            if (self.hasNtwoO) {
                print("N20 deactivated!")
            } else {
                print("car hasn't N20")
            }
        default:
            super.actionsWithCar(action: action)
        }
    }
}

class trunkCar:Car {
    var bagageVol: Int
    var filledBagageVol: Int
    var passability: String
    init(mark: String, model: String, type: String, year: Int, maxSpeed: Double, isEngineOn: EngineState = .powerOff, isWindowOpen: WindowState = .closed, bagageVol: Int, filledBagageVol: Int = 0, passability: String) {
        self.bagageVol = bagageVol
        self.filledBagageVol = filledBagageVol
        self.passability = passability
        super.init(mark: mark, model: model, type: type, year: year, maxSpeed: maxSpeed, isEngineOn: isEngineOn, isWindowOpen: isWindowOpen)
    }
    
    override func actionsWithCar(action: Actions) {
        switch (action) {
        case .addBag(let cargo):
            let freeVol: Int = bagageVol - filledBagageVol
            if (cargo > freeVol) {
                print("U cant add cargo. Free space: " + String(freeVol))
            } else if (cargo == freeVol) {
                filledBagageVol += cargo
                print ("cargo added. Bagage is full")
            } else {
                filledBagageVol += cargo
                print ("cargo added. Free space: " + String(freeVol))
            }
        case .removeBag(let cargo):
            if (cargo > filledBagageVol) {
                print("No such cargo")
            } else if (cargo == filledBagageVol) {
                filledBagageVol -= cargo
                print ("cargo removed. Bagage is empty")
            } else {
                filledBagageVol -= cargo
                print ("cargo removed. Cargo left: " + String(filledBagageVol))
            }
        case .canPass:
            if (passability == "high") {
                print("your truck can ride everywhere")
            } else if (passability == "medium") {
                print("your truck can ride in city and village")
            } else if (passability == "low") {
                print("your truck can ride only in city ")
            }
        default:
            super.actionsWithCar(action: action)
            
        }
    }
}

var sportCarOne = sportCar(mark: "Nissan", model: "skyline", type: "sport", year: 1994,   maxSpeed: 300, hasNtwoO: true, countrySide: "europe")

var truckCarOne = trunkCar(mark: "Volvo", model: "mk1", type: "truck", year: 1985, maxSpeed: 150, bagageVol: 194, passability: "high")

sportCarOne.actionsWithCar(action: .powerOn)
sportCarOne.actionsWithCar(action: .actNtwoO)
sportCarOne.actionsWithCar(action: .addBag(cargo: 200))
truckCarOne.actionsWithCar(action: .powerOn)
truckCarOne.actionsWithCar(action: .addBag(cargo: 150))
truckCarOne.actionsWithCar(action: .actNtwoO)
