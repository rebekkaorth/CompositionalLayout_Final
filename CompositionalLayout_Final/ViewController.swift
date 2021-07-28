//
//  ViewController.swift
//  CompositionalLayout_Final
//
//  Created by Rebekka Orth on 21.07.21.
//

import UIKit

class ViewController: UIViewController {
    struct Section {
        let category: CategoryViewModel
        let type: CategoryType
    }

    private var categories: [Section] = [
        Section(category: TestViewModel.hotAndWorthItViewModel, type: .hotAndWorthIt),
        Section(category: TestViewModel.continueWatchingViewModel, type: .continueWatching),
        Section(category: TestViewModel.fromYourListViewModel, type: .fromYourList),
        Section(category: TestViewModel.whatYouMightLikeViewModel, type: .whatYouMightLike)
    ]

    @IBOutlet private weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.collectionView.collectionViewLayout = CompositionalLayout.createCompositionalLayout(models: categories)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self

        collectionView.register(
            UINib(nibName: SimpleCollectionViewCell.reuseIdentifier, bundle: nil),
            forCellWithReuseIdentifier: SimpleCollectionViewCell.reuseIdentifier
        )

        collectionView.register(
            UINib(nibName: SectionHeadlineReusableView.reuseIdentifier, bundle: nil),
            forSupplementaryViewOfKind: "header",
            withReuseIdentifier: SectionHeadlineReusableView.reuseIdentifier
        )
    }
}

extension ViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        self.categories.count
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.categories[section].category.movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SimpleCollectionViewCell.reuseIdentifier, for: indexPath) as? SimpleCollectionViewCell
        else {
            fatalError("Failed to dequeue `SimpleCollectionViewCell`")
        }

        if let imageUrl = categories[indexPath.section].category.movies[indexPath.row].movieImageUrl {
            cell.image = imageUrl.toImage()
        }

        cell.title = categories[indexPath.section].category.movies[indexPath.row].movieTitle

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reusableView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: SectionHeadlineReusableView.reuseIdentifier,
            for: indexPath
        ) as? SectionHeadlineReusableView

        reusableView?.headline = self.categories[indexPath.section].category.headline

        return reusableView!
    }
}
