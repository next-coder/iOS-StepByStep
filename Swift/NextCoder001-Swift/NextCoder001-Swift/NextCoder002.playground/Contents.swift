//: Playground - noun: a place where people can play

import UIKit


// 函数和闭包
// 函数使用func关键字声明，使用->标识返回值类型
func greet(person: String, day: String) -> String {

    var person1 = person
    person1 = "ewew"
    return "Hello \(person), today is \(day)."
}

greet(person: "Bob", day: "Tuesday")

// 函数参数中通常会包含label，对参数作用进行说明
// 参数label是函数名的一部分，调用函数的时候必须包含
// 默认情况下，函数第一个参数label为kong， 其他参数会使用参数名作为参数label
// 开发者也可以自己制定参数的label，把label写在参数名前面，并用空格与参数名隔开
// 这时候参数名不在作为label，也不包含在label中
// 如下面的day参数，其label为on，调用函数的时候，带上label "on" 就行了
func greet(person: String, on day: String) -> String {

    return "Hello \(person), today is \(day)."
}

greet(person: "Bob", on: "Tuesday")

func greet(person: String, _ day: String) -> String {

    return "Hello \(person), today is \(day)."
}

greet(person: "Bob", "Tuesday")


// 函数也可以接收可变参数，接收形式为数组
func sumOf(numbers: Int...) {

    print(numbers)
}

//sumOf()
sumOf(numbers: 12, 23, 32, 43)


// 闭包(closure)就是指一段定义之后，可以随时调用的代码
// 闭包可以接收参数，可以有返回值
// 函数就是一种特殊的闭包 (String, String) -> String
// 闭包类型的定义方式: (Int, Int) -> Int
// 前面小括号是接收的参数类型列表，->后面是返回值类型
func makeIncrementer() -> ((Int) -> Int) {

    func addOne(number: Int) -> Int {

        return 1 + number
    }
    return addOne
}

let closure1 = makeIncrementer
closure1()

let closure2 = closure1()
print(closure1)
print(closure2)
print(makeIncrementer)



// 闭包的写法如下
// 用{}包含整个闭包内容，首先声明closure的类型，然后接关键字in
// in的后面是闭包的代码，类似与函数体
var closure3: ((Int) -> Int) = {

    (intParam: Int) -> Int in

    return intParam + 1
}

closure3(3)

//var closure4 = closure3
//closure4(3)

print(closure3)
print(closure3(2))

//closure3 = {
//
//    (string: String) -> Int in
//
//    return 1
//}

// 已知closure类型之后，可以在closure类型部分只写参数列表，不用标识closure类型
closure3 = {

    param in

    return param + 2

}

closure3(10)


let closure4: ((Int, Int) -> Int) = {

    param1, param2 in

    return param1 + param2

}

closure4(12, 11)

// 还可以通过参数的位置来访问，$+参数位置来访问，如下
// closure5与closure4实现的是同样功能
let closure5: ((Int, Int) -> Int) = {

    return $0 + $1

}

closure5(22, 22)


// 闭包的特性
// 闭包可以访问外部变量
// 闭包能够在函数和对象之间相互传递
// 闭包的实现能够嵌入到逻辑中，易于写出容易理解的代码
func closureTest1(_ param: Int, closure4: ((Int, Int) -> Int)) {

    print(closure4(10, 10))
}

let v3 = 23

func closureTest2() {

    let v1 = 12
    let v2 = 13

//    let closure4: ((Int, Int) -> Int) = {
//
//        param1, param2 in
//
//        return param1 + param2
//        
//    }
//
//    closureTest1(10, closure4: closure4)

    closureTest1(10, closure4: {

        param1, param2 in

        return param1 + param2 + v1 + v2 + v3
    })
}

closureTest1(10, closure4: {

    return $0 + $1
})

// 闭包作为函数最后一个参数时，可以把闭包的实现写在函数调用外面，紧跟函数调用后面
closureTest1(10) {

    return $0 * $1
}

// 闭包的实际使用场景
var array = [["a": 23, "b": 323], ["a": 23], ["a": 23], ["a": 23], ["a": 2123], ["a": 2321], ["a": 23]]
array.sort {

    (param1: [String: Int], param2: [String: Int]) -> Bool in

    if (param1["a"] == param2["a"]) {

        return param1["b"] < param2["b"]
    }
    return param1["a"] < param2["a"]

}

array

let array1 = array.sorted {

    (param1: [String: Int], param2: [String: Int]) -> Bool in

    if (param1["a"] == param2["a"]) {

        return param1["b"] < param2["b"]
    }
    return param1["a"] < param2["a"]
}


// 类和对象
// 使用class关键字定义类
// 使用var或let定义类中的可变属性和常量属性
// 使用func定义类的实例方法
// 使用class func定义类方法
class Shape {

    var numberOfSides = 0
    let aaa = 23

    func simpleDescription() -> String {

        return "A shape with \(numberOfSides) sides."
    }

    class func rectShape() -> Shape {

        let shape = Shape()
        shape.numberOfSides = 4
        return shape
    }
}

// 创建对象，直接用类名接()
var shape = Shape()

// 类的初始化方法用init关键字定义
// 类中的属性，要么在声明的时候给初值，要么必须在初始化方法中给初值，否则无法通过编译
// 尝试吧init方法注释掉，看看会有什么效果
class NamedShape {

    var numberOfSides = 0
    var name: String

    init(name: String) {

        self.name = name
    }

    func simpleDescription() -> String {

        return "A shape with \(numberOfSides) sides."
    }
}

// 类继承其他类是，把父类写在子类名后面，用:隔开
class Square: NamedShape {

    var sideLength: Double {

        willSet {


        }

        didSet {


        }
    }

//    var area: Double {
//
//        get {
//
//            return sideLength * sideLength
//        }
//    }

    init(sideLength: Double, name: String) {

        self.sideLength = sideLength
        super.init(name: name)
    }

//    func area() -> Double {
//
//        return sideLength * sideLength
//    }

    // 继承父类的方法是，必须加上override
    override func simpleDescription() -> String {

        super.simpleDescription()
        return "A square with sides of length \(sideLength)"
    }
}

// 方法调用采用.语法
let test = Square(sideLength: 5.2, name: "my test square")
test.simpleDescription()
test.sideLength = 3

// 练习，创建一个Circle(圆)类，增加area方法计算圆面积，继承simpleDescription方法


//var aaaa: Double = nil

// optionals，可选
// 标识变量或常量的值可能为空
// Swift中的空用nil表示，不同于Java和C的NULL
// optional的声明，采用在类型后加?的方式
var serverResponseCode: Int? = 404
serverResponseCode = nil

var aaaaa: Double? = nil

// 定义optional变量或常量，并且没给初始值时，默认就是nil
// nil代表的是缺省值，所有的optional的值都可以是nil
// 判断optional是否为空时，才用==或!=来跟nil比较
if serverResponseCode == nil {

    print("serverResponseCode is nil")
}

// 获取optional中的值
// 强制获取optional的值，在optional变量或常量后加!
// 如果optional值是nil，这种方式就会抛出异常
serverResponseCode = 404
if serverResponseCode != nil {

    print(" is \(serverResponseCode!)")
}
if serverResponseCode != nil {

    print(" is \(serverResponseCode)")
}

// 还可以使用optional binding来获取optional的值
// optional binding可以使用在if/while/guard中
if let serverResponseCodeValue = serverResponseCode {

    print(" is \(serverResponseCodeValue)")
} else {

    print("serverResponseCode is nil")
}

if let firstNumber = Int("4"), let secondNumber = Int("23") , firstNumber < 2 {

    print("\(firstNumber) < \(secondNumber)")
} else {

    
}

// 练习，思考之前因为有空而无法实现的代码，重新实现
// 了解Array.sort方法的原理，模仿Array.sort自己实现一个sort函数，对数组进行排序，由于此处还没有接触到泛型，Array的类型可以固定成Int，Double等，需要用到闭包
// 实现一个Person类，里面包含身高(cm)、体重(kg)、姓名、学历，学历默认值是"学士"
// Person类中增加方法计算健康程度，身高/体重 > 1.6 则返回肥胖， 1.2 < 身高/体重 < 1.6 则返回健康， 身高/体重 < 1.2 偏瘦
// 实现一个Student类，里面包含学号、班级、成绩。继承Person类
// 实现一个方法，把成绩按一下方式分成ABCDE等级。>=90为A，80~90为B，70~80为C，60~70为D，<60为E
// 创建上面两个类的实例，并且测试实现的方法和属性

























