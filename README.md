EasyData
=====================

_EasyData_ is a thin wrapper of `NSData` which provides some convenience APIs such that `subscript`, `SequenceType` and hex `description`.

```swift
let data: Data = Data(rawData: NSData(...))

let byte: UInt8? = data[index] // `nil` when the `index` is out of bounds
let first: UInt8? = data.first // equivalent to `data[0]`
let last: UInt8? = data.last // equivalent to `data[data.count -1]`
let count: Int = data.count
let hex: String = data.description // something like "0a1c7f72"
let rawData: NSData = data.rawData

for byte: UInt8 in data {
    ...
}

let integers: [Int] = map(data) { Int($0) }
```

License
---------------------

[The MIT License](LICENSE)
