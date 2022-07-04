//
//  BlackStyleNavigationBarBehavior.swift
//  CleanArchitectureMvvm
//
//  Created by Jaemin Lee on 2022/07/04.
//

//import Foundation
import UIKit

struct BlackStyleNavigationBarBehavior: ViewControllerLifecycleBehavior {

    func viewDidLoad(viewController: UIViewController) {

        viewController.navigationController?.navigationBar.barStyle = .black
    }
}
