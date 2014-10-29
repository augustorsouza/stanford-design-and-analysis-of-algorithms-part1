// Playground - noun: a place where people can play

import UIKit
import XCPlayground

var data = [28, 75, 63, 57, 34, 25, 68, 41, 57, 54, 91, 60, 52, 2, 47, 71, 5, 8, 44, 60, 94]

func visualize<T>(data: [T], identifier: String) {
    for x in data {
        XCPCaptureValue(identifier, x)
    }
}

visualize(data, "Start")

func exchange<T>(data: [T], i: Int, j: Int) -> [T] {
    var newData = data
    
    let tmp = newData[i]
    newData[i] = newData[j]
    newData[j] = tmp
    
    return newData
}

func swapLeft<T: Comparable>(data: [T], index: Int) -> [T] {
    var newData = data
    
    for i in reverse(1...index) {
        if newData[i] < newData[i - 1] {
            newData = exchange(newData, i, i - 1)
        } else {
            break
        }
    }
    
    visualize(newData, "Iteration \(index)")
    
    return newData
}

func isort<T: Comparable>(data: [T]) -> [T] {
    var newData = data
    
    for i in 1..<data.count {
        newData = swapLeft(newData, i)
    }
    
    return newData
}

var sortedData = isort(data)
