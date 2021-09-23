//
//  ActiveState.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 22.09.2021.
//

import Foundation

public enum ActiveState: Equatable {
    case none
    case loading
    case success
    case failure(String)
    case alert(String)

    public static func from(_ error: Error) -> ActiveState {
        .failure(error.localizedDescription)
    }
}
