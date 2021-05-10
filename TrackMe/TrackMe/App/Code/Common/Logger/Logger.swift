//
//  Logger.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 10/05/21.
//

import Foundation
import NSLogger

protocol Looger {
    func prepareLogger()
    func logInfo(domain: Logger.Domain, level: Logger.Level,message: String)
    func logError(domain: Logger.Domain, message: String)
    
}
class LoggerManager: Looger {
    var initTimer: String
    
    init() {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        initTimer = "\(hour) : \(minutes)"
    }

    func prepareLogger() {
        // TODO: only use it in dev
    }

    func logInfo(domain: Logger.Domain, level: Logger.Level, message: String) {
        Logger.shared.log(domain, level, message)
    }

    func logInfo(domain: Logger.Domain? = Logger.Domain.app, level: Logger.Level? = Logger.Level.debug, message: String) {
        self.logInfo(domain: domain, level: level, message: message)
    }

    func logError(domain: Logger.Domain, message: String) {
        Logger.shared.log(domain, Logger.Level.error, message)
    }

}
