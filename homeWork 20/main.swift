//
//  main.swift
//  homeWork 20
//
//  Created by Seroj on 22.07.22.
//

import Foundation

// homeWork 18
/* 1. հայտարարել protocol Sum անունով որը պետք է սահմանի մեկ ֆունկցիա sum անունով որը չի ընդունում արգումենտ և վերադարձնում է գումարի արդյունք Double տիպի */

protocol Sum {
    func sum() -> Double
}

/* 2. Ստեղծել ստրուկտորա որը պետք է ունենա 3 stored փրոփրտիները a, b, c  Double տիպի և պետք է բավարարի Sum protocol-ի պահանջներին , Sum protocol-ի sum ֆունկցիան պետք է վերդարձնի a, b, c -ի գումարը */

struct SomeDoubles: Sum {

    var a: Double
    var b: Double
    var c: Double

    func sum() -> Double {
        return a + b + c
    }
}

let a = SomeDoubles(a: 2, b: 3.3, c: 1)
print(a.sum())

/* 3. Array-ի համար գրել Extension որը պետք է բավարարի Sum protocol-ի պահանջներին միայն այն դեպքում երբ Array ի էլեմենտները Double տիպի են ( where Element == Double ), Sum protocol-ի sum ֆունկցիան պետք է վերդարձնի Array-ի էլեմենտների գումարը */

extension Array: Sum where Element == Double {

    func sum() -> Double {
        var a: Double = 0
        for item in self {
            a += item
        }
        return a
    }
}

let arr = [1.1, 2, 4, 5]
print(arr.sum())

/* 4. հայտարարել protocol Editable անունով որը պետք է սահմանի մեկ ֆունկցիա edit(newValue: Int) -> Int անունով որը  վերադարձնում հինա արժեքը */

protocol Editable {
    func edit(newValue: Int) -> Int
}

/* 5. Int -ի համար գրել Extension որը պետք է բավարարի Editable protocol-ի պահանջներին Editable protocol-ի edit ֆունկցիան պետք է ընդունի նոր արժեք որը փոխելու է ընտացիք արժեքը իսկ հին արժեքը պեքտ է վերադաձնել */

extension Int: Editable {

    func edit(newValue: Int) -> Int {
        return newValue
    }

    func edit(newValue: inout Int, someValue: Int) -> Int {
           let savevalue = newValue
           newValue = someValue
           return savevalue
    }
}

var a1: Int = 3

print(a1.edit(newValue: &a1, someValue: 4))
print(a1)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/* 1. Հայտարարել Ունիվերսալ ֆունկցիա changeValue(value, a) անունով որի առաջին արգումենտը Ունիվերսալ տիպի է իսկ եկրորդ արգումենտը Double տիպի. Ֆունկցիան պետք է value -ի արժեքը մեծացնի a ով։ */

protocol Plus {
    static func + (r: Self, l: Double) -> Self
}

extension Double: Plus {  }

func changeValue<T: Plus>(value: inout T, a: Double) {
    value = value + a
}
var c: Double = 2.2

changeValue(value: &c, a: c)
print(c)

/* 2. Հայտարարել Ունիվերսալ ֆունկցիա changeValue(value, a) անունով որի առաջին արգումենտը Ունիվերսալ տիպի է իսկ եկրորդ արգումենտը Double տիպի. Ֆունկցիան պետք է value -ի արժեքը մեծացնի a անգամ։ */

protocol Multiplies {
    static func * (r: Self, l: Double) -> Self
}

extension Double: Multiplies {

}

func changeValueMulti<T: Multiplies>(value: inout T, a: Double) {
    value = value * a
}

var a2: Double = 12.3

changeValueMulti(value: &a2, a: 8)
print(a2)

/* 3. Հայտարարել Ունիվերսալ ֆունկցիա changeArrayValue(arr, a) անունով որի առաջին արգումենտը Ունիվերսալ տիպի մասիվ է իսկ եկրորդ արգումենտը Double տիպի. Ֆունկցիան պետք է arr -ի արժեքները մեծացնի a անգամ և վերադարձնի նոր մասիվը։
 3 u 4 i xndirneri funkciayi ekrord argumenty petq e lini generic tipi */

protocol Angam {
    static func * (r: Self, l: Self) -> Self
}

extension Int: Angam { }

extension Double: Angam { }

func changeArrayValue<T: Angam>(_ arr: [T], _ a: T) -> [T] {

    var newArray = [T]()

    for item in arr {
        newArray.append(item * a)
    }
    return newArray
}

var arr3 = [0, 2, 45]
var a3 = 2

print(changeArrayValue(arr3, a3))

/* 4. Հայտարարել Ունիվերսալ ֆունկցիա changeArrayValue(arr, a) անունով որի առաջին արգումենտը Ունիվերսալ տիպի մասիվ է իսկ եկրորդ արգումենտը Double տիպի. Ֆունկցիան պետք է arr -ի արժեքները մեծացնի a ով և վերադարձնի նոր մասիվը։
 3 u 4 i xndirneri funkciayi ekrord argumenty petq e lini generic tipi */

protocol Sum {
    static func + (r: Self, l: Self) -> Self
}

extension Double: Sum {  }

extension Int: Sum {  }

func changeArrayValueSum<G: Sum>(arr: [G], a: G) -> [G] {
    var newArr = [G]()

    for item in arr {
        newArr.append(item + a)
    }
    return newArr
}

var arr2 = [1.1, 1.1, 2.2, 3.3, 5.5]

print(changeArrayValueSum(arr: arr2, a: 1))









//
//protocol Editable {
//    func edit(newValue: Int) -> Int
//}
//
///* 5. Int -ի համար գրել Extension որը պետք է բավարարի Editable protocol-ի պահանջներին Editable protocol-ի edit ֆունկցիան պետք է ընդունի նոր արժեք որը փոխելու է ընտացիք արժեքը իսկ հին արժեքը պեքտ է վերադաձնել */
//
//extension Int: Editable {
//
//    func edit(newValue: Int) -> Int {
//        return newValue
//    }
//
//    func edit(newValue: inout Int, someValue: Int) -> Int {
//           let savevalue = newValue
//           newValue = someValue
//           return savevalue
//    }
//}
//
//var a1: Int = 3
//
//print(a1.edit(newValue: &a1, someValue: 4))
//print(a1)
