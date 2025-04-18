//
//

import Foundation
import FileKit

public enum CuckooGeneratorError: Error {
    case ioError(FileKitError)
    case unknownError(Error)
    case stderrUsed
    
    public var description: String {
        switch self {
        case .ioError(let error):
            return error.description
        case .unknownError(let error):
            return "\(error)"
        case .stderrUsed:
            return ""
        }
    }
}
