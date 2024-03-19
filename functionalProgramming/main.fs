// Define a higher-order function that takes another function as a parameter
let applyTwice f x = f (f x)

// Define a side-effect-free function that adds 1 to a number
let addOne x = x + 1

// Define a side-effect-free function that multiplies a number by 2
let double x = x * 2

// Define a side-effect-free function that computes the square of a number
let square x = x * x

// Define a function that applies a given function to a list of integers
let applyFunctionToList f list =
    List.map f list

// Define a function that returns a closure (anonymous function)
let createMultiplier n =
    fun x -> x * n

// Example usage
let result1 = applyTwice addOne 3 // Result: 5 (3 + 1 + 1)
let result2 = applyTwice double 4 // Result: 16 (4 * 2 * 2)

let numbers = [1; 2; 3; 4; 5]
let squaredNumbers = applyFunctionToList square numbers // Result: [1; 4; 9; 16; 25]

let multiplyBy3 = createMultiplier 3
let result3 = multiplyBy3 4 // Result: 12 (4 * 3)


// printing the result
printfn "Result 1: %d" result1
printfn "Result 2: %d" result2
printfn "Squared numbers: %A" squaredNumbers
printfn "Result 3: %d" result3
