//  Created by William Vabrinskas on 12/13/20.
//

import Foundation
import os

/// Type of adkit log
public enum LogType: String {
  
  case Error
  case Success
  case TimeOut
  case Loading
  case Message
  
  /// Prefix to add to log statement
  /// - Returns: String to prepend
  func prefix() -> String {
    let suffix = self.rawValue.uppercased()
    switch self {
    case .Error:
      return "🔴 \(suffix): "
    case .Success:
      return "🟢 \(suffix):"
    case .TimeOut:
      return "⏱ \(suffix):"
    case .Loading, .Message:
      return "🟡 \(suffix):"
    }
  }
  
  /// Log type for system
  /// - Returns: OSLogType
  func osLogType() -> OSLogType {
    switch self {
    case .Error:
      return .error
    case .Success:
      return .default
    case .TimeOut:
      return .fault
    case .Loading, .Message:
      return .info
    }
  }
  
  /// Determines whether logs should be shown
  /// - Parameter level: Adjusts for log level
  /// - Returns: Bool that determines if you should show a log type
  func canShow(for level: LogLevel) -> Bool {
    switch level {
    case .none:
      return false
    case .low:
      return self == .Success
    case .medium:
      return self == .Success || self == .Loading
    case .high:
      return true
    case .timeout:
      return self == .TimeOut
    }
  }
}

public enum LogLevel: Int {
  //show no ad logs
  case none
  
  //show only success logs
  case low
  
  //show only success and loading logs
  case medium
  
  //show all logs
  case high
  
  //show timeout only logs
  case timeout
}

public protocol Logger {
  static var osLogger: OSLog { get }
  var logLevel: LogLevel { get set }
  static func log(type: LogType, message: String)
  func log(type: LogType, message: String)
}

extension Logger {
  public var logLevel: LogLevel {
    get {
      return .high
    }
  }
  
  public static var osLogger: OSLog {
    get {
      return OSLog(subsystem: "com.neuroncoordinator.plist", category: "neuron-network-log")
    }
  }
  
  public static func log(type: LogType, message: String) {
    let message = "\(type.prefix()) - \(message)"
    os_log("%@", log: osLogger, type: type.osLogType(), message)
  }
  
  public func log(type: LogType, message: String) {
    if type.canShow(for: self.logLevel) {
      let message = "\(type.prefix()) - \(message)"
      os_log("%@", log: Self.osLogger, type: type.osLogType(), message)
    }
  }
}
