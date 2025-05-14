import Darwin

print("Введите первое число: ")
var a: Double = 0
if let string = readLine(),
    !string.isEmpty,
    let doubleString = Double(string) {
    a = doubleString
} else {
    print("Ошибка: введено не число")
    exit(1)
}

print("Введите второе число: ")
var b: Double = 0
if let string = readLine(),
   !string.isEmpty,
   let doubleString = Double(string){
    b = doubleString
} else {
    print("Ошибка: введено не число")
    exit(1)
}

print("Введите операцию (+, -, *, /): ")
var option: String = ""
if let string = readLine(),
   !string.isEmpty {
    option = string
} else {
    print("Ошибка: введена не операция")
    exit(1)
}

var result: Double = 0

switch option {
case "+":
    result = a + b
case "-":
    result = a - b
case "*":
    result = a * b
case "/":
    if b == 0 {
        print("На ноль делить запрещено!")
        exit(1)
    }
    result = a / b
default:
    print("Ошибка: введена не операция")
    exit(1)
}

print("\(a) \(option) \(b) = \(result)")
