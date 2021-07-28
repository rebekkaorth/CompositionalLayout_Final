//
//  CompositionalLayout.swift
//  CompositionalLayout_Final
//
//  Created by Rebekka Orth on 22.07.21.
//

import UIKit

enum CompositionalLayout {
    static func createCompositionalLayout(models: [ViewController.Section]) -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            switch models[sectionIndex].type {
                case .fromYourList:
                    return makeNestedGroupSection(forCategory: models[sectionIndex].category)
                default:
                    return makeCarouselSection(forCategory: models[sectionIndex].category)
            }
        }
    }

    // PRACTICE SECTION (Can you answer the helping questions?)
    //
    // 1. Create a simple section with horizontally scrolled items
    //      -> What happens if you change the scrolling direction of the group?
    //      -> What happens if a group contains more than one item?
    //
    // 2. Adjust the item size to be the one defined in `CategoryViewModel`
    //      -> Where do you need to put the `width`- and `height`-value?
    //
    // 3. Add some insets to adjust the layout further
    //      3.1 Add some content inset to the section
    //      3.2 Add some content inset to the group
    //          -> If you just want to adjust the spacing (leading/ trailing), how else could you achieve this?
    //
    // 4. Add a section header at the top of each section
    //
    // 5. Add a section with two rows in `makeNestedGroupSection`
    //      -> How can you achieve this with groups/ items?
    //
    // 6. Add some scrolling behaviour to the horizontally scrolled items


    private static func makeCarouselSection(forCategory category: CategoryViewModel) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(category.width),
            heightDimension: .absolute(category.height)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 1
        )

        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(20)
        )

        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: "header",
            alignment: .top
        )

        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 8, bottom: 20, trailing: 8)
        section.interGroupSpacing = 10

        return section
    }

    private static func makeNestedGroupSection(forCategory category: CategoryViewModel) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 2
        )

        group.interItemSpacing = .fixed(10)

        let nestedGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(category.width),
                heightDimension: .absolute(category.height * 2)
            ),
            subitem: group,
            count: 1
        )

        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(20)
        )

        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: "header",
            alignment: .top
        )

        let section = NSCollectionLayoutSection(group: nestedGroup)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
        section.interGroupSpacing = 10

        return section
    }
}
