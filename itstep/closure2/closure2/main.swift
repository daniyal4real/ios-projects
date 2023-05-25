//
//  main.swift
//  closure2
//
//  Created by dan on 14.03.2023.
//

import Foundation
import SwiftUI



//print("Hello, World!")

//func sum(a: Int, b: Int, action: (Int, Int) -> Int) -> Int{
//
//}

// синтаксис замыкания
let hello = {
    // внутри скобок прописываем функционал
    print("Hello World")
}

// обычная функция
func helloFunc() {
    print("Hello World")
}


hello()
// Void это пустота, нет возврата
let hello3: () -> Void = {
    print("Hello World")
}

// в функций можно писать без войд если нет возврата
func sum(a: Int, b: Int) -> Void {
    print(a + b)
}
sum(a: 12, b: 13)

func sum2(a: Int, b: Int) {
    print(a + b)
}

func area(a: Int, b: Int) -> Int{
    return a * b
}

//let s = area(a: 10, b: 12)
let v = area(a: 10, b: 12) * 6
//sumWithReturn(a: 12, b: 10)
//print(v)

// замыкание с параметром сообщения
let customClosure = { (message: String) in print(message) }


customClosure("First")
customClosure("Second")
customClosure("Third")

// замыкание для суммирования двух чисел
let sumClosure = { (x: Int, y: Int) -> Int in
    return x + y
}
print(sumClosure(9, 11))

func divide(first: Int, second: Int) -> Int {
    return first / second
}
print(divide(first: 10, second: 5))


// _ нужно чтобы при вызове функций не показывать название аргументов
func divide2(_ first: Int, _ second: Int) -> Int {
    return first / 2
}
print(divide2(2, 1))

// ввод через клавиатуру -> readline()
//let str = readLine()
//print(str)


// функция принимает три параметра,
func operation(_ a: Int, _ b: Int, _ action: (Int, Int) -> Int) -> Int {
    return action(a, b)
}
let x = 10
let y = 12

let result1 = operation(x, y, { (a: Int, b: Int) -> Int in
    return a + b
})

print("Result1 : \(result1)")

let result2 = operation(x, y, { (a, b) in a - b})
print("Result2: \(result2)")

let result3 = operation(x, y, { $0 + $1 })
print("Result3: \(result3)")

// увеличение цивр с нуля до количества раз которое используется
func increase() -> (() -> Int) {
    var value1 = 10
    return {
        value1 -= 1
        return value1
    }
}
let res = increase()

print(res()) // 1
print(res()) // 2
print(res()) // 3


var a = 14
var b = 2
// возврат суммы
let myClosure: () -> Int = {
    return a + b
}
print("First call: \(myClosure())") // 16
a = 10
b = 11
print("Second call: \(myClosure())") // 21

// сохрание первых значений а и b
// [] имеют предидущие показатели
let myClosure2: () -> Int = {
    [a, b] in return a + b
}
print("До изменения \(myClosure2())")
a = 5
b = 2
print("После изменения \(myClosure2())")


func forth(a: Int, b: Int = 0) {
    if b == 0 {
        
    }
}


var first = 10
var second = 7
var third = 2020
let res1 = { (first: Int, second: Int, third: Int) -> Void in
    var status = false
    if third % 400 == 0 || ((third % 4 == 0) && third % 100 != 0) {
        status = true
    }
    var temp = 0
    if status && second == 2 && first == 28 && first < 32{
        temp = first + 1
        print("\(temp)." + "\(second+1)." + "\(third)")
    } else {
        temp = second + 1
        print("\(temp+1)." + "\(second)." + "\(third)")
    }
}
res1(20, 2, 1600)

var arr: [Int] = []

//let secondTask = { (num: Int) in
//    var temp = 1
//    if num < 0 {
//        print("Err")
//    }
//    for i in 1...num {
//        temp *= i
//    }
//    print(temp)
//}
//secondTask(4)
