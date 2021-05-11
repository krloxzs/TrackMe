//
//  LoginLocalDataManager.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 09/05/21.
//  
//

import Foundation

class LoginLocalDataManager:LoginLocalDataManagerInputProtocol {

    func saveUserInfo(user: User, completion: () -> Void) {
        KeyChanManager().saveUserInfo(name: user.name ?? "",
                                      email: user.email ?? "",
                                      userId: String(user.id ?? 0))
    }
}
