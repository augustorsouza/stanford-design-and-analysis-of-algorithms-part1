// Playground - noun: a place where people can play

import UIKit
import XCPlayground

func visualize<T>(data: [T], identifier: String) {
    for x in data {
        XCPCaptureValue(identifier, x)
    }
}

func merge(data1: [Int], data2: [Int]) -> [Int] {
    if data1.count == 0 {
        return data2
    } else if data2.count == 0 {
        return data1
    } else if data1.first <= data2.first {
        var newData1 = data1
        var minor = [newData1.removeAtIndex(0)]
        return minor + merge(newData1, data2)
    } else {
        var newData2 = data2
        var minor = [newData2.removeAtIndex(0)]
        return minor + merge(data1, newData2)
    }
}

func mergesort(data: [Int]) -> [Int] {
    let n = data.count - 1
    let nHalf = n / 2
    
    if n > 0 {
        var firstHalf = Array(data[0...nHalf])
        var secondHalf = Array(data[(nHalf + 1)...n])
        
        return merge(mergesort(firstHalf), mergesort(secondHalf))
    } else {
        return data
    }
}

var inputData = [10, 2, 5, 3, 7, 13, 1, 6]
visualize(inputData, "Start")
visualize(mergesort(inputData), "end")
