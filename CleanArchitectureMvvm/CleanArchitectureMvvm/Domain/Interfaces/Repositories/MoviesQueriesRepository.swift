//
//  MoviesQueriesRepository.swift
//  CleanArchitectureMvvm
//
//  Created by Jaemin Lee on 2022/06/30.
//

import Foundation

protocol MoviesQueriesRepository {
    func fetchRecentsQueries(maxCount: Int, completion: @escaping (Result<[MovieQuery], Error>) -> Void)
    func saveRecentQuery(query: MovieQuery, completion: @escaping (Result<MovieQuery, Error>) -> Void)
}
