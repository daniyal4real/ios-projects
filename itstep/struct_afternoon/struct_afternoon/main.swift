//
//  main.swift
//  struct_afternoon
//
//  Created by dan on 28.03.2023.
//

import Foundation


// у структур init не обязателен
//struct User {
//    var name: String = "Alex"
//    var age: Int = 28
//
//    func getDetails() -> String {
//        return "Name is \(name) and he is \(age) years old"
//    }
//}

// если нет констант, тогда init обязателен
//class Person {
//    var name: String = "Ben"
//    var age: Int = 29
//
//    func getDetails() -> String {
//        return "Name is \(name) and he is \(age) years old"
//    }
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//}

//var user1 = User()
//var person1 = Person()

//print(user1)
//print(person1)
//print(person1.getDetails())



struct Admin {
    var name: String
    var age: Int
    
    func getDetails() -> String {
        return "Name is \(name) and he is \(age) years old"
    }
    
    
    // вызывается когда 2 аргумента
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    // вызывается когда 1 аргумент
    init(name: String) {
        self.init(name: name, age: 30)
    }
    
    // mutating нужен для изменения данных
    mutating func changeAge(newAge: Int) {
        var tempAge = age + 1
        age = tempAge
    }
}

//class Employee {
//    var name: String
//    var age: Int
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//
//
//
//
//
//    func getDetails() -> String {
//        return "Name is \(name) and he is \(age) years old"
//    }
//    // в классе mutating не нужен
//    func changeAge(newAge: Int) {
//        age = newAge
//    }
//
//    // проверка на ноль в имени
//    // если имя пустое тогда срабатывает return
//    func checkGuard()  {
//        var temp = ""
//        guard temp != "" else {
//            return
//        }
//    }
//}
//var admin1 = Admin(name: "Nikolay", age: 30)
//var admin2 = Admin(name: "Timur", age: 35)

//
//var adminTest = Admin(name: "Nikita")
//print(adminTest)
//
//adminTest.changeAge(newAge: 40)
//print(adminTest)
//var employee1 = Employee(name: "", age: 32)
////print(admin1)
//print(employee1.getDetails())
////let result = employee1.checkGuard()
//print(employee1.checkGuard())





class Musician {
    var pseudoname: String
    var name: String
    var concertPrince: Int
    var integrationPrice: Int
    
    init(pseudoname: String, name: String, concertPrince: Int, integrationPrice: Int) {
        self.pseudoname = pseudoname
        self.name = name
        self.concertPrince = concertPrince
        self.integrationPrice = integrationPrice
    }
    
    
    func numberOfShows(money: Int) -> Int {
//        var tempNumber = 0
//        if let input = readLine() {
//            if let number = Int(input) {
//                tempNumber = number
//                print(number)
//            }
//        }
        return Int(money / concertPrince)
    }
    

    
//    func intergateOrNot(money: Int) -> Bool {
//        if integrationPrice > money {
//            return false
//        }
//        return true
//    }
}


// разширение нужно чтобы просто поделить код
extension Musician {
    
    func intergateOrNot(money: Int) -> Bool {
        if integrationPrice > money {
            return false
        }
        return true
    }
    
}

var mark = Musician(pseudoname: "Mark", name: "Markus", concertPrince: 5000, integrationPrice: 6000)
print(mark.numberOfShows(money: 10000))
print(mark.intergateOrNot(money: 20000))



struct Car {
    var motor: Int = 5000
    var brake: Int = 2000
    var wheels: Int = 4000
    
    func whatCanFix(money: Int) {
        if money > motor && money > brake{
            print("Можно чинить мотор и тормозную систему")
        }
    }
}



enum Season {
    case Winter
    case Spring
    case Summer
    case Fall
}


enum Season2 {
    case winter, Spring, Summer, Fall
}
var current = Season2.winter
current = .Fall

let last: Season = .Spring
switch (last) {
case .Winter:
    print("Сейчас зима")
case .Spring:
    print("Cейчас весна")
case .Summer:
    print("Лето")
case .Fall:
    print("Осень")
}


enum Person {
    case Human(String, Int, Double)
    case Elf(String)
}
var hero = Person.Human("Iron man", 30, 2.45)
print(hero)
hero = Person.Elf("Trevor")
print(hero)

switch (hero) {
case .Human:
    print("Играете за человека")
case .Elf:
    print("Играете за эльфа")
}


enum Flagman: String {
    case Apple = "Iphone 14 pro max"
    case Samsung = "Galaxy s23 ultra"
    case Google = "Pixel 7"
    case Nokia = "Lumia 2023"
}
var phone = Flagman.Apple
print(phone)
print(phone.rawValue)


enum DayOfWeek: Int {
    case Monday = 1, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
    
    
    func getCurrentDay() -> String {
        return DayOfWeek.getDay(number: rawValue)
    }
    
    static func getDay(number: Int) -> String {
        switch number {
        case 1: return "Понедельник"
        case 2: return "Вторник"
        case 3: return "Среда"
        case 4: return "Четверг"
        case 5: return "Пятница"
        case 6: return "Суббота"
        case 7: return "Воскресенье"
        default: return "Не день"
        }
    }
    
    var label: String {
        switch self {
        case .Monday: return "Понедельник"
        case .Tuesday: return "Вторник"
        case .Wednesday: return "Среда"
        case .Thursday: return "Четверг"
        case .Friday: return "Пятница"
        case .Saturday: return "Суббота"
        case .Sunday: return "Воскресенье"
        }
    }
}
var day = DayOfWeek.Sunday
print(day.getCurrentDay())
var secondDay = DayOfWeek.getDay(number: 2)
print(secondDay)
var third = DayOfWeek.Wednesday
print(third.label)


class User {
    var name: String
    var surname: String
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
    
    func getFullInfo() {
        print("\(self.name) \(self.surname)")
    }
}

class Employee: User {
    var company: String
    
    init(name: String, surname: String, company: String) {
        self.company = company
        super.init(name: name, surname: surname)
    }
    
    override func getFullInfo() {
        print("\(self.name) \(self.surname) \(self.company)")
    }
}

class Assistant: Employee {
    func multiply() {
        print(4 * 9)
    }
}

class Subassistant: Assistant {
    override func multiply() {
        print(10 * 20)
    }
}
var emp = Employee(name: "Steve", surname: "Jobs", company: "Apple")
emp.getFullInfo()

var assist = Assistant(name: "Mark", surname: "Zuckerberg", company: "Meta")
assist.getFullInfo()
assist.multiply()

var subassist = Subassistant(name: "Jeff", surname: "Bezos", company: "Amazone")
subassist.multiply()



// класс это чертеж
class Instrument {
    // поле -> field
    let brand: String
    // конструктор
    init(brand: String) {
        self.brand = brand
    }
    // метод
    func tune() -> String {
        // особый метод для ошибок
        return "Implement this method for \(brand)"
    }
    
    func play(music: Music) -> String {
        return music.prepared()
    }
    
    func perform(music: Music) {
        print(tune())
        print(play(music: music))
    }
    
}


class Piano: Instrument {
    let hadPedals: Bool
    static let whiteKeys = 52
    static let blackKeys = 36
    
    init(hadPedals: Bool, brand: String) {
        self.hadPedals = hadPedals
        super.init(brand: brand)
    }
    
    
    override func tune() -> String {
        return "Piano standart tuning for \(brand)"
    }
    
    func play(music: Music, usingPedals: Bool) -> String {
        let prepareNotes = super.play(music: music)
        if hadPedals && usingPedals {
            return "Play piano notes \(prepareNotes) with pedals"
        } else {
            return "Piano playing notes \(prepareNotes) without pedals"
        }
    }
    
    override func play(music: Music) -> String {
        return play(music: music, usingPedals: hadPedals)
    }
    
}
// subclass - дочерний класс для Инструмента
class Guitar: Instrument {
    public var numberOfStrings: Int
    
    // инкапсуляция это сокрытие данных
    // применяется модификатор доступа private, чтобы доступ был только внутри класса
    private let material: String
    
    init(numberOfStrings: Int, brand: String, material: String) {
        self.numberOfStrings = numberOfStrings
        self.material = material
        // super.init использует инит из родительского класса
        super.init(brand: brand)
    }
    
    public func showMaterial() -> String {
        return material
    }
    
    private func isGuitar() -> Bool {
        return false
    }
    
    public func callMethod() -> Bool {
        let result = isGuitar()
        return result
    }
    
    public func setNumberOfStrings(numberOfStrings: Int) {
        self.numberOfStrings = numberOfStrings
    }
}

class Acoustic: Guitar {
    
}
class Electric: Guitar {
    
}
class Bass: Guitar {
    
}
var piano1 = Piano(hadPedals: true, brand: "Steilway")
print(Piano.blackKeys)
print(piano1.tune())

var fender = Acoustic(numberOfStrings: 6, brand: "Fender", material: "дерево")
print(fender.numberOfStrings)
print(fender.showMaterial())

var guitar = Guitar(numberOfStrings: 6, brand: "Yamaha", material: "дерево")
print(guitar.callMethod())
guitar.setNumberOfStrings(numberOfStrings: 7)
print(guitar.numberOfStrings)


class Music {
    let notes: [String]
    
    init(notes: [String]) {
        self.notes = notes
    }
    
    func prepared() -> String {
        return notes.joined(separator: "-")
    }
}


var music = Music(notes: ["A", "B", "C", "D"])
print(piano1.play(music: music))
var inst = Instrument(brand: "Yamaha")
//inst.play(music: music)
inst.perform(music: music)


let line = "onetwo"
print(Array(line))
//var arr: [Character] = []
//for i in line {
//    arr.append(i)
//}
//print("Длинна строки \(line.count)")
//print("НОВЫЙ МАССИВ \(arr)")
let points: [[Int]] = [[10, 20], [30, 40]]
print(points[0][0])
print(points[0][1])
print(points[1][0])
print(points[1][1])
print(piano1.play(music: music, usingPedals: false))


//var a = 10
//var b = 1
//print(a > b ? "А больше" : "Б больше")

//repeat {
//    print("А на данный момент равна: \(a)")
//    a = a - 1
//} while a >= b

//
//while a >= b {
//    print("B на данный момент равна: \(b)")
//    b += 1
//}

var range = -10...0
var rev = range.reversed() // 0 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10
for i in rev {
    print("На данный момент i равна \(i)")
}


var numbers = [Int]()

for _ in 0...15 {
    let generate = Int.random(in: -10...20)
    numbers.append(generate)
}
print(numbers)



let letters = 5
let alphabet = "ABCDEFabcdef"
let randChar = (0..<letters).map{_ in alphabet.randomElement()!}
print(String(randChar))


let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
var reversedNames = names.sorted(by: { $0 > $1 })
print(reversedNames)

//if a > b {
//
//}
//if b > a {
//
//}
//else if b > a{
//
//} else {
//
//}

func findLongestZeroSequence(input: String) -> Int {
    var maxCount = 0
    var currentCount = 0
    
    for char in input {
        if char == "0" {
            currentCount += 1
            maxCount = max(maxCount, currentCount)
        } else {
            currentCount = 0
        }
    }
    
    return maxCount
}

var input = "0001011100000110"
input.removeLast()
//let longestSequence = findLongestZeroSequence(input: input)
//print(longestSequence)


var now = 0
var total = 0
for i in input {
    if i == "0" {
        now += 1

        if now > total {
            total = now
        }
    } else {
        now = 0
    }
}
print("Все нули \(total)")


//let height = 7
//let symbol = "*"

//
//for i in 1...height {
//    for j in 1...height - i {
//        print(" ", terminator: "")
//    }
//    for j in 1...2*i-1 {
//        print(symbol, terminator: "")
//    }
//    print()
//}
//
//
//for i in (1...height).reversed() {
//    for j in 1...height - i {
//        print(" ", terminator: "")
//    }
//    for j in 1...2*i-1 {
//        print(symbol, terminator: "")
//    }
//    print()
//}
//
//
//for i in 1...height {
//    for j in 1...i {
//        print(" ", terminator: "")
//    }
//    for j in 1...(height - i)*2+1 {
//        print(symbol, terminator: "")
//    }
//    print()
//}
//
//
//for i in (1...height).reversed() {
//    for j in 1...i {
//        print(" ", terminator: "")
//    }
//    for j in 1...(height - i)*2+1 {
//        print(symbol, terminator: "")
//    }
//    print()
//}
//
//
//for i in 1...height {
//    for j in 1...height-i {
//        print(" ", terminator: "")
//    }
//    for j in 1...i*2-1 {
//        print(symbol, terminator: "")
//    }
//    print()
//}



var line1 = "abcdefg"
var counter = line1.count

repeat {
    line1.removeLast()
    print(line1)
} while !line1.isEmpty


var first1 = 0
var last1 = 7
var star = "        *         "
while first1 < last1 {
//    star.removeFirst()
    star += "*"
    print(star)
    first1 += 1
}
var star2 = "        *         "


var fifth = 123456
var e1 = fifth % 100000 / 10000
var d1 = fifth % 10000 / 1000
var a1 = fifth % 1000 / 100
var b1 = fifth % 100 / 10
var c1 = fifth % 10


print(e1, d1, a1, b1, c1)
var maxx = 1000000
var minn = 10
while maxx >= minn {
    let digit = fifth % maxx / (maxx / 10)
    print(digit)
    maxx /= 10
}

//while first1 < last1 {
//    star2 += "*"
//    print(star2)
//    first1 += 1
//}
//while first1 < last1 {
//    star2
//    print(star2)
//    first1 += 1
//}



var arr1 = [1, 2, 3]
var arr2 = [5, 6, 7]
var arr3 = [Int]() // [ 1 + 5, 2 + 6, 3 + 7 ]
for i in 0..<arr1.count {
    arr3.append(arr1[i] + arr2[i])
}
print(arr3)



//print("Как меня зовут")
//let ans = readLine()
//var pointss = 0
//switch ans {
//case "Даниял":
//    pointss += 1
//case "Другой":
//
//default:
//    print("not any")
//}


    func minOperations(_ n: Int, _ p: Int, _ banned: [Int], _ k: Int) -> [Int] {
        var ans = Array(repeating: -1, count: n)
        ans[p] = 0
        let bannedSet = Set(banned)
        
        for i in 0..<n {
            if bannedSet.contains(i) {
                continue
            }
            if i < p && !bannedSet.contains(p-1) {
                ans[i] = ans[p] + (p-i)
            }
            else if i > p && !bannedSet.contains(p+1) {
                ans[i] = ans[p] + (i-p)
            }
        }
        
        for _ in stride (from: k, to: 0, by: -k) {
            var left = 0
            var right = n - 1
            while left < right {
                if bannedSet.contains(left) {
                    left += 1
                } else if bannedSet.contains(right) {
                    right -= 1
                } else {
                    ans[left] += 1
                    ans[right] += 1
                    left += 1
                    right -= 1
                }
            }
        }
        
        return ans
    }

print(minOperations(4, 0, [1, 2], 4))
