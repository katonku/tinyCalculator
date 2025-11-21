print("Добро пожаловать в Tiny Calculator!")

print("Введите операцию")
let operation = readLine() ?? ""

print("Введите первое число")
let firstNumber = readLine() ?? ""

print("Введите второе число")
let secondNumber = readLine() ?? ""

print("Идёт вычисление примера " + firstNumber + " " + operation + " " + secondNumber)

if let firstNumber = Int(firstNumber) {
    if let secondNumber = Int(secondNumber){
        switch operation {
        case "+": print("Результат " + String(firstNumber + secondNumber))
        case "-": print("Результат " + String(firstNumber - secondNumber))
        case "*": print("Результат " + String(firstNumber * secondNumber))
        case "/":
            if secondNumber != 0 {
                print("Результат " + String(firstNumber / secondNumber))
            } else {
                print("Деление на ноль запрещено.")
            }
            
        default: print("Операция введена неверно.")
        }
    } else {
        print("Второе число введено неправильно.")
    }
} else {
    print("Первое число введено неправильно.")
}


