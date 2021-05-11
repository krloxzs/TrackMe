//
//  AlertHelper.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 10/05/21.
//

import Foundation
import SPAlert

class AlertHelper {
    func showError(message: String) {
        let alertView = SPAlertView(title: message, preset: .error)
        alertView.dismissByTap = true
        alertView.present(duration: 3)
    }
    
    func showAlert(message: String, completion: @escaping () -> Void) {
        let alertView = SPAlertView(title: message, preset: .done)
        alertView.dismissByTap = true
        alertView.present(duration: 3) {
            completion()
        }
    }
}
