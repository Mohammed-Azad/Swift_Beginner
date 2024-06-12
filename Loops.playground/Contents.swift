import Foundation

let number = 10...20
//For loop
for numbers in number {
    print(numbers)
}

//for loop at array
let array_names = ["Vandad","Mickel","angela"]
for names in array_names {
    print("array names are : \(names)")

}

var num = array_names.count-1

while num >= 0 {
    print( array_names[num])
    num-=1
}
// use for with range and exiting loop by break
for h in 1...5 {
    print("Hello:\(h)")
    if h == 3{
        "the loop will be break"
        break
    }
}

// less common way use repeat
var numberr = 1
repeat {
    print(numberr)
    numberr += 1
} while numberr <= 20

//this way can not print because flase always false
while false {
    print("This is flase ")
}

// nested loop and exiting in nested loop by using outerLoop label for outer loop and put break in inner loop

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("in here loop will break")
            break outerLoop
        }
    }
}

// skipping item show even numbers
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }

    print(i)
}

// skipping item show odd numbers
for i in 1...10 {
    if i % 2 == 0 {
        continue
    }

    print(i)
}

