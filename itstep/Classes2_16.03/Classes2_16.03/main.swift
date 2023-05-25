//
//  main.swift
//  Classes2_16.03
//
//  Created by dan on 16.03.2023.
//

import Foundation

// Название класса должно быть с большой буквы
class User {
    // поля fields
    var age: Int
    var name: String
    // пустой
//    init() {
//
//    }
    
    init() {
       age = 10
       name = "Default"
    }
    
    // конструктор используется при созданий объекта
    init(name: String, age: Int) {
        // self это ссылка поле данного класса
        // используем тогда когда у нас одинковые названия
        self.name = name
        self.age = age
    }
    
    // метод method
    func move() {
        print("\(name) передвигается")
    }
}
var damir = User()
// создание объекта
var arsen = User(name: "Arsen", age: 18)
//arsen.name = "Arsen"
// вызов метода из класса User
arsen.move()

var askar = User(name: "Askar", age: 20)
//askar.name = "Askar"
askar.move()



class House {
    var komnaty: Int
    var address: String
    var distict: String = ""
    
    
    init() {
        komnaty = 8
        address = ""
        distict = ""
    }
    
    init(room: Int, addres: String) {
        komnaty = room
        address = addres
        distict = ""
    }
    
    init(room: Int, addres: String, part: String) {
        komnaty = room
        address = addres
        distict = part
    }
}

var dom1 = House()
dom1.komnaty = 7
dom1.address = "Kenesary 100"
print(dom1.komnaty)
print(dom1.address)


var dom2 = House()
let numberOfRoom = dom1.komnaty + dom2.komnaty
print("Сумма всех комнат \(numberOfRoom)")



class Pencil {
    var color: String = "Dark"
    var length: Double = 10
    
    init(color: String, length: Double) {
        self.color = color
        self.length = length
    }
    
    func show() {
        print("Цвет \(self.color) и длинна \(self.length)")
    }
}

var p1 = Pencil(color: "Red", length: 14.5)
var p2 = Pencil(color: "Green", length: 13.5)
var p3 = Pencil(color: "Blue", length: 12.5)
p1.show()
p2.show()
p3.show()


class Person {
    var name: String
    var age: Int
    
  
    init?(name: String, age: Int) {
        self.name = name
        self.age = age
        if (age > 200) {
            return nil
        }
    }
    
    func getDetail() {
        print("\(self.name) is \(self.age) years old")
    }
    
     
}

var bob: Person = Person(name: "Bob", age: 34)!
print(bob.name)
print(bob.age)
bob.getDetail()
var alex: Person? = Person(name: "Alex", age: 20)


if let lora = Person(name: "Lora", age: 250) {
    print(lora.name)
}



class Warrior {
    var name: String
    var health: Int
    var degree: String = "jun"
    init(name: String, health: Int) {
        self.name = name
        self.health = 100
    }
    
    func punch(warrior: Warrior) {
        let newHealth = warrior.health - 20
        warrior.health = newHealth
        
        
        print("\(self.name) сделал удар")
        
        if warrior.health == 0 {
            print("\(warrior.name) проиграл")
        }
        if self.health == 0 {
            print("\(self.name) проиграл")
        }
    }
    
    func fire() {
        if self.degree == "jun" {
            print("уволили джуна")
        }
        
        
        let rol1 = Int.random(in: 1...4)
        let rol2 = Int.random(in: 1...4)
        let rol3 = Int.random(in: 1...4)
        let person1 = rol1
        let person2 = rol2
        let person3 = rol3
        if rol1 < rol2 && rol1 < rol3 {
            
        }
    }
}
var player1 = Warrior(name: "Player1", health: 100)
var player2 = Warrior(name: "Player2", health: 100)

//player1.punch(warrior: player2)
//player1.punch(warrior: player2)
//player1.punch(warrior: player2)
//player1.punch(warrior: player2)
//player2.punch(warrior: player1)
//player2.punch(warrior: player1)
//player2.punch(warrior: player1)
//print(player1.health)
print(player2.health)

for _ in 0...10 {
    
    switch(Int.random(in: 0...1)) {
    case 1:
        player1.punch(warrior: player2)
    case 2:
        
        player2.punch(warrior: player1)
    default:
        print("No action")
    }
}



print("1" + "9")
