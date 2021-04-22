import Cocoa

/*1.	Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
2.	Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
3.	Создать два класса, имплементирующих протокол «Car»: trunkCar и sportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
4.	Для каждого класса написать расширение, имплементирующее протокол «CustomStringConvertible».
5.	Создать несколько объектов каждого класса. Применить к ним различные действия.
6.	Вывести сами объекты в консоль.
*/

protocol Car {
    var model: String {get set}
    var type: String {get set}
    var year: Int {get set}
    var maxSpeed: Double {get set}
    var isEngineOn: Bool {get set}
    var isWindowOpen: Bool {get set}
    func actionWithCar()
}

extension Car {
    func OpenCloseWindow(windowState: Bool) -> Bool {
        if (windowState) {
            print("the window is closed now")
            return false
        } else {
            print("the window is opened now")
            return true
        }        
    }
    
    func StartStopEngine(engineState: Bool) -> Bool {
        if (!engineState) {
            print("the engine is started")
            return true
        } else {
            print("the engine is stopped")
            return false
        }
    }
    
    func HowLongServe (year: Int, curYear: Int) {
        let delta: Int = curYear - year
        if (delta % 10 == 1) {
            print("car serve \(String(delta)) year")
        } else {
            print("car serve \(String(delta)) years")
        }
    }
}

class sportCar: Car {
    var model: String
    var type: String
    var year: Int
    var maxSpeed: Double
    var isEngineOn: Bool
    var isWindowOpen: Bool
    var hasNtwoO: Bool
    var countrySide: String
    
    init(mark: String, model: String, type: String, year: Int, maxSpeed: Double, isEngineOn: Bool = false, isWindowOpen: Bool = false, hasNtwoO: Bool, countrySide: String) {
        self.model = model
        self.type = type
        self.year = year
        self.isEngineOn = isEngineOn
        self.isWindowOpen = isWindowOpen
        self.maxSpeed = maxSpeed
        self.hasNtwoO = hasNtwoO
        self.countrySide = countrySide
        }
    
    func actionWithCar() {
        <#code#>
    }
    
    var description: String {
        return  "Mark: \(model), Year: \(year), Type: \(type), Country side: \(countrySide)"
    }
    
}

extension sportCar: CustomStringConvertible{
    func printDescription(){
        print(description)
    }
}

class trunkCar: Car {
    var model: String
    var type: String
    var year: Int
    var maxSpeed: Double
    var isEngineOn: Bool
    var isWindowOpen: Bool
    var bagageVol: Int
    var filledBagageVol: Int
    var passability: String
    
    init(mark: String, model: String, type: String, year: Int, maxSpeed: Double, isEngineOn: Bool = false, isWindowOpen: Bool = false, bagageVol: Int, filledBagageVol: Int = 0, passability: String) {
        self.model = model
        self.type = type
        self.year = year
        self.maxSpeed = maxSpeed
        self.bagageVol = bagageVol
        self.filledBagageVol = filledBagageVol
        self.passability = passability
        self.isEngineOn = isEngineOn
        self.isWindowOpen = isWindowOpen
       }
    
    func actionWithCar() {
        <#code#>
    }
    
    var description: String {
        return  "Mark: \(model), Year: \(year), Type: \(type), Passability: \(passability)"
    }
}

extension trunkCar: CustomStringConvertible{
    func printDescription(){
        print(description)
    }
}

var sportCarOne = sportCar(mark: "Nissan", model: "skyline", type: "sport", year: 1994,   maxSpeed: 300, hasNtwoO: true, countrySide: "europe")
sportCarOne.printDescription()
sportCarOne.isWindowOpen = sportCarOne.OpenCloseWindow(windowState: sportCarOne.isWindowOpen)
var truckCarOne = trunkCar(mark: "Volvo", model: "mk1", type: "truck", year: 1985, maxSpeed: 150, bagageVol: 194, passability: "high")
truckCarOne.isEngineOn = truckCarOne.StartStopEngine(engineState: truckCarOne.isEngineOn)
truckCarOne.printDescription()



