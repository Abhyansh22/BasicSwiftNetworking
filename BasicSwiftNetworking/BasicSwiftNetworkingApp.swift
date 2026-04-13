//
//  BasicSwiftNetworkingApp.swift
//  BasicSwiftNetworking
//
//  Created by GU on 09/04/26.
//

import SwiftUI

@main
struct BasicSwiftNetworkingApp: App {
    var photoInfoViewModel = PhotoIbfoViewModel()
    var body: some Scene {
        WindowGroup {
            RestaurantTabView()
//                .environment(photoInfoViewModel)
        }
    }
}
