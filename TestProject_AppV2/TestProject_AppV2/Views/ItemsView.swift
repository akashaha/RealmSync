//
//  ItemsView.swift
//  TestProject_AppV2
//
//  Created by Arman Akash on 9/18/24.
//
/*
import SwiftUI
import RealmSwift
struct ItemsView: View {
    @ObservedRealmObject var group: Group
    var body: some View {
        VStack {
            if group.items.count == 0 {
                Text("Tap ***** to add new Items")
                    .font(.caption)
                    .foregroundStyle(Color.gray)
            }
            else {
                List {
                    ForEach(group.items) { item in
                        cell(item: item)
                    }
                    .onDelete(perform: $group.items.remove)
                    .onMove(perform: $group.items.move)
                }
            }
        }.navigationTitle("Items")
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    HStack {
                        addButton()
                        
                        EditButton()
                        
                        //                   LogoutButton()
                    }
                }
            }
    }
    
    func addButton() -> some View {
        Button(action: {
            $group.items.append(Item())
        }, label: {
            Image(systemName: "plus")
        })
    }

}

extension ItemsView {
    func cell(item: Item) -> some View {
        NavigationLink {
            ItemDetailsView(item: item)
        } label: {
            Text(item.name)
        }
    }
}
*/
import SwiftUI
import RealmSwift

struct ItemsView: View {
    // Observing a Realm object of type 'Group' (contains a list of items, data stored in Realm).
    @ObservedRealmObject var group: Group
    @State private var newItemName: String = "" // State variable for the new item's name (temporary data).
    @State private var showAddItemAlert: Bool = false // State for controlling the display of the add-item alert.

    var body: some View {
        VStack {
            // Show message if there are no items in the group.
            if group.items.count == 0 {
                Text("Tap + to add new Items")
                    .font(.caption)
                    .foregroundStyle(Color.gray)
            } else {
                // Show the list of items from the group (each item stored in Realm).
                List {
                    ForEach(group.items) { item in
                        // Call a function to display each item.
                        cell(item: item)
                    }
                    // Provide options to delete or move items (these operations modify the stored data).
                    .onDelete(perform: $group.items.remove)
                    .onMove(perform: $group.items.move)
                }
            }
        }
        .navigationTitle("Items")
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                HStack {
                    // Add new item button, which triggers an alert.
                    addButton()
                    // Edit button for reordering the list.
                    EditButton()
                }
            }
        }
        .alert("Add New Item", isPresented: $showAddItemAlert, actions: {
            // Alert with a text field to enter a new item's name.
            TextField("Enter item name", text: $newItemName)
            // Add item to the group when 'Add' is pressed (saves data to Realm).
            Button("Add", action: addNewItem)
            // Cancel button (no action).
            Button("Cancel", role: .cancel, action: {})
        })
    }

    // Function to add a new item to the group.
    func addButton() -> some View {
        Button(action: {
            showAddItemAlert = true // Show the alert when the button is pressed.
        }, label: {
            Image(systemName: "plus") // Plus icon for the add button.
        })
    }

    func addNewItem() {
        // Create a new item and set its name.
        let newItem = Item()
        newItem.name = newItemName // Assign the new name to the item.
        $group.items.append(newItem) // Add the item to the group's item list (data is stored here).
        newItemName = "" // Reset the input field.
    }
}

extension ItemsView {
    // Function to create a cell for each item in the list.
    func cell(item: Item) -> some View {
        // Navigation link to open the ItemDetailsView when an item is tapped.
        NavigationLink {
            ItemDetailsView(item: item) // Pass the item to the detail view.
        } label: {
            Text(item.name) // Display the item's name in the list.
        }
    }
}

