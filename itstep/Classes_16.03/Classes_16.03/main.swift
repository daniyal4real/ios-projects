//
//  main.swift
//  Classes_16.03
//
//  Created by dan on 16.03.2023.
//

import Foundation

class Person {
    // private доступ только внутри данного класса
    private var name: String = "John"
    private var age: Int = 17
    // static относится к классу, но не к объекту
    public static var degree: String = "Master"
    // public доступ есть и вне данного класса
//    public var name1: String = "Alex"
//    public var age1: Int = 19
    
    // метод который показывает значение имени
    func getName() {
        print(name)
    }
    
    // метод называется сэттер и он дает возможность изменять имя
    func setName(name: String) {
        // отсылка на поле name внутри класса Person
        self.name = name
    }
    
    func setName2(newName: String) {
        // отсылка на поле name внутри класса Person
        name = newName
    }
    // геттер используется для получения возраста
    func getAge() -> Int {
        return age
    }
    
    // метод который выводит все детали из объекта
    func detail() {
        print("Name is \(self.name) and he is \(self.age) years old")
    }
    
    func show() {
        print("Name is \(self.name) and he is \(self.age) years old")
    }
}


var person1 = Person()
person1.getName()
print(Person.degree)

//person1.name1 = "Marti"
person1.setName(name: "New name")
person1.getName()
person1.setName2(newName: "Max")
person1.getName()
let vozrast = person1.getAge()
print(vozrast)
//print(person1.name1)
//print(person1.age1)

person1.detail()



class Pencil {
    public var color: String = "red"
    private var length: Double = 14.5
    
    public func show() {
        print("The color is \(color)")
    }
}


var karandash = Pencil()
karandash.show()
// если public, можно менять цвет
karandash.color = "blue"
// если private, нельзя менять длинну
// karandash.length // ERROR


class User {
    var age: Int
    var name: String
    
    
    // конструктор в других языках
    // инициализатор
    // применяется при созданий объекта
    init() {
        age = 22
        name = "Tom "
    }
    // инит нужен чтобы создать объект
    init(name: String, age: Int) {
        self.age = age
        self.name = name
    }
    
    func getUserInfo() {
        print("Имя \(self.name) и возраст \(self.age)")
    }
}

var tom = User()
//print("\(tom.age)")
//print(tom.name)
tom.getUserInfo()
var john = User()
john.age = 40
john.name = "John"
//print(john.age)
//print(john.name)
john.getUserInfo()
var nikolay = User(name: "Nikolay", age: 36)
nikolay.getUserInfo()

class Kvadrat {
    func plochshad() {
        
    }
}
// Area

class User1 {
    var name: String
    var age: Int
    var degree: String
    
    init?(name: String, age: Int) {
        self.name = name
        self.age = age
        if (age < 0 ) {
            // nil значит ноль
            return nil
        }
    }
    
    func getDetail() {
        print("\(self.name) and \(self.age)")
    }
    
    func fire() {
        if self.degree == "uneducated" {
            print("\(self.name) was fired")
        }
    }
}
var bob: User1 = User1(name: "Bob", age: 5)!
print(bob.name)
bob.getDetail()

var max: User1? = User1(name: "Max", age: 18)
max?.getDetail()



class Warrior {
    public var name: String
    public var xp: Int
    
    init(name: String) {
        self.name = name
        xp = 100
    }
    
    func punch(warrior: Warrior) {
        let newXP = warrior.xp - 20
        warrior.xp = newXP
        
        print("Удар получил \(warrior.name)")
        if warrior.xp <= 0{
            print("\(warrior.name) проиграл")
        }
        
        if self.xp <= 0 {
            print("\(self.name) проиграл")
        }
    }
}

var player1 = Warrior(name: "Player1")
var player2 = Warrior(name: "Player2")

//player1.punch(warrior: player2)
//player1.punch(warrior: player2)
//player1.punch(warrior: player2)
//player1.punch(warrior: player2)
//player1.punch(warrior: player2)
//
//player2.punch(warrior: player1)
//print(player2.xp)
//print(player1.xp)


for _ in 0...10 {
    let rand: Int = Int.random(in: 1...2)
    
    if player1.xp <= 0 || player2.xp <= 0 {
        break
    }
    if rand == 1{
        player1.punch(warrior: player2)
    }
    else {
        player1.punch(warrior: player2)
    }
    
//    switch (rand) {
//    case 1:
//
//    case 2:
//
//    default:
//        print("No action")
//    }
}


if player2.degree == "jun" || player1.degree == "jun" {
    
}
