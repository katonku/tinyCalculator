print("Добро пожаловать в Tiny Calculator!")

let operation = getUserData(description: "Введите операцию")
let firstNumber = getUserData(description: "Введите первое число")
let secondNumber = getUserData(description: "Введите второе число")

print("Идёт вычисление примера " + firstNumber + " " + operation + " " + secondNumber)

if let firstNumber = Int(firstNumber) {
    if let secondNumber = Int(secondNumber){
        calculate(operation: operation,
                  firstNumber: firstNumber,
                  secondNumber: secondNumber)
    } else {
        print("Второе число введено неправильно.")
    }
} else {
    print("Первое число введено неправильно.")
}

func getUserData (description: String) -> String {
    print(description)
    return readLine() ?? ""
}

func printResult(_ result: Int) {
    print("Результат \(result)")
}

func calculate(operation: String,
               firstNumber: Int,
               secondNumber: Int) {
    switch operation {
    case "+": printResult(firstNumber + secondNumber)
    case "-": printResult(firstNumber - secondNumber)
    case "*": printResult(firstNumber * secondNumber)
    case "/":
        if secondNumber != 0 {
            printResult(firstNumber / secondNumber)
        } else {
            print("Деление на ноль запрещено.")
        }
        
    default: print("Операция введена неверно.")
    }
}


