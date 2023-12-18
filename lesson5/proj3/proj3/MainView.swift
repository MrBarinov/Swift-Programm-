//
//  MainView.swift
//  proj3
//
//  Created by Nick on 16/12/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            NavigationLink("Перейти к новостям", destination: ContentView())
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
