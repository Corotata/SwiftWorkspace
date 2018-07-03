//
//  Test.swift
//  Test
//
//  Created by Corotata on 2018/7/3.
//  Copyright © 2018 Corotata. All rights reserved.
//

import XCTest
class Test: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCustomMap() {
        let array = [1,2,3,4,5,6,7]
        XCTAssert(array.customMap {$0 * $0} == [1, 4, 9, 16, 25, 36, 49])
    }
    
    
    func testCustomFilter() {
        let array = [1,2,3,4,5,6,7]
        XCTAssert(array.customFilter{ $0 % 2 == 0 } == [2,4,6])
    }
    
    func testCustomCompactMap() {
        let array = [1,2,3]
        let array2 = ["一","二","三"]
        print(array.customCompactMap{ value in array2.map{(value,$0)}})
    }
    
    func testCustomReduce() {
        let array = [1,2,3,4]
        XCTAssert(array.customReduce(0,{$1 - $0}) == 2)
    }
    
    func testCustomMap2() {
        let array = [1,2,3,4,5,6,7]
        XCTAssert(array.customMap2 {$0 * $0} == [1, 4, 9, 16, 25, 36, 49])
    }
    
    
    func testCustomFilter2() {
        let array = [1,2,3,4,5,6,7]
        XCTAssert(array.customFilter2{ $0 % 2 == 0 } == [2,4,6])
    }
    
}
