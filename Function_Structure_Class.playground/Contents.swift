import Foundation

func hello(){
    print("hello it's a simple print in a function")
}
hello()

// function with label parameter
func helloo(SayHello:String){
    print(SayHello)
}
helloo(SayHello: "Hello there")


//omit label parameter
func Helo(_ SayHelloo:String){
    print(SayHelloo)
}
Helo("Hello There")

// function have return
func HELO(Sayhelo:String)->String{
    return Sayhelo
}
HELO(Sayhelo: "Another Hello For you")

func number(num:Int)->Int{
    return num
}
number(num: 2)

//function have default value
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}
greet("mickel")
greet("mickel",nicely: false)

//variadic funcitons
func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square(numbers: 1,2,4,5,6,7,8)

// using inout, which means they can be changed inside your function, and those changes reflect in the original value outside the function.

func doubleInPlace(number: inout Int) {
    number *= 2
}

var numb = 10
doubleInPlace(number: &numb)


// structure
// mutating prefix is use to let function to chage variables or to put another value again

struct Car{
    var currentSpeed: Int
    mutating func speed(speed:Int){
        "Driving"
        currentSpeed=speed
    }
}

var myCar = Car(currentSpeed: 10)
myCar.speed(speed: 30)
myCar.currentSpeed

var anotherCar = myCar
myCar.speed(speed: 50)

myCar.currentSpeed
anotherCar.currentSpeed

//init is constructor
struct testConstructor{
    let name:String
    let age:Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let person = testConstructor(name: "mohammed", age: 24)
person.name
person.age

// another sytle that are useful

struct Person{
    let firstname:String
    let lastname:String
    // this shape below it's some like constructor you can not directly say firstname+lastname you can use this shape below or construcor to do this
    var fullname:String {
        firstname+lastname
    }
}

// to copy or custom copy of struct
// in case below you can change let of speed to var and don't need to func copy immediately you can change
struct Bike{
    let name:String
    let speed:Int
    func copy(speed:Int)-> Bike{
        Bike(name: self.name, speed: speed)
    }
}
let bike1 = Bike(name: "Tesla", speed: 30)
let bike2  = bike1.copy(speed: 40)
bike1.speed
bike2.speed
bike2.name

// Classes are refrence type but struct are value type

class Carr{
    var model:String
    var year:Int
    var modelType:String
    
    init(){
        self.model="Tesla"
        self.year = 2020
        self.modelType="Model 3"
        
    }
    deinit{
       print("it's automaticaly deinitialize after instance is called")
    }
}

let inst = Carr()
inst.year
inst.model
inst.modelType

func UseCarr(){
    let anotherInst = Carr()
    anotherInst.model
}

UseCarr()
// subclass or inheritance
// also init is initialized in super class when in subclass are user it need override keyword alsot it overrided from super
class SmallCar: Carr{
    override init() {
        super.init()
        super.modelType="Model 4"
        super.year=2021
    }
    
}

let insOfSamllCar = SmallCar()
insOfSamllCar.model
insOfSamllCar.modelType
insOfSamllCar.year
