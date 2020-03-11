//
//  CalModel.swift
//  Caculator_Test_Alpha
//
//  Created by 王鲲宇 on 2020/2/27.
//  Copyright © 2020 王鲲宇. All rights reserved.
//

import Foundation

class Cal {
    private var superArr: [Int] = []
    private var numArr: [Int] = []
    private var calArr: [Int] = []
    var showString = ""
    var sum = 0
    
    func getNumOrCal(buttonIn getIn: String) -> Bool {
        if let numGetIn = Int(getIn) {
            superArr.append(numGetIn)
        } else {
            switch getIn {
            case "+":
                superArr.append(-1)
            case "-":
                superArr.append(-2)
            case "x":
                superArr.append(-3)
            case "/":
                superArr.append(-4)
            case "=":
                return getSum()
            default:
                return false
            }
        }
        return true
    }
    
    func getSum() -> Bool {
        var tempArr: [Int] = []
        for index in 0..<superArr.count {
            if superArr[index] < 0 {
                tempArr.append(index)
                calArr.append(superArr[index])
            }
        }
//-----------------------------------------------------------------------------------------
        if superArr.isEmpty {
            return false
        }
        if superArr[0] < 0 {
            return false
        } else if superArr[superArr.count - 1] < 0 {
            return false
        } else {
            if tempArr.count > 1 {
                for index in 1..<tempArr.count {
                    if tempArr[index] - tempArr[index - 1] == 1 {
                        return false
                    }
                }
            }
        }
//-----------------------------------------------------------------------------------------
        while !tempArr.isEmpty {
            var tempSum = 0
            for _ in 0..<tempArr[0] {
                tempSum *= 10
                tempSum += superArr[0]
                superArr.remove(at: 0)
            }
            numArr.append(tempSum)
            tempSum = tempArr[0]
            for index in 0..<tempArr.count {
                tempArr[index] -= tempSum
                tempArr[index] -= 1
            }
            tempArr.remove(at: 0)
            superArr.remove(at: 0)
        }
        while !superArr.isEmpty {
            var tempSum = 0
            for _ in 0..<superArr.count {
                tempSum *= 10
                tempSum += superArr[0]
                superArr.remove(at: 0)
            }
            numArr.append(tempSum)
        }
//-----------------------------------------------------------------------------------------
        sum = 0
        var toSatisifyIndexRequireVar = 0
        for index in calArr.indices {
            if calArr[index] == -3 {
                numArr[index - toSatisifyIndexRequireVar] *= numArr[index + 1 - toSatisifyIndexRequireVar]
                numArr.remove(at: index + 1 - toSatisifyIndexRequireVar)
                toSatisifyIndexRequireVar += 1
            } else if calArr[index] == -4 {
                numArr[index - toSatisifyIndexRequireVar] /= numArr[index + 1 - toSatisifyIndexRequireVar]
                numArr.remove(at: index + 1 - toSatisifyIndexRequireVar)
                toSatisifyIndexRequireVar += 1
            }
        }
        
        while !calArr.isEmpty {
            switch calArr[0] {
            case -1:
                numArr[1] += numArr[0]
                numArr.remove(at: 0)
                calArr.remove(at: 0)
            case -2:
                numArr[0] -= numArr[1]
                numArr.remove(at: 1)
                calArr.remove(at: 0)
            default:
                calArr.remove(at: 0)
            }
        }
        
        sum = numArr.remove(at: 0)
        showString = String(sum)
        return true
    }
    
    func reInit() {
        superArr = []
        numArr = []
        calArr = []
        sum = 0
        showString = ""
    }
    
}

