//
//  CategoryType.swift
//  CompositionalLayout_Final
//
//  Created by Rebekka Orth on 21.07.21.
//

import Foundation

enum CategoryType: CaseIterable {
    case hotAndWorthIt
    case continueWatching
    case fromYourList
    case whatYouMightLike

    var name: String {
        switch self {
            case .hotAndWorthIt: return "Hot & Worth it"
            case .continueWatching: return "Continue watching"
            case .fromYourList: return "From your list"
            case .whatYouMightLike: return "What you might like"
        }
    }
}
