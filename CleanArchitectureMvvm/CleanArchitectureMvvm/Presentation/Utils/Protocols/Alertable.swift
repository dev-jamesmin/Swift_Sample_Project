//
//  Alertable.swift
//  CleanArchitectureMvvm
//
//  Created by Jaemin Lee on 2022/07/04.
//

//import Foundation
import UIKit

public protocol Alertable {}

// 알럿 처리 관련 프로토콜
// where
public extension Alertable where Self: UIViewController {
    
    func showAlert(title: String = "", message: String, preferredStyle: UIAlertController.Style = .alert, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: completion)
    }
}
