var history: [String] = []

while true {
    let operation = getUserIntut("""
    Введите:
    +, -, *, /....вычисление
    q.............выйти
    h.............показать историю 
    """)
    
    if operation == "q" {
        print("Пока!")
        break
    }
    
    if operation == "h" {
        print("История успешных вычислений:")
        for expression in history {
            print(expression)
        }
        continue
    }
        
    let firstNumberInput = getUserIntut("Введите первое число:")
    let secondNumberInput = getUserIntut("Введите второе число: ")
    
    if let firstNumber = Int(firstNumberInput) {
        if let secondNumber = Int(secondNumberInput){
            
            let result = calculate(operation, firstNumber, secondNumber)
            
            if let result {
                let expression = "\(firstNumberInput) \(operation) \(secondNumberInput) = " + String(result)
                history.append(expression)
                print(expression)
                print("-----------------")
            }
            
        } else {
            print("Вы ввели неверно второе число!")
        }
    } else {
        print("Вы ввели неверно первое число!")
    }
}

func getUserIntut (_ message: String) -> String {
    print(message)
    return readLine() ?? ""
}

func calculate (_ operation: String, _ firstNumber: Int, _ secondNumber: Int) -> Int? {
    switch operation {
    case "+": return firstNumber + secondNumber
    case "-": return firstNumber - secondNumber
    case "*": return firstNumber * secondNumber
    case "/":
        if secondNumber != 0 {
            return firstNumber / secondNumber
        } else {
            print("Делить на 0 нельзя!")
            return nil
        }
    default: print("Вы ввели неверную операцию!")
        return nil
    }
}


