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
    print("Введите операцию +, -, * или /")
    let operation = getUserInput()
    guard operation == "+" || operation == "-" || operation == "*" || operation == "/" else {
        print("Введена некорректная операция")
        return
    }
    
    print("Введите первое число")
    let firstNumber = getUserInput()
    guard let firstNumber = Int(firstNumber) else {
        print("Введено некорректное число")
        return
    }
    
    print("Введите второе число")
    let secondNumber = getUserInput()
    guard let secondNumber = Int(secondNumber) else {
        print("Введено некорректное число")
        return
    }
    
    print("Введите третье число")
    let thirdNumber = getUserInput()
    guard let thirdNumber = Int(thirdNumber) else {
        print("Введено некорректное число")
        return
    }
    
    let expression = "\(firstNumber) \(operation) \(secondNumber) \(operation) \(thirdNumber)"
    print("Вычисляю " + expression)
    
    let result: Int
    switch operation {
    case "+":
        result = firstNumber + secondNumber + thirdNumber
    case "-":
        result = firstNumber - secondNumber - thirdNumber
    case "*":
        result = firstNumber * secondNumber * thirdNumber
    case "/" where secondNumber == 0 || thirdNumber == 0:
        print("На ноль делить запрещено!")
        return
    case "/":
        result = firstNumber / secondNumber / thirdNumber
    default: print("Вы ввели неверную операцию!")
        return
    }
    
    print("Ответ \(result)")
    history.append(expression + " = " + String(result))
}

func getUserInput () -> String {
    return readLine() ?? ""
}


