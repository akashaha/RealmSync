//
//  ItemDetailsView.swift
//  TestProject_AppV2
//
//  Created by Arman Akash on 9/18/24.
//

import SwiftUI
import RealmSwift

struct ItemDetailsView: View {
    // Observe the Realm object 'Item', which represents individual items in the group (stored locally or synced).
    @ObservedRealmObject var item: Item
    var body: some View {
        ScrollView {
            // Display UI elements to edit the item's name.
            Text("Edit name")
                .font(.caption)
                .foregroundStyle(Color.gray)

            // Bind the text field to the 'item.name' property, which is persisted in Realm (stores data).
            TextField("New name", text: $item.name)
        }
        .padding()
        // The navigation title is bound to the item's name, dynamically updating.
        .navigationTitle($item.name)
    }
}
