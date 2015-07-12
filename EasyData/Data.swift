import Foundation

public struct Data {
    public let rawData: NSData
    
    public init(rawData: NSData) {
        self.rawData = rawData
    }
    
    public var count: Int {
        return rawData.length
    }
    
    public subscript (index: Int) -> UInt8? {
        if index < 0 || index >= count {
            return nil
        }
        return UnsafePointer<UInt8>(rawData.bytes)[index]
    }
    
    public var first: UInt8? {
        return self[0]
    }
    
    public var last: UInt8? {
        return self[count - 1]
    }
}

extension Data { // Array
    public init(bytes: [UInt8]) {
        var pointer = UnsafeMutablePointer<UInt8>.alloc(bytes.count)
        pointer.initializeFrom(bytes)
        self.init(rawData: NSData(bytesNoCopy: pointer, length: bytes.count, freeWhenDone: true))
    }
    
    public var bytes: [UInt8] {
        return map(self) { $0 }
    }
}

extension Data: SequenceType {
    public func generate() -> GeneratorOf<UInt8> {
        var pointer: UnsafeMutablePointer<UInt8> = UnsafeMutablePointer<UInt8>(rawData.bytes)
        var index = 0
        let count = self.count
        
        return GeneratorOf<UInt8> {
            if index >= count {
                return nil
            }
            
            let value = pointer.memory
            pointer++
            index++
            return value
        }
    }
}

extension Data: Printable {
    public var description: String {
        return "".join(map(self) { String(format: "%02x", arguments: [$0]) })
    }
}