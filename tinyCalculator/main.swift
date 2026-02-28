import Darwin

print("Добро пожаловать в TinyCalculator")
var history: [String] = []

while true {
    print("""
-----------------------
Выберите команду:
с - вычислить (+ - * /)
h - показать историю
q - выйти
""")
    
    let comand = getUserInput()
    
    switch comand {
        case "c":
            calculate()
        case "h":
            showHistory()
        case "q":
            print("Пока!")
            exit(0)
        default:
            print("Команда введена неверно.")
    }
}

func showHistory() {
    print("История успешных вычислений:")
    guard !history.isEmpty else {
        print("В истории нет записей.")
        return
    }
    for expression in history {
        print(expression)
    }
}

func calculate() {
    print("Введите первое число")
    let firstNumber = getUserInput()
    guard let firstNumber = Int(firstNumber) else {
        print("Введено некорректное число")
        return
    }
    
    print("Введите первую операцию +, -, * или /")
    let operationOne = getUserInput()
    guard operationOne == "+" || operationOne == "-" || operationOne == "*" || operationOne == "/" else {
        print("Введена некорректная операция")
        return
    }
    
    print("Введите второе число")
    let secondNumber = getUserInput()
    guard let secondNumber = Int(secondNumber) else {
        print("Введено некорректное число")
        return
    }
    
    let intermediateResult = operationOnTwoNumbers(firstNumber,
                                                   secondNumber,
                                                   operationOne)
    guard let intermediateResult else {
        return
    }
    
    print("Введите вторую операцию +, -, * или /")
    let operationTwo = getUserInput()
    guard operationTwo == "+" || operationTwo == "-" || operationTwo == "*" || operationTwo == "/" else {
        print("Введена некорректная операция")
        return
    }
    
    print("Введите третье число")
    let thirdNumber = getUserInput()
    guard let thirdNumber = Int(thirdNumber) else {
        print("Введено некорректное число")
        return
    }
    
    let result = operationOnTwoNumbers(intermediateResult,
                                       thirdNumber,
                                       operationTwo)
    guard let result else {
        return
    }
    
    let expression = "(\(firstNumber) \(operationOne) \(secondNumber)) \(operationTwo) \(thirdNumber)"
    print("Вычисляю " + expression)
    
    print("Ответ \(result)")
    history.append(expression + " = " + String(result))
}

func getUserInput () -> String {
    return readLine() ?? ""
}

func operationOnTwoNumbers (_ firstNumber: Int,
                           _ secondNumber: Int,
                           _ operation: String) -> Int? {
    switch operation {
    case "+":
        return firstNumber + secondNumber
    case "-":
        return firstNumber - secondNumber
    case "*":
        return firstNumber * secondNumber
    case "/" where secondNumber == 0:
        print("На ноль делить запрещено!")
        return nil
    case "/":
        return firstNumber / secondNumber
    default: print("Вы ввели неверную операцию!")
        return nil
    }
}


