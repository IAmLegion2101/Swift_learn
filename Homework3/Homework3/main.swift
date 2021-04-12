//
//  main.swift
//  Homework3
//
//  Created by Антон on 12.04.2021.
//

import Foundation

enum Window_state{
    case opened
    case closed
}

enum Engine_state{
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
}

struct Car {
    let mark: String
    let year: Int
    var bagageVol: Int
    var isEngineOn: Engine_state
    var isWindowOpen: Window_state
    var filledBagageVol: Int
    init (mark: String, year: Int, bagageVol: Int, isEngineOn: Engine_state = .powerOff, isWindowOpen: Window_state = .closed, filledBagageVol: Int = 0){
        self.mark = mark
        self.year = year
        self.bagageVol = bagageVol
        self.isEngineOn = isEngineOn
        self.isWindowOpen = isWindowOpen
        self.filledBagageVol = filledBagageVol
    }
    mutating func actions_with_car(action: Actions){
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
        case .addBag(let cargo):
            let freeVol: Int = bagageVol - filledBagageVol
            if cargo > freeVol{
                print("U cant add cargo. Free space: " + String(freeVol))
            }else if cargo == freeVol{
                filledBagageVol += cargo
                print ("cargo added. Bagage is full")
            }else{
                filledBagageVol += cargo
                print ("cargo added. Free space: " + String(freeVol))
            }
        case .removeBag(let cargo):
            if cargo > filledBagageVol{
                print("No such cargo")
            }else if cargo == filledBagageVol{
                filledBagageVol -= cargo
                print ("cargo removed. Bagage is empty")
            }else{
                filledBagageVol -= cargo
                print ("cargo removed. Cargo left: " + String(filledBagageVol))
            }
        case .getState:
            print( "Mark: \(mark), Year: \(year), Bagage vol: \(bagageVol),Filled Bagage Vol: \(filledBagageVol), Engine state: \(isEngineOn), Window state: \(isWindowOpen)")
        }
        
    }
    
}

var carOne = Car(mark: "Honda", year: 1994, bagageVol: 194)
carOne.actions_with_car(action: .powerOn)
carOne.actions_with_car(action: .addBag(cargo: 190))
carOne.actions_with_car(action: .addBag(cargo: 4))
carOne.actions_with_car(action: .getState)
carOne.actions_with_car(action: .addBag(cargo: 100))
carOne.actions_with_car(action: .removeBag(cargo: 180))
carOne.actions_with_car(action: .getState)
carOne.actions_with_car(action: .removeBag(cargo: 100))
carOne.actions_with_car(action: .removeBag(cargo: 14))
carOne.actions_with_car(action: .winOpen)
carOne.actions_with_car(action: .winClose)
carOne.actions_with_car(action: .powerOff)
carOne.actions_with_car(action: .getState)
