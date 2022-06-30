//
//  UseCase.swift
//  CleanArchitectureMvvm
//
//  Created by Jaemin Lee on 2022/06/30.
//

import Foundation

//@discardableResult
// Cancellable
public protocol UseCase {
    @discardableResult
    func start() -> Cancellable?
}
