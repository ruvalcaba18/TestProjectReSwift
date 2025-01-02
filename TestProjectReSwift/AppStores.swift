//
//  TodoStore.swift
//  TestProjectReSwift
//
//  Created by Wizeline on 18/12/24.
//

import Foundation
import ReSwift

public let mainStore = Store( reducer: appReducer, state: AppState(), middleware: [createAPIClientMiddleware()] )
