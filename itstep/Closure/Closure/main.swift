import Foundation

// замыкание которое отображает текст
let hello = { print("Hello") }

func helloFunc() {
    print("Hello func")
}

// не обязательно писать все на одной строке
let closure2 = {
    print("Second closure")
}

// замыкание с типом возврата, в данном примере Bool
let closure3: () -> Bool = {
    return true
}
// функция с типом возврата целое число
func sumFunc(a: Int, b: Int) -> Int {
    return a + b
}
// функция без типа возврата, (пустая)
func customFunc() -> Void {
    print(1)
}
// прописываем тип возврата для того чтобы в будущем точно знать какой нам нужен для работы
func stringLine(textt: String) -> String {
    return textt
}

//customFunc()
// tempVar это временная константа
let tempVar = "Передал этот текст"
// response это констранта в которой я храню ответ который приходит как return из функций stringLine
let response = stringLine(textt: tempVar)
// делают принт переменной которая хранит ответ
print(response)
// _ нужен чтобы можно было проигнорировать параметры, аргументы и не вписывать при вызове -> отсылка на строку 43
func customFunc2(_ a: Int,_ b: Int) -> Int {
    return a * b
}
print(customFunc2(2, 3))
// здесь перелаю параметр message внутрь замыкания
// in нужен обязательно
let customClosure = { (message: String) in
    // выводим сообщение которое принимаем на экран
    print(message)
}
customClosure("Первый")
customClosure("Второй")
customClosure("Первый")
// передаю две переменных в замыкание sum
let sumClosure = { (_ x: Int,_ y: Int) -> Int in
    return x + y
}

print(sumClosure(2, 5))

let sumClosure2 = { (x: Int, y: Int) -> Int in
    return x * y
}

print(sumClosure2(4, 12))

// функиция operation которая принимает три аргумента
// две цифры и функция
func operation(_ a: Int,_ b: Int, _ action: (Int, Int) -> Int) -> Int {
    // возвращяем ответ который приходит из функций action
    return action(a, b)
}
// глобальные переменные
let x = 10
let y = 12
// приравниваем ответ который приходит из функций operation, но оформляем как замыкание
// запятые нужны потому что передаете три параментра через перечисления
// третий аргумент это функция
let result1 = operation(x, y, { (a: Int, b: Int) -> Int in
    return a + b
})


print(result1)
// приравниваем ответ который приходит из функций operation, но оформляем как замыкание
// запятые нужны потому что передаете три параментра через перечисления
// третий аргумент это функция
var result2 = operation(x, y, {(a: Int, b: Int) -> Int in
    return a - b
})
print(result2)

let result3 = operation(x, y, {(a, b) in
    a - b
})
let result4 = operation(x, y, {(a, b) in
    a + b
})
// $ и индекс значения
let result5 = operation(x, y, {$0 + $1})
let result6 = operation(x, y, {$0 - $1})
print("Result 6: \(result6)")

// функция возвращает замыкание
func action() -> (() -> Int) {
    // локальная переменная
    var val = 0
    // возврат замыкания внутри return
    // {} обозначает использование замыкания
    return {  // {} обозначает использование замыкания
        // увеление на 1
        val = val + 1 
        // возврат финального значения
        return val
    }
}

//func geoIncrement() -> (() -> Int) {
//    var val = 1
//    return {
//        val = Int(pow(val, 2)!)
//        return val
//    }
//}


func increase() -> Int {
    var val1 = 0
    val1 += 1
    return val1
}

let inc = action()
print(inc())
print(inc())
print(inc())


var a = 14
var b = 2
let myClosure: () -> Int = {
    return a + b
}
print("Before: \(myClosure())")

a = 5
b = 6
print("After: \(myClosure())")

var c = 14
var d = 2
// сохраняем значения в [] и после этого они не изменяются
let myClosure2: () -> Int = {
    [c, d] in return c + d
}
print("До \(myClosure2())")
// тестируем изменяя значения
c = 5
d = 6
// результат без изменений
print("После \(myClosure2())")

var num1 = 65
var num2 = 34
var num3 = 123
func check(a: Int, b: Int) {
    // num%10/100
}


var long = 123456
print(long%10/1)
print(long%100/10)
print(long%1000/100)
print(long%10000/1000)
print(long%100000/10000)
print(long%1000000/100000)


func third(num1: Int) {
    let a = num1%10/1
    let b = num1%100/10
    let c = num1%1000/100
    let d = num1%10000/1000
    let e = num1%100000/10000
    let f = num1%1000000/100000
    let sum = a + b + c
    let sum2 = d + e + f
    if sum == sum2 {
        print("Lucky")
    } else {
        print("Unlucky")
    }
}

third(num1: 123456)
