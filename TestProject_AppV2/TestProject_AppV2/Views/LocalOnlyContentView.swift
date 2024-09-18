//
//  LocalOnlyContentView.swift
//  TestProject_AppV2
//
//  Created by Arman Akash on 9/18/24.
//


import SwiftUI
import RealmSwift

struct LocalOnlyContentView: View {
    // Observe all groups from Realm (stored locally).
    @ObservedResults(Group.self) var groups
    var body: some View {
        // Check if a group exists, and if so, display its items.
        if let group = groups.first {
            NavigationView {
                ItemsView(group: group) // Pass the group to the ItemsView.
            }
        }
        else {
            // Show a progress indicator while the group is being created.
            ProgressView()
                .onAppear {
                    // Create a new group and store it in Realm (data storage).
                    $groups.append(Group())
                }
        }
    }
}

#Preview {
    // Preview for local-only content.
    LocalOnlyContentView()
}

