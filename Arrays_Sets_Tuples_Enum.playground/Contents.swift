import Foundation

let name_one = "jone"
let name_two = "mickel"
let name_three = "lucky"
//Array array elements are ordered started from 0 to size of the array
var array_name = [ name_one,name_two,name_three]
array_name.append("josef")
// for executing array
for names in array_name{
  print("array of names contains : \(names)")
}

// array style in objective c
let nam = NSMutableArray(
    array: [
        "first",
        "second"
           ]
)
nam.add("last Name")
nam

//concating two array by operator
let second_array = ["ahmed","mahmood","mohammed"]
let concat_array = array_name + second_array


//Sets are unordered it's shuffled you cant detect wich one is first
let set = Set<String>([name_one,name_two,name_three])
let anotherSet = Set<Int>([29,39,49,59,50])
set

//Tuples
// unnamed tuple
let person = ("john",39,170)
person.0
person.1
person.2

//named tuple
let person1 = (name:"john",age:39,length:170)
person1.name
person1.age
person1.length

//Dictionary
let dic = [ "name": "mickel","age":"29","color":"white","eyeColor":"blue"]
dic["name"]
dic["age"]

// if the value are nil you can put default
dic["chocolate",default: "unknown"]

//Enums
enum result{
    case sucessful
    case failure
}

//enum with associated value
enum resltt{
    case sucessful(mark:Int)
    case failure(mark:Int)
}

//enum raw value
enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}

Planet(rawValue: 2) // output earth
// cane change order for cases
enum Planett: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

Planett(rawValue: 2)// output venus

//Closure(anonymous function)
var ages = [30,15,12,22,50]
ages.sort(by:{(left:Int,right:Int)-> Bool in
    left>right // soft from small to big
})
ages
// set sorted by closure
let es = Set<String>(["mohammed","Ahmed","baryan"])
es.sorted { (l:String, r:String)-> Bool in
    l<r
}
es

//
let value = 80

switch(value){
case 0...50:
    print("range in zerto to fifty ")
case 50..<61:
    print("range in 50 to sixty ")
case 61...70:
    print("range in sixity one to seventy")
case 71..<80:
    print("range in seventy one to eighty")
case 80...100:
    print("range in eighty to one hundred")
default:
    print("in another range")
}
