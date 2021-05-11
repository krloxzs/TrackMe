//
//  DataExtension.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 10/05/21.
//

import Foundation

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
