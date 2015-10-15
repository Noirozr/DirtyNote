//: Playground - noun: a place where people can play

import UIKit

let example = "Hello World"
let DNS = "com.Serious.advanced"

let dic = ["ZERO": 0, "One": 1]
print(dic.description)


let cache = NSCache()
let name = "lastSep"

cache.name = DNS + name
print(cache.name)

let path = NSSearchPathForDirectoriesInDomains(.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)

let view = UIStackView()


let sbv1 = UIView()
let sbv2 = UIView()
view.addArrangedSubview(sbv1)
view.addArrangedSubview(sbv2)

view.subviews.forEach { (subView) -> () in
    subView.removeFromSuperview()
}
//颜色转换
extension UIColor {
    
    func SKT_colorWithHexString(stringToConvert: String, var alpha: CGFloat) -> UIColor {
        //先对特殊情况进行判断
        if alpha > 1.0 || alpha < 0.0 {
            alpha = 1.0
        }
        //去除空格
        var cString: NSString = stringToConvert.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        //先对特殊情况进行判断
        if cString.length != 6 {
            return UIColor.whiteColor()
        }
        if cString.hasPrefix("0X") {
            cString = cString.substringFromIndex(2)
        }
        
        if cString.hasPrefix("#") {
            cString = cString.substringFromIndex(1)
        }
        
        var range = NSMakeRange(0, 2)
        let rString = cString.substringWithRange(range)
        range.location = 2
        let gString = cString.substringWithRange(range)
        range.location = 4
        let bString = cString.substringWithRange(range)
        
        var r: UInt32 = 0
        var g: UInt32 = 0
        var b: UInt32 = 0
        
        NSScanner(string: rString as String).scanHexInt(&r)
        NSScanner(string: gString as String).scanHexInt(&g)
        NSScanner(string: bString as String).scanHexInt(&b)
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
}

// countElement 在 swift 2.0 里面已经 byebye 咯～
var sentence = "for the first time and forever."
print(sentence.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))

let array = ["A", "B"]
for (i, j) in array.enumerate() {
    print("\(i):\(j)")
}

var mini = min(8, 2, 3, 5)
var maxi = max(8, 2, 3, 7)

for i in ["B", "A"].sort() {
    print(i)
}

var yichi = abs(-1)
var yonnjuni = abs(-42)
var yonnjuni2 = abs(42)

print([26, 32, 12, 65, 55, 74].contains(32))


var languages = ["swift", "Objective-C"]
print(languages.joinWithSeparator("/"))

print(languages.contains("swift"))
print(languages.contains("Java"))

var newLanguage = languages.dropFirst()
newLanguage == ["Objective-C"]

dump(languages)

for i in (1...100).filter({$0 % 10 == 0}) {
    print(i)
    print(assert([10, 20, 30, 40, 50, 60, 70, 80, 90, 100].contains(i)))
}

"football".hasPrefix("foo")
(10...100).startsWith(10...19)
languages.startsWith(["swift"])

[1, 2, 3].reverse() == [3, 2, 1]
for i in ([1, 2, 3].reverse()) {
    print(i)
}

print((1...10).minElement())
print(languages.minElement())

languages.reduce("", combine: {$0 + $1})
[1, 2, 3].reduce(1, combine: {$0 * $1})





