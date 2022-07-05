//
//  MoviesListItemCell.swift
//  CleanArchitectureMvvm
//
//  Created by Jaemin Lee on 2022/06/30.
//

//import Foundation
import UIKit

// 셀 아이템 -> 코드 로만 그리는가?
// 스토리 보드에 셀 존재 한다.

final class MoviesListItemCell: UITableViewCell {

    // 아이템셀 아이덴티 파이어
    static let reuseIdentifier = String(describing: MoviesListItemCell.self)
    // 높이 설정
    static let height = CGFloat(130)

    // 항목별 아웃렛 반드시 ! 처리
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var overviewLabel: UILabel!
    @IBOutlet private var posterImageView: UIImageView!

    // 뷰모델
    private var viewModel: MoviesListItemViewModel!
    private var posterImagesRepository: PosterImagesRepository?
    
//    태스크.. 이해 필요
    private var imageLoadTask: Cancellable? { willSet { imageLoadTask?.cancel() } }

    // 콘피그 대신 필로 .
    func fill(with viewModel: MoviesListItemViewModel, posterImagesRepository: PosterImagesRepository?) {
        self.viewModel = viewModel
        self.posterImagesRepository = posterImagesRepository

        titleLabel.text = viewModel.title
        dateLabel.text = viewModel.releaseDate
        overviewLabel.text = viewModel.overview
        // 이미지뷰 별도 처리 추가.
        updatePosterImage(width: Int(posterImageView.imageSizeAfterAspectFit.scaledSize.width))
    }

    private func updatePosterImage(width: Int) {
        posterImageView.image = nil
        guard let posterImagePath = viewModel.posterImagePath else { return }

        imageLoadTask = posterImagesRepository?.fetchImage(with: posterImagePath, width: width) { [weak self] result in
            guard let self = self else { return }
            guard self.viewModel.posterImagePath == posterImagePath else { return }
            if case let .success(data) = result {
                self.posterImageView.image = UIImage(data: data)
            }
            self.imageLoadTask = nil
        }
    }
}
