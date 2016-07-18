//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// 控制台打印
print("Hello world!")

// let关键字声明常量，var关键字声明变量
var myVariable = 42
myVariable = 41
let myConstant = 23
//        myConstant = 2    // 报错，常量不可修改

// 变量和常量的类型是固定的，一旦类型确定，则只能存储此类型的值
var myVariableInt: Int = 23
// 报错，Int变量不能接收浮点型数据
//        myVariableInt = 23.2
// 数值本身类型是可变的，编译器会根据数值在当前表达式作用，选用合适的类型
// 比如下面23赋给Float变量，则23就是Float型的
var myVariableFloat: Float = 23
myVariableFloat = 34
myVariableFloat = 23.3

var myVariableDouble: Double = 23
myVariableDouble = 32
myVariableDouble = 232.32

// 报错，Float不会自动转换成Double
// Swift所有类型之间都不会自动转换
//        myVariableDouble = myVariableFloat

// 要把Float型变量赋值给Double型，必须创建一个Double对象
// 用Float型变量值去初始化此Double对象
myVariableDouble = Double(myVariableFloat)

// 声明变量或常量的时候，如果有初始值，则可以不需要声明类型
// 编译器会根据初始值关联出变量或常量类型
// 如下面，初始值为23，则编译器关联出myVariableInt1的类型是Int
// 整型数据会关联成Int类型，浮点型数据会关联成Double类型，对象数据会关联成对应的类
var myVariableInt1 = 23

var myVariable3 = Double(23)
// 如果不满足默认的关联类型，则需要声明类型
var myVariableFloat1: Float

// 字符串
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

// 下面更简单的方式，把一个变量或常量值包含在字符串中
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) fruit."

// 数组和字典
// 数组和字典都可以通过中括号来创建[]
// 数组和字典都是struct类型，声明成常量，则类容也不能修改
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic"
]
occupations["Jayne"] = "Public Relations"

shoppingList[0] = "fdafsaf"
shoppingList.append("fdafasd")

// 报错，let数组，内容不可修改
//        shoppingList.append("fdfd")

// 创建空数组和字典
let emptyArray = [String]()
let emptyArray1 = Array<String>()
let emptyDictionary = [String: Float]()
let emptyDictionary1 = Dictionary<String, Float>()

// 字典和数组清空，已经确定类型的数组或字典，清空直接可以用以下方式
var shoppingList1 = ["catfish", "water", "tulips", "blue paint"]
shoppingList1 = []

var occupations1 = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic"
]
occupations1 = [:]

// 控制语句
// if , switch-case
// for-in, for, while, repeat-while
// 控制语句的"()"是可选的，“{}”必须有

// if语句的条件必须是Bool类型
let ifTextInt = 23
if ifTextInt == 23 {

    print("ifTextInt is 23")
} else if ifTextInt == 22 {

    print("ifTextInt is 22")
} else {

    print("ifTextInt unknown")
}

// 下面的if是错误的，条件是Int，而不是Bool
//        if ifTextInt {
//
//            print("ifTextInt = \(ifTextInt)")
//        }

// switch-case的条件可以是任何类型
// switch-case的每个case代码块默认有break功能，不需要再写break
// 练习，去掉default，看看会报什么错误
let vegetable = "red pepper"
switch vegetable {

case "celery":
    print("Add some raisins adn make ants on a log.")

case "cucumber", "watercress":
    print("That would make a good tea sandwich.")

case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)")

default:
    print("Everything tastes good in soup")
}

// for-in遍历数组和字典
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {

    if score > 50 {

        teamScore += 3
    } else {

        teamScore += 1
    }
}
print(teamScore)


// 练习，在下面的基础上，标识出最大值的类型
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]
var largest = 0
for (kind, numbers) in interestingNumbers {

    for number in numbers {

        if number > largest {

            largest = number
        }
    }
}
print(largest)

// for-in的其他用法
// 练习，把下面..<改成...
var total = 0
for i in 0..<4 {

    total += i
}
print(total)

// while, repeat-while
var n = 2
while n < 100 {

    n *= 2
}

var m = 2
repeat {

    m *= 2
} while m < 100

// 终极练习，用swift，写一个排序算法
// 排序对象是一个数组，排序算法自定
