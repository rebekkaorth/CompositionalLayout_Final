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
        Section(category: TestViewModel.searchViewModel, type: .search),
        Section(category: TestViewModel.hotAndWorthItViewModel, type: .hotAndWorthIt),
        Section(category: TestViewModel.continueWatchingViewModel, type: .continueWatching),
        Section(category: TestViewModel.fromYourListViewModel, type: .fromYourList),
        Section(category: TestViewModel.whatYouMightLikeViewModel, type: .whatYouMightLike)
    ]

    @IBOutlet private weak var collectionView: UICollectionView!

    private var globalHeader: UICollectionReusableView? {
        collectionView.visibleSupplementaryViews(ofKind: "layout-header-element-kind").first
    }

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
            UINib(nibName: SearchCell.reuseIdentifier, bundle: nil),
            forCellWithReuseIdentifier: SearchCell.reuseIdentifier
        )

        collectionView.register(
            UINib(nibName: SectionHeadlineReusableView.reuseIdentifier, bundle: nil),
            forSupplementaryViewOfKind: "section-header-element-kind",
            withReuseIdentifier: SectionHeadlineReusableView.reuseIdentifier
        )

        collectionView.register(
            UINib(nibName: GlobalHeaderCollectionReusableView.reuseIdentifier, bundle: nil),
            forSupplementaryViewOfKind: "layout-header-element-kind",
            withReuseIdentifier: GlobalHeaderCollectionReusableView.reuseIdentifier
        )

        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 34, right: 0)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if collectionView.contentInset.top == 0 {
            globalHeader?.isHidden = true
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        self.categories.count
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        globalHeader?.isHidden = !isTopMostCellOutOfBounds()
    }

    private func isTopMostCellOutOfBounds() -> Bool {
        guard let searchCell = collectionView.visibleCells.first(where: { $0 is SearchCell }) as? SearchCell else {
            return true
        }

        return collectionView.contentOffset.y > searchCell.frame.size.height
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.categories[section].category.movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0, indexPath.row == 0 {
            guard
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.reuseIdentifier, for: indexPath) as? SearchCell
            else {
                fatalError("Failed to dequeue `SearchCell`")
            }

            return cell
        }

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

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        switch kind {
            case "layout-header-element-kind":
                return (collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: GlobalHeaderCollectionReusableView.reuseIdentifier,
                    for: indexPath
                ) as? GlobalHeaderCollectionReusableView)!
            case "section-header-element-kind":
                let sectionHeader = (collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: SectionHeadlineReusableView.reuseIdentifier,
                    for: indexPath
                ) as? SectionHeadlineReusableView)!

                sectionHeader.headline = self.categories[indexPath.section].category.headline

                return sectionHeader
            default:
                return UICollectionReusableView()
        }
    }
}
