//
//  User.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 10/05/21.
//

import Foundation

// MARK: - User
struct User: Codable {
    var id: Int?
    var name, email, success: String?
}
