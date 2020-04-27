//
//  Log.swift
//  Experience
//
//  Created by Kumar, Sumit on 25/04/20.
//  Copyright © 2020 sk. All rights reserved.
//

import Foundation
import os.log

/// ************************************************
///
/// `Usage sample :`
/// `Log.debugLog("Test: \(value)", log: .network)`
/// `Log.debugLog("Test")`
///
///  `Output sample [DEBUG]:`
///  `[Network] [Main] Test: value`
///  `[UI] [Main] Test`
///
/// `Output sample [OTHER LOG LEVELS]:`
///  `[Network] Test: value`
///  `[UI] Test`
///
/// ************************************************

/// Wrapper class for Unified Logging System
class Log: NSObject {
    
    /// Function to print `DEBUG` logs
    /// - Parameters:
    ///   - message: A constant string message which needs to be logged
    ///   - log: A custom OSLog object type. If unspecified default is  `ui`
    ///
    public static func debugLog(_ message: String,
                                log: OSLog? = .ui) {
        Log.log(message, .debug, log: log ?? .ui)
    }
    
    /// Function to print log with `DEFAULT` mode
    /// - Parameters:
    ///   - message: A constant string message which needs to be logged
    ///   - log: A custom OSLog object type. If unspecified default is  `ui`
    ///
    public static func defaultLog(_ message: String,
                                  log: OSLog? = .ui) {
        Log.log(message, .default, log: log ?? .ui)
    }
    
    /// Function to print `ERROR` logs
    /// - Parameters:
    ///   - message: A constant string message which needs to be logged
    ///   - log: A custom OSLog object type. If unspecified default is  `ui`
    ///
    public static func errorLog(_ message: String,
                                log: OSLog? = .ui) {
        Log.log(message, .error, log: log ?? .ui)
    }
    
    /// Function to print `INFO` logs
    /// - Parameters:
    ///   - message: A constant string message which needs to be logged
    ///   - log: A custom OSLog object type. If unspecified default is  `ui`
    ///
    public static func infoLog(_ message: String,
                               log: OSLog? = .ui) {
        Log.log(message, .info, log: log ?? .ui)
    }
    
    /// Function to print `FAULT` logs
    /// - Parameters:
    ///   - message: A constant string message which needs to be logged
    ///   - log: A custom OSLog object type. If unspecified default is  `ui`
    ///
    public static func faultLog(_ message: String,
                                log: OSLog? = .ui) {
        Log.log(message, .fault, log: log ?? .ui)
    }
    
}

extension Log {
    
    /// This is to get current thread name
    /// - Returns: Thread name
    ///
    private static var currentThread: String {
        if Thread.isMainThread {
            return "Main"
        } else {
            if let threadName = Thread.current.name, !threadName.isEmpty {
                return"\(threadName)"
            } else if let queueName = String(validatingUTF8: __dispatch_queue_get_label(nil)), !queueName.isEmpty {
                return"\(queueName)"
            } else {
                return String(format: "%p", Thread.current)
            }
        }
    }
    
    /// Function to log message on `os_log` as per the log type with current thread info
    /// - Parameters:
    ///   - message: A constant string message which needs to be logged
    ///   - type: A OSLogType type. Default is  `default`. Log type level, for example, .debug, .info, .error etc
    ///   - log: A custom OSLog object type. If unspecified default is  `ui`
    ///
    public static func log(_ message: String,
                           _ type: OSLogType = .default,
                           log: OSLog = .ui) {
        
        /// Logging current thread info only in debug mode
        if type == .debug {
            os_log("[%@] %@", log: log, type: type, currentThread, message)
        } else {
            os_log("%@", log: log, type: type, message)
        }
    }
}

/// Adding different `categories` and `subsystems`
/// Creates OSLog object which describes log subsystem and category

extension OSLog {
    
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    /// Categorizing all the logs related to `User Experience Layer`
    static let ui = OSLog(subsystem: subsystem, category: "UI")
    
    /// Categorizing all the logs related to `Network layer`
    static let network = OSLog(subsystem: subsystem, category: "Network")
    
    /// Categorizing all the logs related to `Authentication`
    static let auth = OSLog(subsystem: subsystem, category: "Authentication")
}
