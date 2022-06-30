//
//  PosterImagesRepository.swift
//  CleanArchitectureMvvm
//
//  Created by Jaemin Lee on 2022/06/30.
//

import Foundation

protocol PosterImagesRepository {
    func fetchImage(with imagePath: String, width: Int, completion: @escaping (Result<Data, Error>) -> Void) -> Cancellable?
}
