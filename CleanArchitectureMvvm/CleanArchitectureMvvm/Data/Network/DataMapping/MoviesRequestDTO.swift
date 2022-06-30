//
//  MoviesRequestDTO.swift
//  CleanArchitectureMvvm
//
//  Created by Jaemin Lee on 2022/06/30.
//

import Foundation

struct MoviesRequestDTO: Encodable {
    let query: String
    let page: Int
}
