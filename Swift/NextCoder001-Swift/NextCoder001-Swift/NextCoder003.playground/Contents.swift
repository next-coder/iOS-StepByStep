//: Playground - noun: a place where people can play

import UIKit


// optional chaining
// optional类型在无需判断是否为空的情况下，直接调用方法或属性
var array: Array<String>? = nil
if Int.max == 23233 {

    array = [String]()
} else {

    array = [String]()
}

array?.append("22222")

let element = array?.removeAtIndex(0)
print(element)

array?.append("fdfdfdfd")

let compareResult = array?.removeAtIndex(0).compare("fdfdf")
print(compareResult)


// Int 数据
// Int 在32位操作系统上，长度为4个字节；在64位操作系统上，长度为8个字节；
// iPhone5及以前的设备是32位，iPhone5s及之后的设备为64位
print(Int.max)
print(Int.min)
print(sizeof(Int))

print(UInt.max)
print(UInt.min)
print(sizeof(UInt))

// 整型数据还有以下类型，所有的以下类型，还有对应的Usigned类型
// 比如UInt8 UInt16等

print("Int8 : ")
print(Int8.max)
print(Int8.min)
print(sizeof(Int8))

print("Int16 : ")
print(Int16.max)
print(Int16.min)
print(sizeof(Int16))

print("Int32 : ")
print(Int32.max)
print(Int32.min)
print(sizeof(Int32))

print("Int64 : ")
print(Int64.max)
print(Int64.min)
print(sizeof(Int64))


// 浮点型数据
// Double是8个字节，Float是4个字节
print(sizeof(Double))
print(sizeof(Float))

//// 数值不能溢出
//let int8: Int8 = Int8.max + 1

// 数值除法
// 不同类型之间无法直接运算
let param1 = 23
let param2 = 12
let result = param2 / param1
let result4 = 12 / 23

let result1: Double = Double(param2 / param1)
let result2: Double = 12 / 23

//let result5 = result / result2


// 类型别名
// 类型别名使用typealias关键字
typealias AudioSample = UInt16

// 别名的类型跟原类型使用起来一样，方法和属性都可以共用
var maxAmplitudeFound = AudioSample.min


// 布尔值Bool（true, false）
// 所有判断条件的地方，只能接受布尔值
let orangesAreOrange: Bool = true


// tuples，元组
// 一组用()组合起来的值，可以以一个整体在对象、方法中传递
// 也能够很方便的获取其中每项的值
// 有点类似于数组和字典
// http404Error is of type (Int, String), and equals (404, "Not Found")
// 下面的元组就是一种类型为(Int, String)的元组
var http404Error = (404, "Not Found")
http404Error = (405, "Not Found1")
//http404Error = ("Not Found1", "Not Found1")

// 可以用以下方式获取元组中的值
// 只想要其中一个值，则其他可以用_代替
let (statusCode, message) = http404Error
print("The status code is \(statusCode)")
print("The message is \(message)")

let (statusCode1, _) = http404Error


let http200Status = (statusCode: 200, description: "SUCCESS")
print("The status code is \(http200Status.statusCode)")
print("The message is \(http200Status.description)")

// 避免使用这种方式，代码很不清晰
print("The status code is \(http404Error.0)")
print("The message is \(http404Error.1)")


// 枚举和结构体
// 使用enum关键字创建枚举类型, case关键字声明枚举值
// 枚举的原始值可以是整型，浮点型或字符串型
// 枚举的默认原始值是整型，从0开始，每个值加1
// 通过在枚举名后，声明枚举的原始值类型，中间用:隔开
// 枚举可以包含方法
enum Rank: Int {

    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

//    case mike = "mike"

    func simpleDescription() -> String {

        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queue"
        case .king:
            return "king"
        default:
            // 通过rawValue属性获取枚举的原始值
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
ace.simpleDescription()
ace.rawValue

// 枚举也可以没有原始值
enum Suit {

    case spades, hearts, diamonds, cluds

    func simpleDescription() -> String {

        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .cluds:
            return "cluds"
        }
    }
}

let hearts = Suit.hearts
//hearts.rawValue
hearts.simpleDescription()

// 通过原始值初始化枚举，得到的是optional类型
let aceOptional = Rank(rawValue: 1)

// 枚举每个值可以有关联数据
enum ServerResponse {

    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("Success", "Result Detail")
let failure = ServerResponse.failure("Out of cheese.")

switch success {

case let .result(summary, detail):
    print("\(summary), \(detail)")

case let .failure(detail):
    print(detail)
}


// 结构体
// 使用struct定义结构体
// 结构体的属性和方法，跟类一样
struct Card {

    var rank: Rank
    var suit: Suit

    func simpleDescription() -> String {

        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }

    // struct中，需要修改struct内容的方法，必须用mutating标识
    mutating func resetCard() {

        rank = Rank.ace
        suit = Suit.spades
    }

    mutating func resetCard1() {


    }

    static func structDescription() -> String {

        return "Card"
    }
}

var card1 = Card(rank: Rank.ace, suit: Suit.spades)
card1.resetCard()

// 结构体与类的区别
// 1、结构体不能继承
// 2、结构体在类或函数之间传递的时候，总是拷贝，而类总是传递引用
// 3、结构体默认的初始化方法，由所有属性组成参数列表，同时，所有参数都带有属性名的标签。如上面Card的初始化方法是init(rank rank: Rank, suit suit: Suit)
// 4、结构体中的静态方法必须用static关键字
// 5、let声明的结构体常量，结构体里的内容也是不可修改的

// mutating的作用是，当声明一个常量Card时，mutating标识的方法不可调用
let card2 = Card(rank: Rank.ace, suit: Suit.spades)
// 报错
//card2.resetCard()
//card2.resetCard1()


let card = Card(rank: Rank.ace, suit: Suit.spades)
card.simpleDescription()


// 协议和扩展(Protocols/Extensions)
// 协议就类似于Java的Interface，定义方法和属性
//  使用protocol定义协议
protocol ExampleProtocol {

    var simpleDescription: String { get }

    mutating func adjust()

    func anotherFunc()
}

protocol ExampleProtocol2 {


}

// 类、枚举和结构体都可以实现协议
// 实现协议的写法，跟继承类一样
struct Card1: ExampleProtocol {

    var description: String

    var simpleDescription: String {

        return description
    }

    // 如果要修改结构体中的内容，方法前面必须用mutating标识
    mutating func adjust() {

        description = "after adjust"
    }

    // 没有用mutating标识的方法无法修改结构体中的内容
    func anotherFunc() {

        // cannot change struct properties
//        description = "fdfdf"
    }
}

// 如果类既继承类某个类，有实现了协议，则父类必须写在第一个，协议写在后面，用逗号分隔
class BaseClass {

    var description: String = ""
}

class ProtocolTestClass: BaseClass, ExampleProtocol, ExampleProtocol2 {

    var simpleDescription: String {

        return "UIView subclass"
    }

    // 类的所有方法都可以修改属性，故不需要mutating
    func adjust() {

        self.description = "after adjust"
    }

    func anotherFunc() {

        self.description = "after another func"
    }
}

// 协议编程
let protocolValue: ExampleProtocol = ProtocolTestClass()


// 扩展
// 扩展是给类、结构体和枚举动态的增加方法或计算属性
// 使用extension关键字定义扩展
// 可以给现有类型，系统类型增加方法
// 也可以给现有类型增加协议

// 扩展的作用：
// 1、现有类型无法满足全部业务需求，又无法修改源代码(或者修改源代码成本很高)，可以采用extension来给现有类型增加方法或计算属性
// 2、如果想要现有类型实现某个协议，则也可以使用extension
// 3、如果一个类型实现代码过于庞大，可以通过extension来对实现进行分组，便于代码阅读和维护
// 4、
extension Int {

    // 对struct增加修改方法，需要用mutating标识
    mutating func add(number: Int) {

        self += number
    }

    // 增加不修改方法
    func intByAdd(number: Int) -> Int {

        return (self + number)
    }
}

// 实现协议
extension Int: ExampleProtocol {

    var simpleDescription: String {

        return "The number is \(self)"
    }

    mutating func adjust() {

        self += 42
    }

    func anotherFunc() {

        print(self)
    }
}

var intNumber = 5
intNumber.add(10)




// 
















