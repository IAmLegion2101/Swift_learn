import Cocoa

/*
1.	Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
2.	1Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
3.	*Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
*/

class GDModel {
    var name: String
    var oilRate: Double
    var size: Int
    var npv: Double
    init(_ name: String, _ oilRate: Double, _ size: Int, _ npv: Double) {
        self.name = name
        self.oilRate = oilRate
        self.size = size
        self.npv = npv
    }
}

struct Queue<T> {
    private var elements: [T] = []
    mutating func push (_ element: T) {
        elements.append(element)
    }
    
    mutating func pop () -> T? {
        if elements.count > 0{
            return elements.removeFirst()
        } else {
            return nil
        }
    }
    
    subscript (index: Int) -> T? {
        if (0..<elements.count).contains(index) {
            return elements[index]
        } else {
            return nil
        }
    }
    
    mutating func filter (closureFunc: (T) -> Bool) -> [T] {
        return elements.filter(closureFunc)
   }
    
    mutating func sorted (closureFunc: (T, T) -> Bool) -> [T] {
        return elements.sorted(by: closureFunc)
   }
}


func sort () {
    
}

var gDModelQueue = Queue<GDModel> ()

gDModelQueue.push(GDModel("Model1", 0.955, 8192, 1.0))
gDModelQueue.push(GDModel("Model2", 0.875, 16384, 0.97))

var filt = gDModelQueue.filter{$0.npv > 0}
for item in filt {
    print(item.name)
}

var sortRes = gDModelQueue.sorted{$0.size > $1.size}
for item in sortRes {
    print(item.name)
}
