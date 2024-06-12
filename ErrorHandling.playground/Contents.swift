import Foundation


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

