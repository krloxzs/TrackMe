//
//  Constants.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 10/05/21.
//
import Foundation
import UIKit

struct Constants {
    struct Inactivity {
        static let seconds: TimeInterval = 600
    }

    struct Identifiers {
        static let color = "ui.products.colors"
        static let size = "ui.products.sizes"
        static let option = "ui.selector.options"
    }

    struct CollectionCell {
        static let minimumWidth = 42
        static let height = 52
        static let optionMinWidth = CGFloat(100)
    }

    struct Font {
        static let boldText = UIFont.boldSystemFont(ofSize: 16.0)
        static let text = UIFont.systemFont(ofSize: 16.0)
        static let regular = UIFont.systemFont(ofSize: 16, weight: .regular)
        static let medium = UIFont.systemFont(ofSize: 16, weight: .medium)
    }



    struct LanguageCode {
        static let english = "en"
        static let spanish = "es"
    }

    struct Notifications {
        static let updateScannerBanner: String = "com.trackmee.notifications.example"
    }

    struct AppColors {
        static let primaryColorMajorelleBlue = UIColor(red: 102.0/255, green: 70.0/255, blue: 255.0/255, alpha: 1.0)
        static let primaryColorMajorelleBlueDisable = UIColor(red: 102.0/255, green: 70.0/255, blue: 255.0/255, alpha: 0.6)
        static let primaryColorBlackOlive = UIColor(red: 65.0/255, green: 70.0/255, blue: 61.0/255, alpha: 1.0)
        static let primaryColorVividSkyBlue = UIColor(red: 6.0/255, green: 190.0/255, blue: 255.0/255, alpha: 1.0)
        static let primaryColorShockingPinkCrayola = UIColor(red: 255.0/255, green: 83.0/255, blue: 247.0/255, alpha: 1.0)
    }
}
