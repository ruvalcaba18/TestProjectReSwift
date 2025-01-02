//
//  DetailsView.swift
//  TestProjectReSwift
//
//  Created by Wizeline on 19/12/24.
//

import SwiftUI

struct DetailsView: View {
    @Binding var navigationState: RouteDestionation
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onDisappear {
                navigationState = .todos
            }
    }
}

#Preview {
    DetailsView(navigationState: .constant(.details))
}
