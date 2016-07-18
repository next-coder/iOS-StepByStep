//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// 异常处理
// 所有的异常都需要实现ErrorProtocol协议，实现ErrorProtocol协议的类型，都可以作为异常
enum PrinterError: ErrorType {

    case outOfPaper
    case noToner
    case onFire
}

// 用throw抛异常，用throws表示函数或方法可能抛出异常
func send(job: Int, toPrinter printerName: String) throws -> String {

    if printerName == "Never Has Toner" {

        throw PrinterError.outOfPaper
    }
    return "Job sent"
}

// 有两种方式来处理异常
// 第一种使用do-try-catch
do {

    let printerResponse = try send(23, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {

    print(error)
}

// 可以写多个catch
do {

    let printerResponse = try send(23, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch PrinterError.noToner {

    print("noToner")
} catch PrinterError.outOfPaper {

    print("outOfPaper")
} catch {

    print(error)
}

// 第二种处理异常的方式就是try?，使用这种方式，相当于不catch异常，而是把返回结果变成optional
let printerSuccess = try? send(2323, toPrinter: "Mergenthaler")
let printerFailer = try? send(2323, toPrinter: "Never Has Toner")
print(printerSuccess)
print(printerFailer)

// 使用defer实现一些代码，不管是否抛出异常，都可以执行，类似于java异常中的finally

func fridgeContaisn(food: String) -> Bool {

    var open = true

    // defer中代码是在函数返回之前执行，在所有其他代码之后执行
    defer {

        if open {

            print("open")
        } else {

            print("false")
        }
    }

    // 多个defer，最后面的defer先执行，按从后向前的顺序执行
    defer {

        if open {

            print("fdafsa")
        } else {

            print("fdfd")
        }
    }

    open = false

    return true
}

fridgeContaisn("lalla")


// 泛型
// 用<泛型类型>接在类型后面表示泛型
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {

    var result = [Item]()
    for _ in 0..<numberOfTimes {

        result.append(item)
    }
    return result
}

let result = makeArray(repeating: "Knock", numberOfTimes: 4)


class Array1<T, V where T: SequenceType, V: SequenceType, T.Generator.Element == V.Generator.Element> {

    var array = [T]()

    func append(t: T) {

        array.append(t)
    }

    func removeAtIndex(index: Int) -> T {

        return array.removeAtIndex(index)
    }
}

class Array2<T: SequenceType, V: SequenceType where T.Generator.Element == V.Generator.Element> {

    var array = [T]()

    func append(t: T) {

        array.append(t)
    }

    func removeAtIndex(index: Int) -> T {

        return array.removeAtIndex(index)
    }
}










