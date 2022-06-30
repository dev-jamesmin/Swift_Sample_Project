//
//  MovieQueryEntity+Mapping.swift
//  CleanArchitectureMvvm
//
//  Created by Jaemin Lee on 2022/06/30.
//

import Foundation
import CoreData


//@objc(MovieQueryEntity)
//public class MovieQueryEntity: NSManagedObject {
//
//}

// 코어 데이터 모델  작성 실습 중.

extension MovieQueryEntity {
    convenience init(movieQuery: MovieQuery, insertInto context: NSManagedObjectContext) {
        self.init(context: context)
        query = movieQuery.query
        createdAt = Date()
    }
}

extension MovieQueryEntity {
    func toDomain() -> MovieQuery {
        return .init(query: query ?? "")
    }
}
