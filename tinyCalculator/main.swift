import Darwin

print("Введите первое число: ")
let a = getNumberFromLine()

print("Введите второе число: ")
let b = getNumberFromLine()

print("Введите операцию (+, -, *, /): ")
let option = getLineFromUser()

let expressionView = "\(a) \(option) \(b)"

let result = makeCalculation(firstOperand: a, secondOperand: b, operation: option)
showResult(expressionView: expressionView, result)

func getLineFromUser() -> String{
    if let string = readLine(),
        !string.isEmpty{
        return string
    } else {
        print("Ошибка: введено неверное значение")
        exit(1)
    }
}

func getNumberFromLine() -> Double {
    if let doubleString = Double(getLineFromUser()) {
        return doubleString
    } else {
        print("Ошибка: введено не число")
        exit(1)
    }
}

func makeCalculation(firstOperand a:Double,
                     secondOperand b:Double,
                     operation option:String) -> Double{
    switch option {
    case "+":
        return a + b
    case "-":
        return a - b
    case "*":
        return a * b
    case "/":
        if b == 0 {
            print("На ноль делить запрещено!")
            exit(1)
        }
        return a / b
    default:
        print("Ошибка: введена не операция")
        exit(1)
    }
}

func showResult(expressionView expression:String, _ result: Double){
    print(expression + " = \(result)")
}
