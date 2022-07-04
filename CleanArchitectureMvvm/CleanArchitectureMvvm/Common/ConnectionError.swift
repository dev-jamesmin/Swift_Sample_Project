//
//  ConnectionError.swift
//  CleanArchitectureMvvm
//
//  Created by Jaemin Lee on 2022/07/04.
//

import Foundation

// 에러 프로토콜
public protocol ConnectionError: Error {
    var isInternetConnectionError: Bool { get }
}

// 확장
// isInternetConnectionError -> true??
public extension Error {
    var isInternetConnectionError: Bool {
        guard let error = self as? ConnectionError, error.isInternetConnectionError else {
            return false
        }
        return true
    }
}
