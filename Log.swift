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
/// `Log.debugLog("Test %@", log: .network, "value")`
/// `Log.debugLog("Test")`
///
/// ************************************************

/// Wrapper class for Unified Logging System
class Log {
    
    /// Function to print `DEBUG` logs
    /// - Parameters:
    ///   - message: A constant string message which needs to be logged
    ///   - log: A custom OSLog object type. If unspecified default is  `ui`
    ///   - args: Don't specify `args` if  message is a constant string.
    ///   When its a format string pass on the expected number of arguments in the order that they appear in the string
    ///
    public static func debugLog(_ message: StaticString,
                                log: OSLog? = .ui,
                                _ args: CVarArg...) {
        os_log(message, log: log ?? .ui, type: .debug, args)
    }
    
    /// Function to print log with `DEFAULT` mode
    /// - Parameters:
    ///   - message: A constant string message which needs to be logged
    ///   - log: A custom OSLog object type. If unspecified default is  `ui`
    ///   - args: Don't specify `args` if  message is a constant string.
    ///   When its a format string pass on the expected number of arguments in the order that they appear in the string
    ///
    public static func defaultLog(_ message: StaticString,
                                  log: OSLog? = .ui,
                                  _ args: CVarArg...) {
        os_log(message, log: log ?? .ui, type: .default, args)
    }
    
    /// Function to print `ERROR` logs
    /// - Parameters:
    ///   - message: A constant string message which needs to be logged
    ///   - log: A custom OSLog object type. If unspecified default is  `ui`
    ///   - args: Don't specify `args` if  message is a constant string.
    ///   When its a format string pass on the expected number of arguments in the order that they appear in the string
    ///
    public static func errorLog(_ message: StaticString,
                                log: OSLog? = .ui,
                                _ args: CVarArg...) {
        os_log(message, log: log ?? .ui, type: .error, args)
    }
    
    /// Function to print `INFO` logs
    /// - Parameters:
    ///   - message: A constant string message which needs to be logged
    ///   - log: A custom OSLog object type. If unspecified default is  `ui`
    ///   - args: Don't specify `args` if  message is a constant string.
    ///   When its a format string pass on the expected number of arguments in the order that they appear in the string
    ///
    public static func infoLog(_ message: StaticString,
                               log: OSLog? = .ui,
                               _ args: CVarArg...) {
        os_log(message, log: log ?? .ui, type: .info, args)
    }
    
    /// Function to print `FAULT` logs
    /// - Parameters:
    ///   - message: A constant string message which needs to be logged
    ///   - log: A custom OSLog object type. If unspecified default is  `ui`
    ///   - args: Don't specify `args` if  message is a constant string.
    ///   When its a format string pass on the expected number of arguments in the order that they appear in the string
    ///
    public static func faultLog(_ message: StaticString,
                                log: OSLog? = .ui,
                                _ args: CVarArg...) {
        os_log(message, log: log ?? .ui, type: .fault, args)
    }
}

/// Adding different `categories` and `subsystems`
extension OSLog {
    
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    /// Categorizing all the logs related to `UI`
    static let ui = OSLog(subsystem: subsystem, category: "UI")
    
    /// Categorizing all the logs related to `Network`
    static let network = OSLog(subsystem: subsystem, category: "Network")
    
    /// Categorizing all the logs related to `Authentication`
    static let auth = OSLog(subsystem: subsystem, category: "Authentication")
}
