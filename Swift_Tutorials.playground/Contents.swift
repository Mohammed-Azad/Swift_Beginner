import Foundation
// variables and arrays
var greeting = "Hello, playground"
let name = greeting
var names = name + " unExcepted"
names.append("hello")
var col = [
    "Mohammed",
    "Ahmed",
    names
]
col
var coll = col
coll.append("my name is ")
// array style in objective c
let nam = NSMutableArray(
    array: [
        "first",
        "second"
           ]
)
nam.add("last Name")
nam

col
coll

//tuple
var nameee = (
    fistname : "hello",
    secondname : "there")
nameee.0


// closure(anonymous function)
var ages = [30,15,12,22,50]
ages.sort(by:{(l:Int,r:Int)-> Bool in
    l>r
})
ages
//sets are like array but inorder
let se = Set<String>(["red","blue","green"])
let es = Set<String>(["mohammed","Ahmed","baryan"])
es.sorted { (l:String, r:String)-> Bool in
    l<r
}
es

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

// Enum

enum Animals{
    case cat,dog,duck
    // or write like following
//    case cat
//    case dog
//    case duck
    
}

let cat = Animals.cat
switch (cat){
    
case .cat:
    "Hello kitty "
    break
case .dog:
    "Hello doggy "
    break
case .duck:
    "Hello duckky "
    break
}

func DescribeAnimal(_ animal:Animals){
    switch(animal){
    case .cat:
        "hello i'm kitty"
        break
    case .dog:
        "hello i'm doggy"
        break
    default:
        "hello may i duck or another"
    }
}

DescribeAnimal(Animals.dog)

//another example

enum Shortcut{
    case fieOrFolder(path: URL, name:String)
    case wwwUrl(path:URL)
    case song(artist:String,songName:String)
    
}

let wwwApple = Shortcut.wwwUrl(path: URL(string:"https//www.apple.com")!)
// default switch case like this
switch(wwwApple){
    
case .fieOrFolder(path: let path, name: let name):
    break
case .wwwUrl(path: let path):
    break
case .song(artist: let artist, songName: let songName):
    break
}

// most people and use of siwtch case like following

switch(wwwApple){
    
case let .fieOrFolder(
    path,
    name):
    path
    name
    break
case let .wwwUrl(
    path):
    path
    break
case let .song(
    artist,
    songName):
    artist
    songName
    break
}

// show because are used
if case let .wwwUrl(path) = wwwApple {
    path
}

// another example for enum create property to get manufacturer of enums
enum Vehicle {
case car (manufacturer: String, model: String)
case bike(manufacturer: String, yearMade: Int)
    var manufacturer: String {
        switch self {
        case let .car (manufacturer,_) ,
            let .bike(manufacturer,_) :
            return manufacturer
        }
    }
}

let car = Vehicle.car(
    manufacturer: "Testla",
    model: "3")
car.manufacturer

let bike = Vehicle.car(
    manufacturer: "Sazuki",
    model: "2020")
bike.manufacturer

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

// protocol it's interface called in another programming language
// can not creat instance form protocol

protocol HasName{
    var name:String {get}
    var age:Int {get set}
    func canBreath()
    mutating func increaseAge()
}
// can implement function body by extension keyword
extension HasName{
    func canBreath(){
        "This is called when instance can breath"
    }
    //mutating is uste to function are muttable
    mutating func increaseAge(){
        self.age+=2
    }
}
// using structure and properties
struct personn: HasName{
    // can use let for name because it's get but age are get and set can not take let
    let name: String
    var age: Int
    
}

var per = personn(name: "Mohammed", age: 24)
per.name
per.age
per.age+=2
per.age
// when name is var in sturct can reassign
//per.name = "hello"
per.name
per.canBreath()

struct Dog: HasName{
    var name: String
    var age: Int
    
}
let dogg = Dog(name: "Haski", age: 5)
dogg.name
dogg.age


// using class and properties
class personnn: HasName{
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
var anothPer = personnn(name: "Ahmed", age: 24)
anothPer.name
anothPer.age
anothPer.age+=3
anothPer.age
anothPer.canBreath()
anothPer.increaseAge()
anothPer.age

func describe(obj:Any) ->String{
    if obj is HasName{
        "obj is conform to the HasName protocol"
    }else{
        "obj is not conform to the HasName protocol"
    }
}
describe(obj: anothPer)

func IncreasAgeifHasName(obj:Any){
    if var hasnam = obj as? HasName{
        hasnam.age
        hasnam.age+=10
        hasnam.age
        // if name in protocol have {set} can reassign
        //hasnam.name = "Mohammed"
    }else{
        "This is not from HasName"
    }
}

IncreasAgeifHasName(obj: per)
// age are same as before even it called in IncreasAgeifHasName but it's structure are use variable type but if it's class age will increase
per.age


//Error handling

struct Personn{
    let firstName:String?
    let lastName:String?
    
    enum ErrorPerson:Error{
       case firstNameNil
        case lastNameNil
        case bothNamesNil
    }
    func getFullName()throws->String{
        switch(firstName,lastName){
        case (.none,.none):
            throw ErrorPerson.bothNamesNil
        case(.none,.some):
            throw ErrorPerson.firstNameNil
        case(.some,.none):
            throw ErrorPerson.lastNameNil
        case let(.some(firstName),.some(lastName)):
            return "\(firstName)\(lastName)"
        }
    }
}
// this error handling not detect in where error arise
let insper = Personn(firstName: nil, lastName: nil)
do{
   try insper.getFullName()
}catch is Personn.ErrorPerson{
    "error occured"
}

// in here it detect in which section error are arise and put catch for each section

let insPer = Personn(firstName: "mohammed", lastName: nil)

do{
    try insPer.getFullName()
}catch Personn.ErrorPerson.firstNameNil{
    "First name is Null"
}catch Personn.ErrorPerson.lastNameNil{
    "Last name is null"
}catch Personn.ErrorPerson.bothNamesNil{
    "Both names are null"
}catch {
    "some other error was thrown"
}

// error handling in constructor(initializer)

struct Caarr{
    let manafacture:String
    enum Errors:Error{
        case invalidManufature
    }
    init( manafacture:String)throws {
        if manafacture.isEmpty {
            throw Errors.invalidManufature
        }
        self.manafacture = manafacture
    }
}

do{
    let myCar = try Caarr(manafacture: "")
}catch Caarr.Errors.invalidManufature{
    "invalid manufacture "
}catch {
    "another error was thrown"
}

// another shape to write this
if let yourCar = try? Caarr(manafacture: "Ford"){
    "Success your car = \(yourCar)"
}else{
    "Failed  to construct and error is not accessible for now "
}

// error handling with tow function and each function are thrwo then another function are thrwo two function are bark and run without do-catch

struct Dogg{
    let isInjuried:Bool
    let isSleeping:Bool
    
    enum BarkingError:Error{
        case cannotBarkIsSleeping
    }
    
    enum RuningError:Error{
        case cannotRunIsInjuried
    }
    
    func Bark() throws{
        if isSleeping{
            throw BarkingError.cannotBarkIsSleeping
        }
        "Bark..."
    }
    
    func Run()throws{
        if isInjuried{
            RuningError.cannotRunIsInjuried
        }
        "Running...."
    }
    func BarkandRun()throws{
        try Bark()
        try Run()
    }
}

let dog = Dogg(isInjuried: false, isSleeping: true)
do{
    try dog.BarkandRun()
    // in below can not track wich is the dog is can not bark or run because both of them are written and another thing in function BarkandRun when each are throw another cannoth throw it mean cannot thrwo both of them
}catch Dogg.BarkingError.cannotBarkIsSleeping,Dogg.RuningError.cannotRunIsInjuried{
    "may the dog not bark because sleeping or it not run because injuried"
}catch{
    "dog have another problem"
}
