//
//  MoviesQueryListViewModel.swift
//  CleanArchitectureMvvm
//
//  Created by Jaemin Lee on 2022/07/04.
//

import Foundation

typealias MoviesQueryListViewModelDidSelectAction = (MovieQuery) -> Void

// 인풋
protocol MoviesQueryListViewModelInput {
    func viewWillAppear()
    func didSelect(item: MoviesQueryListItemViewModel)
}

// 아웃풋.
protocol MoviesQueryListViewModelOutput {
    var items: Observable<[MoviesQueryListItemViewModel]> { get }
}

// 프로토콜
protocol MoviesQueryListViewModel: MoviesQueryListViewModelInput, MoviesQueryListViewModelOutput { }

typealias FetchRecentMovieQueriesUseCaseFactory = (
    FetchRecentMovieQueriesUseCase.RequestValue,
    @escaping (FetchRecentMovieQueriesUseCase.ResultValue) -> Void
    ) -> UseCase

// 디폴트??
final class DefaultMoviesQueryListViewModel: MoviesQueryListViewModel {

    private let numberOfQueriesToShow: Int
    private let fetchRecentMovieQueriesUseCaseFactory: FetchRecentMovieQueriesUseCaseFactory
    private let didSelect: MoviesQueryListViewModelDidSelectAction?
    
    // MARK: - OUTPUT
    let items: Observable<[MoviesQueryListItemViewModel]> = Observable([])
    
    init(numberOfQueriesToShow: Int,
         fetchRecentMovieQueriesUseCaseFactory: @escaping FetchRecentMovieQueriesUseCaseFactory,
         didSelect: MoviesQueryListViewModelDidSelectAction? = nil) {
        self.numberOfQueriesToShow = numberOfQueriesToShow
        self.fetchRecentMovieQueriesUseCaseFactory = fetchRecentMovieQueriesUseCaseFactory
        self.didSelect = didSelect
    }
    
    private func updateMoviesQueries() {
        let request = FetchRecentMovieQueriesUseCase.RequestValue(maxCount: numberOfQueriesToShow)
        let completion: (FetchRecentMovieQueriesUseCase.ResultValue) -> Void = { result in
            switch result {
            case .success(let items):
                self.items.value = items.map { $0.query }.map(MoviesQueryListItemViewModel.init)
            case .failure: break
            }
        }
        let useCase = fetchRecentMovieQueriesUseCaseFactory(request, completion)
        useCase.start()
    }
}

// MARK: - INPUT. View event methods
extension DefaultMoviesQueryListViewModel {
        
    func viewWillAppear() {
        updateMoviesQueries()
    }
    
    func didSelect(item: MoviesQueryListItemViewModel) {
        didSelect?(MovieQuery(query: item.query))
    }
}