//
//  Array_Test.swift
//  Swift-Workspace
//
//  Created by Corotata on 2018/7/3.
//  Copyright © 2018 Corotata. All rights reserved.
//

import Foundation

extension Array {
    func customMap<T>(_ transform:(Element) -> T) -> [T]{
        var temp: [T] = []
        temp.reserveCapacity(count) //根据原数据长度分配好空间
        self.forEach { (value) in
             temp.append(transform(value))
        }
        return temp
    }
    
    
    func customFilter(_ predicate:(Element) -> Bool) ->[Element] {
        var temp: [Element] = []
//        self.forEach { (value) in
//            if predicate(value){
//                temp.append(value)
//            }
//        }
        for value in self where predicate(value) {
            temp.append(value)
        }
        return temp
    }
    
    func customCompactMap<T>(_ transform:(Element) -> [T]) -> [T]   {
        var temp: [T] = []
        for value in self {
            temp.append(contentsOf: transform(value))
        }
        return temp
    }
    
    func customReduce<T>(_ initial: T, _ next:(T,Element) -> T) -> T {
        var temp = initial
        for value in self {
            temp = next(temp,value)
        }
        return temp
    }
    
    
    func customMap2<T>(_ transform:@escaping (Element) -> T) -> [T] {
        return customReduce([], { $0 + [transform($1)]})
    }
    
    func customFilter2(_ predicate:(Element) -> Bool) ->[Element]  {
        return customReduce([], {predicate($1) ? $0 + [$1] : $0})
    }
    
}


func arrayNormalMethod() {
    var array = ["零","一","二","三"]
    print(array)
    
    print("添加 ------ ")
    array.append("五")
    print(array)
    
    print("遍历1 ------ ")
    for index in array {
        print(index)
    }
    
    print("遍历2，获取指定内容 ------ ")
    for index in array where index == "零" {
        print(index)
    }
    
    print("过滤指定内容 ------ ")
    print(array.filter {$0 == "零"})
    
    print("移除最后 ------ ")
    array.removeLast()
    _ = array.popLast()
    print(array)
}
