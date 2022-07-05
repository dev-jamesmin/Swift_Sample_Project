//
//  PosterImagesRepository.swift
//  CleanArchitectureMvvm
//
//  Created by Jaemin Lee on 2022/06/30.
//

import Foundation

// 포스터 이미지 관련 프로토콜
protocol PosterImagesRepository {
    
//    with imagePath: String, -> 이미지 경로
//    width: Int, -> 사이즈
//    completion: @escaping (Result<Data, Error>) -> Void. -> 클로져.  리절트 관련 ?? 로드 정상 완료시 리절트 반환?
    
    
    
    func fetchImage(with imagePath: String, width: Int, completion: @escaping (Result<Data, Error>) -> Void) -> Cancellable?
}
