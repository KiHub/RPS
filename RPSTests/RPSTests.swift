//
//  RPSTests.swift
//  RPSTests
//
//  Created by  Mr.Ki on 03.06.2021.
//

import XCTest
@testable import RPS

class RPSTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRockResult() {
        let sign = Sign.rock
        print(sign)
        print(sign.emoji)
        XCTAssert(sign.getResult(for: .rock) == .draw )
        XCTAssert(sign.getResult(for: .paper) == .lose )
        XCTAssert(sign.getResult(for: .scissors) == .win )
        
    }
    
    func testPaperResult() {
        let sign = Sign.paper
        print(sign)
        print(sign.emoji)
        XCTAssert(sign.getResult(for: .rock) == .win )
        XCTAssert(sign.getResult(for: .paper) == .draw )
        XCTAssert(sign.getResult(for: .scissors) == .lose )
        
    }
    
    func testScissorsResult() {
        let sign = Sign.scissors
        print(sign)
        print(sign.emoji)
        XCTAssert(sign.getResult(for: .rock) == .lose )
        XCTAssert(sign.getResult(for: .paper) == .win )
        XCTAssert(sign.getResult(for: .scissors) == .draw )
        
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
