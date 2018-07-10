# Swift Generics

Generics in Swift... Seem intimidating? I know they seemed that way to me...at first. But think back, wasn't there a time in your programming career where variables, loops, and functions seemed intimidating? Now, they most likely feel second nature. This is true for plenty programming concepts. At first, they can be scary, but once you dive in that doubt and confusion will quickly dissipate. So hold tight, in this post I am going to walk you through the basics of generics and some of the different ways they can be used.

## The Basics

So...what are generics? First off, I am certainly not the first person to write about generics. There are plenty of resources out there. Just search "Swift Generics" and tons of resources will appear. But that is kind of a beautiful thing in itself. Some people can learn just fine from Apple Documentation, others from a nice tutorial, some from videos or screen casts, and still others from blogs. Though [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) is a great principle for programming, it does not apply as nicely to pedagogy. You never know what style, analogy, example, medium, etc will finally give you that oh-so-sweet "aha" moment - that beautiful rush of understanding that comes when you realize you finally "get it". So, with any luck, perhaps this post will provide you your "aha" moment or, at the very least, perhaps it will give you a good idea.

Now, back to the technical concepts...what are generics? Well, its really in the name. Generics are a feature for taking classes, structs, enums, typealiases, protocols, etc, and making them...well...generic. All of our functions and objects reference other and objects such as Strings, Ints, Doubles, etc. But sometimes you don't care about a specific type, you want to write your code for ALL types, or at least a subset of those types. To show an example of this, lets make our own generic data structure. Many times, when a developer wants to write an asynchronous function, they will use closures like this:
 
````
internal func fetchStringAsyncWithNormalClosure(arg: String, completion: (String?, Error?) -> Void) {
    if arg.isEmpty {
        completion(nil, ExampleError.emptyString)
    } else {
        completion(arg, nil)
    }
}
````
 
But this has a few issues:

1. Verbosity -  `(String?, Error?) -> Void)` is both ugly and long
2. Developer Error:

Because String and Error are both optional, one could actually include both or neither in the result.

````
completion(nil, nil)
completion("Result", .someError)
````
 
Or, the consumer could forget to check one or the other.
 
````
fetchStringAsyncWithNormalClosure(arg: "someString") { str, error in
    guard let s = str else { return }
}
````
 
Really, our completion result should be exclusive. Either the result was successful or there was an error. Most of the time there is no middle ground. So, lets model that in an enum.
 
````
 public enum Result {
    case success(String)
    case error(Error)
 }
````
 
But there is one problem here...what if we want this result to be an Int? Or a Bool? Or really any other type? Here is where generics come in...instead of tying this enum down to just a single type, we can simply use generic type T. Like this:

````
public enum Result<T> {
    case success(T)
    case error(Error)
}
````

Now, Result can take be defined as any type T at compile time. Here is what our fetch function can look like now:

````
 internal func fetchStringAsyncWithResultClosure(arg: String, completion: (Result<String>) -> Void) {
    if arg.isEmpty {
        completion(.error(ExampleError.emptyString))
    } else {
        completion(.success(arg))
    }
 }
````
 
This is looking better already. Shorter syntax, no optionals, and exclusive results. The best part is we are adhering to the DRY principle by not repeating our Result enum for each type we might want to use it with. We simply write once and reuse. 

But...we can take this one step further with the help of generics and typealiases. Though `(Result<String>) -> Void)` is certainly better than `(String?, Error?) -> Void` what if we could could get a little more concise and take out the ugliness of closure syntax? This is definitely a job for typealiases. But did you know that they can be generic as well?

````
public typealias ResultClosure<T> = (Result<T>) -> Void
````

Now we can simply write our fetch function like this:
 
````
internal func fetchStringAsync(arg: String, completion: ResultClosure<String>) {
    if arg.isEmpty {
        completion(.error(ExampleError.emptyString))
    } else {
        completion(.success(arg))
    }
}
````

Nice! And we can now call it like this:

````
fetchStringAsync(arg: "someString") { result in
    switch result {
    case .success(let str):
        print(str)
    case .error(let error):
        print(error)
    }
}
````

As you can see, generics can really help eliminate duplication of code as well as improve syntax. 

But generics don't need to simply be restricted to data structures. They can be used in functions as well! For instance, lets say I need to write a function that takes in an array of Ints, and returns true if all the Ints are equal, and false if they are not. This function might look something like this:

````
func areAllElementsEqual(_ elems: [Int]) -> Bool {
    guard var lastElem = elems.first else { return false }
    for elem in elems {
        if elem != lastElem {
            return false
        } else {
            lastElem = elem
        }
    }
    return true
}
````

This code will certainly work, which is great. We have accomplished our task and can now move on. But...what if we now need the code to check if all *Strings* in an array are equal? Well...our first thought might be to simply copy and paste the previous function but modify the signature to accept an array of Strings instead of Ints. But that seems like an awful waste. We could also rewrite our function to accept and array of Any. Lets look at that:

````
func areAllElementsEqual(_ elems: [Any]) -> Bool {
    guard var lastElem = elems.first else { return false }
    for elem in elems {
        switch elem {
        case is Int:
            if (elem as? Int) != (lastElem as? Int) {
                return false
            } else {
                lastElem = elem
            }
        case is String:
            if (elem as? String) != (lastElem as? Int) {
                return false
            } else {
                lastElem = elem
            }
        default:
            fatalError("This type cannot handle String(describing: elem)")
        }
    }
    return true
}
````

Notice, we need to switch on elem here to check the type. The operator == cannot be called on type Any for practical reasons, so we need to try to cast to any potential types we are interested in. If we haven't matched that type, then we have to throw some sort of error, because...well what else would you do? Now, if you want to add any more types to this you simply add to the switch statement. Double? Give it another case. Float? Give it another case. Dog? Give it another case. This certainly is not very DRY. We are rewriting the same code over and over again! Not to mention, by using Any we are opening ourselves up to all sorts of runtime bugs that the compiler cannot catch. Wouldn't it be nice if instead of declaring Any as our type of array, we could instead declare some arbitrary type? Well...generics to the rescue.

Lets rewrite this function with generics in mind.

````
func areAllElementsEqual<T>(_ elems: [T]) -> Bool {
    guard var lastElem = elems.first else { return false }
    for elem in elems {
        if elem != lastElem { // compiler error - Binary operator '!=' cannot be applied to two 'T' operands
            return false
        } else {
            lastElem = elem
        }
    }
    return true
}
````

Now, this code won't compile, but we will get to that later. Lets take a look at that T. Sitting between the angle brackets is our generic type. It doesn't have to be called T. It could be anything we want. T is just a convention, but we could be more descriptive and call it Element. Names aside, what we are doing here is declaring that this function will be making use of a generic type. We must utilize type T somewhere in our function signature, so we will use it to declare our Array type. Now, we don't need to worry whether our input is an array of Strings, Ints, or Doubles, as long as it is specified at compile time. But, there is something wrong here...this code will not compile. Why? Because not every type has the == operator defined! If I make a custom struct Dog but never implemented ==, this would never work. Thankfully, Swift is smart and type safe, so it catches this and will stop the build. So then, how can we guarantee that all elements T will have == defined? 

## Type Constraints

Some times just having a plain old type T generic will not cut it. It works fine for objects like Arrays, but that is because you don't really need and specific functionality from an element in an Array. We just need it to exist. But for our cases, we need a way to ensure that our element can be equated to the other elements in the Array. This is where type constraints come in. Constraints allow us to restrict T down to a smaller subset, and in turn, T gains the functionality of that subset.

If you've been writing Swift code for even just a short time, you have probably come across the Equatable protocol. This is a rather simple protocol that requires the conforming type to implement the == operator. (I highly recommend making all of your types Equatable as well as Hashable - and with Swift 4.1 its dead easy.) So, if all elements conforming to Equatable have == implemented, lets leverage that. Lets rewrite our function using T with a constraint saying that T must be equatable.

````
func areAllElementsEqual<T: Equatable>(_ elems: [T]) -> Bool {
    guard var lastElem = elems.first else { return false }
    for elem in elems {
        if elem != lastElem { // compiles!
            return false
        } else {
            lastElem = elem
        }
    }
    return true
}
````

Great, this code will now work. We have added the constraint Equatable to T, and now we can use == or != on our elements. We have now made our function fully generic and safe. Let's try it out!

````
areAllElementsEqual<Bool>([true, false, false, false]) // compiler error - Cannot explicitly specialize a generic function
areAllElementsEqual([1, 1, 1, 1]) // true
areAllElementsEqual(["Hello", "Hello", "Hello", "Hello, World"]) // false
````

Notice that first call explicitly specifies that this function will be using the Equatable type Bool. This is actually not allowed, but don't worry, the compiler will infer the type for you!

Also note in this function that there is no chance for a runtime error because we have guaranteed that only Equatable types can use this function. If we were to try and compile this with a non-Equatable type, we would get an error.

````
areAllElementsEqual(
    [
    SomeNonEquatableType(), 
    SomeNonEquatableType(), 
    SomeNonEquatableType(), 
    SomeNonEquatableType()
    ]
    ) // compiler error - In argument type '[SomeNonEquatableType]', 'SomeNonEquatableType' does not conform to expected type 'Equatable'
````

## Associated Types

After reading through our example, you might be wondering, "Hey Luke, why can't we just use Equatable as the argument type for the elems Array?" Good question! Let's take a look at this. Say we re-wrote our function to do just that:

````
func areAllElementsEqual(_ elems: [Equatable]) -> Bool { //Protocol 'Equatable' can only be used as a generic constraint because it has Self or associated type requirements
    guard var lastElem = elems.first else { return false }
    for elem in elems {
        if elem != lastElem { // compiles!
            return false
        } else {
            lastElem = elem
        }
    }
    return true
}
````

Wow, no need for generics. Nice! Uh-oh - compiler error :/ But why? This error can be quite confusing to see at first, but the bottom line is this: If a protocol has an Associated Type (which includes a reference to Self) then that protocol cannot be treated like a type. I.e. it cannot be cast to, used as an argument type, etc. It can only be used as a generic constraint. So then...what is an associated type? And why do they restrict the protocol so much?

### What are Associated Types

Essentially, associated types are generics for protocols. In the same way that you can use generics to define some type T in a function or class, so too can you use Associated Types to define some generic type to be used in a protocol conformance. Let's look at an example. Say we are defining some models to represent different smart phones. Some smart phones have biometric authentication. So we decide to create a BiometricAuthenticatable protocol like this:

````
struct iPhone8 {}
struct iPhoneX {}

protocol BiometricAuthenticatable {
    func authenticate(with data: ??) -> Bool
}

extension iPhone8: BiometricAuthenticatable {
    func authenticate(with data: ??) -> Bool {

    }
}
extension iPhone10: BiometricAuthenticatable {
    func authenticate(with data: ??) -> Bool {

    }
}
````

As you can see, we have a problem here. What data do we pass into the authenticate method. For an iPhone X we will need facial scans. For an 8 we will need fingerprint scans. In the future, who knows what data we might need. How can we make this generic? Well, associated types of course!

````
struct iPhone8 {...}
struct iPhoneX {...}

protocol BiometricAuthenticatable {
    associatedtype BiometricData
    func authenticate(with data: BiometricData) -> Bool
}

extension iPhone8: BiometricAuthenticatable {

    typealias BiometricData = FingerprintScanData
    func authenticate(with data: BiometricData) -> Bool {
        ...
    }
}
extension iPhone10: BiometricAuthenticatable {

    typealias BiometricData = FacialScanData
    func authenticate(with data: BiometricData) -> Bool {
        ...
    }
}
````

Now, we can use our BiometricAuthenticatable protocol on any device so long as it defines which type of data it expects to receive. You can even make this more DRY by moving the default implementation into a protocol extension with where clauses:

````
struct iPhone8 {...}
struct iPhoneX {...}

protocol BiometricAuthenticatable {
    associatedtype BiometricData
    func authenticate(with data: BiometricData) -> Bool
}

extension BiometricAuthenticatable where BiometricData == FingerprintScanData {
    func authenticate(with data: BiometricData) -> Bool {
        ...
    }
}

extension BiometricAuthenticatable where BiometricData == FacialScanData {
    func authenticate(with data: BiometricData) -> Bool {
        ...
    }
}

extension iPhone8: BiometricAuthenticatable {
    typealias BiometricData = FingerprintScanData
}
extension iPhone10: BiometricAuthenticatable {
    typealias BiometricData = FacialScanData
}
````

Because we have moved our implementations of authenticate into protocol extensions, we now have no need to implement them in the device structs themselves. This makes adding more devices even easier!

````
extension iPhone8Plus: BiometricAuthenticatable {
    typealias BiometricData = FingerprintScanData
}
extension iPadX: BiometricAuthenticatable {
    typealias BiometricData = FacialScanData
}
````

And when we call these functions, we will now see that auto complete suggest the proper signatures. Awesome!

````
let iphoneX = iPhoneX()
iphoneX.authenticate(with: < xcode suggests FacialScanData>)

let iphone8 = iPhone8()
iphone8.authenticate(with: < xcode suggests FingerprintScanData>)
````

### What is Self?

Remember our previous compiler error with equatable? 

````
Protocol 'Equatable' can only be used as a generic constraint because it has Self or associated type requirements
````

We now know what associated type requirements are. But what is that Self? And why does it have a capital S?? Well, Self is kind of similar to any old Associated type, expect it is more specific. Self refers to the type that is actually conforming to the protocol, whichever type that may be. For instance, String conforms to Equatable. So in the case where the Equatable protocol refers to Self and String is the object we are equating, Self means String. When we are equating to Ints, Self means Int. Lets take a look at the signature for == in Equatable:

````
public static func ==(lhs: Self, rhs: Self) -> Bool
````

This is exactly like using a generic or an associated type. This is essentially saying that == takes in two values of the same type Self - which can be anything that conforms to equatable, and returns a boolean. So if we write `"Hello" == "Hello"` then Self is a String, but when we say `25 == 25` Self is an Int. Self gives your protocols a way to have a generic reference to the conforming type. Great! Self can also be very useful for protocol extensions. For instance, because of Self, we can write awesome protocol extensions that only apply to certain types. So, lets say we want to create a protocol called Shakeable that adds the ability to shake some view. For now, we only really care about the implementation for UIViews. With Self, we can do this:

````
protocol Shakeable {
    func shake()
}

extension Shakeable where Self: UIView {
    func shake() {
        ...
    }
}
````

Now any UIView that conforms to Shakeable will get this implementation of Shakeable for free. Not only that, but because this extension constrains Self to UIView, we can actually use functions and properties of UIView in our implementation. Nice!


### Why are Associated Types and Self So Constraining?
Lets get back to our original problem. Why, when we try to use Equatable as a concrete type, does the compiler through this error?

````
func areAllElementsEqual(_ elems: [Equatable]) -> Bool { // compiler error - Protocol 'Equatable' can only be used as a generic constraint because it has Self or associated type requirements
    guard var lastElem = elems.first else { return false }
    for elem in elems {
        if elem != lastElem { // compiles!
            return false
        } else {
            lastElem = elem
        }
    }
    return true
}
````

Well, think of it this way. This code says that as long as the elements conform to Equatable, they can be apart of this array. This would mean that our array may not necessarily be homogeneous, that is, this array could potentially be a mix of Strings, Ints, Doubles, etc. So, in a magical world in which the above code actually compiles, lets follow that outcome a little farther. Say we give the following input:

````
areAllElementsEqual(["Hello", 1, "heterogeneous", 2.0, "array"])
````

Now, our function loops through and trys to equate "Hello" and 1. How would this work? Strings and Ints can never be equal. So really it doesn't make sense for the compiler to even allow us to make this comparison in the first place. Hence, the compiler restricts protocols with Self or associated type requirements to only be used as generic constraints, not as stand alone types.

Another example of this can be easily seen with our BiometricAuthenticatable protocol. Let's say I wanted to do the following:

````
let authenticatable: BiometricAuthenticatable = iPhoneX() // compiler error - Protocol 'Equatable' can only be used as a generic constraint because it has Self or associated type requirements

authenticatable.authenticate(???)

````

This example doesn't really make sense, because we are declaring authenticatable as a generic BiometricAuthenticatable and at run time we are assigning the specific implementation iPhoneX. Because this assignment happens at runtime, the compiler has no idea what the data parameter's type should be. Should it be  FacialScanData? Or FingerprintScanData? Who knows! So all in all, it makes sense for the Swift compiler to just disallow using protocols with associated types as concrete types all together.

## Conclusion

We have now explored many aspects of generics in Swift and I hope you have learned a thing or two. Generics can be a great way to keep your code safe and DRY. Whether you are creating new objects, writing functions, or defining protocols, a well placed generic can save you a lot of duplicate code and eliminate runtime bugs. 

What do you think? Will you try to use generics more in the future? What ways do you use generics in your code? Do you have any questions, feedback or comments to give? I'd love to hear from you.

-Luke Street
[@ldstreet](https://twitter.com/street_luke)



