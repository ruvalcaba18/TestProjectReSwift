//
//  TodoActionHandler.swift
//  TestProjectReSwift
//
//  Created by Wizeline on 20/12/24.
//

import Foundation
import ReSwift

protocol ActionHandler: Action {
    func handle(state: AppState) -> AppState
}
