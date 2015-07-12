import UIKit
import XCTest
import EasyData

class EasyDataTests: XCTestCase {
    func testCount() {
        if true {
            let data = Data(bytes: [0x0, 0x1, 0x2, 0x3, 0x10, 0x7f, 0x80, 0xff])
            XCTAssertEqual(data.count, 8)
        }
        
        if true {
            let data = Data(bytes: [])
            XCTAssertEqual(data.count, 0)
        }
    }
    
    func testSubscript() {
        if true {
            let data = Data(bytes: [0x0, 0x1, 0x2, 0x3, 0x10, 0x7f, 0x80, 0xff])
            
            XCTAssertEqual(data[0]!, 0x0)
            XCTAssertEqual(data[1]!, 0x1)
            XCTAssertEqual(data[2]!, 0x2)
            XCTAssertEqual(data[3]!, 0x3)
            XCTAssertEqual(data[4]!, 0x10)
            XCTAssertEqual(data[5]!, 0x7f)
            XCTAssertEqual(data[6]!, 0x80)
            XCTAssertEqual(data[7]!, 0xff)
            
            XCTAssert(data[-1] == nil)
            XCTAssert(data[8] == nil)
        }
        
        if true {
            let data = Data(bytes: [])
            
            XCTAssert(data[-1] == nil)
            XCTAssert(data[0] == nil)
        }
    }
    
    func testFirst() {
        if true {
            let data = Data(bytes: [0x0, 0x1, 0x2, 0x3, 0x10, 0x7f, 0x80, 0xff])
            
            XCTAssertEqual(data.first!, 0x0)
        }
        
        if true {
            let data = Data(bytes: [])
            
            XCTAssert(data.first == nil)
        }
    }
    
    func testLast() {
        if true {
            let data = Data(bytes: [0x0, 0x1, 0x2, 0x3, 0x10, 0x7f, 0x80, 0xff])
            
            XCTAssertEqual(data.last!, 0xff)
        }
        
        if true {
            let data = Data(bytes: [])
            
            XCTAssert(data.last == nil)
        }
    }
    
    func testBytes() {
        if true {
            let bytes = Data(bytes: [0x0, 0x1, 0x2, 0x3, 0x10, 0x7f, 0x80, 0xff]).bytes
            
            XCTAssertEqual(bytes.count, 8)
            
            XCTAssertEqual(bytes[0], 0x0)
            XCTAssertEqual(bytes[1], 0x1)
            XCTAssertEqual(bytes[2], 0x2)
            XCTAssertEqual(bytes[3], 0x3)
            XCTAssertEqual(bytes[4], 0x10)
            XCTAssertEqual(bytes[5], 0x7f)
            XCTAssertEqual(bytes[6], 0x80)
            XCTAssertEqual(bytes[7], 0xff)
        }
        
        if true {
            let bytes = Data(bytes: []).bytes
            
            XCTAssertEqual(bytes.count, 0)
        }
    }
    
    func testDescription() {
        if true {
            let data = Data(bytes: [0x0, 0x1, 0x2, 0x3, 0x10, 0x7f, 0x80, 0xff])
            
            XCTAssertEqual(data.description, "00010203107f80ff")
        }
        
        if true {
            let data = Data(bytes: [])
            
            XCTAssertEqual(data.description, "")
        }
    }
    
    func testExample() {
        let data0 = Data(bytes: [0x0, 0x1, 0x2, 0x3, 0x10, 0x7f, 0x80, 0xff])
        let index = 2
        
        //
        
        let data: Data = Data(rawData: NSData(data: data0.rawData))
        
        let byte: UInt8? = data[index] // `nil` when the `index` is out of bounds
        let first: UInt8? = data.first // equivalent to `data[0]`
        let last: UInt8? = data.last // equivalent to `data[data.count -1]`
        let count: Int = data.count
        let hex: String = data.description // something like "0a1c7f72"
        let rawData: NSData = data.rawData
        
        for byte: UInt8 in data {
            println(byte)
        }
        
        let integers: [Int] = map(data) { Int($0) }
        
        //
        
        XCTAssertEqual(byte!, 0x2)
        XCTAssertEqual(first!, 0x0)
        XCTAssertEqual(last!, 0xff)
        XCTAssertEqual(count, 8)
        XCTAssertEqual(hex, "00010203107f80ff")
        XCTAssertEqual(rawData, data0.rawData)
        XCTAssertEqual(integers, [0, 1, 2, 3, 16, 127, 128, 255])
    }
}
