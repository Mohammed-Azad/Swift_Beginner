import Foundation

//Variables
// let is immutable (constant) can not reassign but var mutable can reassign
let hello = "Hello"
var there = hello + "there"
there.append("Wolrd!")
let world = "Wolrd !"
there

// type annotation
let pi : Double = 3.14
var number :Int = 1
let pi2 :Float = 3.14

// String interpolation
let sentence = "In math pi is equal \(pi)"
var first_program = "Usually programmers wirte \(hello + world) at first time running"

// Multiline String
let anything = """
welcome back
to here
Hello
"""
