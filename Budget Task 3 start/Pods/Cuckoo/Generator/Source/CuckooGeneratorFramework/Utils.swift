//
//

import Foundation
import SourceKittenFramework

extension String {
    var trimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    func takeUntil(occurence: String) -> String? {
        return components(separatedBy: occurence).first
    }

    subscript(range: Range<Int>) -> String {
        let stringRange = index(startIndex, offsetBy: range.lowerBound)..<index(startIndex, offsetBy: range.upperBound)
        return String(self[stringRange])
    }
}

extension String.UTF8View {
    subscript(range: Range<Int>) -> String {
        let stringRange = index(startIndex, offsetBy: range.lowerBound)..<index(startIndex, offsetBy: range.upperBound)
        let subsequence: String.UTF8View.SubSequence = self[stringRange]
        return String(subsequence) ?? ""
    }
}

extension String {
    func regexMatches(_ source: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: self)
        return regex.firstMatch(in: source, range: NSRange(location: 0, length: source.count)) != nil
    }
}

extension Sequence {
    #if !swift(>=4.1)
    public func compactMap<O>(_ transform: (Element) -> O?) -> [O] {
        return self.flatMap(transform)
    }
    #endif


    func only<T>(_ type: T.Type) -> [T] {
        return compactMap { $0 as? T }
    }

    func noneOf<T>(_ type: T.Type) -> [Iterator.Element] {
        return filter { !($0 is T) }
    }
}

internal func extractRange(from dictionary: [String: SourceKitRepresentable], offset: Key, length: Key) -> CountableRange<Int>? {
    guard let offset = (dictionary[offset.rawValue] as? Int64).map(Int.init),
        let length = (dictionary[length.rawValue] as? Int64).map(Int.init) else { return nil }

    return offset..<offset.advanced(by: length)
}
