//
//  BackButtonEmptyTitleNavigationBarBehavior.swift
//  CleanArchitectureMvvm
//
//  Created by Jaemin Lee on 2022/07/04.
//

//import Foundation
import UIKit

struct BackButtonEmptyTitleNavigationBarBehavior: ViewControllerLifecycleBehavior {

    func viewDidLoad(viewController: UIViewController) {

        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
