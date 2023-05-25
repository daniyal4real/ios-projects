//
//  main.swift
//  protocol_day
//
//  Created by dan on 30.03.2023.
//

import Foundation

protocol Animals {
    func eat() -> Void
    func sleep() -> String
    func hunt() -> String
}

protocol Specific: Animals {
    func eat() -> Void
    func sleep() -> String
    func hunt() -> String
    func dance()
}

class Bird: Animals {
    
    var type: String
    var group: String

    init(type: String, group: String) {
        self.type = type
        self.group = group
    }

    func eat() -> Void{
        print("Питаются зерном")
    }

    func sleep() -> String {
        return "Птица спит"
    }

    func hunt() -> String {
        return "Птица вышла на охоту"
    }
}


//class Bird {
//    var type: String
//    var group: String
//
//    init(type: String, group: String) {
//        self.type = type
//        self.group = group
//    }
//
//    func eat() -> Void{
//        print("Питаются зерном")
//    }
//
//    func sleep() -> String {
//        return "Птица спит"
//    }
//
//
//}

class Fish: Animals {
    
    var type: String
    var group: String
    
    init(type: String, group: String) {
        self.type = type
        self.group = group
    }
    
    func eat() -> Void {
        print("Питаются коралами")
    }
    
    func sleep() -> String {
        return "Рыба спит"
    }
    
    func hunt() -> String {
        return "Рыба вышла на охоту"
    }
    
    
}

class Whale: Specific {
    func eat() {
        print("Кит питается")
    }
    
    func sleep() -> String {
        return "Кит спит"
    }
    
    func hunt() -> String {
        return "Кит вышел на охоту"
    }
    
    func dance() {
        print("Кит танцует")
    }
}



var eagle = Bird(type: "Flying", group: "Predator")
var sudak = Fish(type: "Sea fish", group: "Marine predator")

eagle.eat()
print(eagle.sleep())
print(eagle.hunt())
sudak.eat()
print(sudak.sleep())
print(sudak.hunt())

var orca = Whale()
print(orca.hunt())
orca.dance()
orca.eat()
print(orca.sleep())


protocol FullyNamed {
    var fullName: String { get }
    var lastName: String { get set }
}

struct Person: FullyNamed {
    var lastName: String
    
    var fullName: String
}


struct Human: FullyNamed {
    var lastName: String
    
    var fullName: String
}
//let john = Person(fullName: "John Addams")
//print(john.fullName)
var p = Person(lastName: "Addams", fullName: "John Addams")
print(p.fullName)
print(p.lastName)
p.fullName = "Tomas Kane"
p.lastName = "Kane"
print(p.fullName)
print(p.lastName)


protocol Round {
    var radius: Double { get set }
    var diameter: Double { get set }
    func area()
    func length()
    func print1()
}

class Circle: Round {
    var radius: Double
    
    var diameter: Double
    
    init(radius: Double, diameter: Double) {
        self.radius = radius
        self.diameter = diameter
    }
    
    func area() {
        print(3.14 * radius * radius)
    }
    
    func length() {
        print(3.14 * radius * 2)
    }
    
    func print1() {
        print("")
    }
    
}

var circle = Circle(radius: 5, diameter: 10)
circle.area()
circle.length()


protocol NewsData {
    var listOfNews: [Int: String] { get set }
    
    func add(newValue: String)
    
    func remove(key: Int)
}


class News: NewsData {
    var listOfNews: [Int: String]
    
    init(listOfNews: [Int : String]) {
        self.listOfNews = listOfNews
    }
    
    func add(newValue: String) {
        listOfNews[listOfNews.count + 1] = newValue
    }
    
    func remove(key: Int) {
        listOfNews.removeValue(forKey: key)
    }
    
    func last(key: Int) {
        print(listOfNews.sorted(by: <))
    }
}

