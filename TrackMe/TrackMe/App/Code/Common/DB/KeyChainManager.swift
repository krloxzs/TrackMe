//
//  KeyChainManager.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 09/05/21.
//

import Foundation
import KeychainSwift

class KeyChanManager {
    let prefix = "3T9SZTCQ53"

    func saveUserInfo(name: String, email: String, password: String, userId: String) {
        let keychain = KeychainSwift()
        keychain.accessGroup = "\(prefix)com.krloxzs.trackme.TrackMe"
        keychain.set(name, forKey: "userName")
        keychain.set(email, forKey: "email")
        keychain.set(password, forKey: "password")
        keychain.set(userId, forKey: "userId")
    }

    func getUserLogedIn() -> Bool {
        let keychain = KeychainSwift()
        keychain.accessGroup = "\(prefix)com.krloxzs.trackme.TrackMe"
        guard let _ = keychain.get("userName"),
           let _ = keychain.get("password") else {
            return false
        }
        return true
    }
    
    func getUserInfo() -> userInfo? {
        let keychain = KeychainSwift()
        keychain.accessGroup = "\(prefix)com.krloxzs.trackme.TrackMe"
        guard let name = keychain.get("userName"),
              let email = keychain.get("email"), let userId = keychain.get("userId")  else {
            return nil
        }
        return userInfo(name: name,
                        email: email,
                        userId: userId)
    }
    func deleteUserInfo()  {
        let keychain = KeychainSwift()
        keychain.accessGroup = "\(prefix)com.krloxzs.trackme.TrackMe"
        keychain.delete("userName")
        keychain.delete("email")
        keychain.delete("password")
        keychain.delete("userId")
    }

}

struct userInfo {
    var name: String
    var email: String
    var userId: String
}
