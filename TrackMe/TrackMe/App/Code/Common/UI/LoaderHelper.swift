//
//  LoaderHelper.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 10/05/21.
//

import Foundation
import MBProgressHUD

protocol LoaderHelperProtocols {
    func showLoader(view: UIViewController, completion: @escaping () -> Void)
    func hideLoader(view: UIViewController, completion: @escaping () -> Void)
}
class LoaderHelper: LoaderHelperProtocols {
    func showLoader(view: UIViewController, completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            let Indicator = MBProgressHUD.showAdded(to: view.view, animated: true)
            Indicator.label.text = "self.localizables.SignUpRegisterInProgressTitle"
            Indicator.isUserInteractionEnabled = false
            Indicator.detailsLabel.text = "self.localizables.loading"
            Indicator.show(animated: true)
            completion()
        }
    }


    func hideLoader(view: UIViewController, completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: view.view, animated: true)
            completion()
        }
    }
    
}
