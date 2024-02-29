import SwiftUI
import Observation

@Observable 
final class ContactsListViewModel: ObservableObject {
    //TODO: Add properties and methods below to complete ViewModel
    var store = ContactStore.testStore
    var navTitle: String = ""
    var searchTerm: String = ""
    var searchResults: [Contact] = []
    var contacts: [Contact] {
        store.contacts
    }
   
    // Computed Properties
    var listData: [Contact] {
        return searchTerm.isEmpty ? store.contacts : searchResults
    }
    
    var displayCount: String {
        "\(contacts.count) Contacts"
    }
    
    
    init(store: ContactStore = ContactStore.testStore, navTitle: String = "Contacts") {
        self.store = store
        self.navTitle = navTitle
    }
    
    func addRandomContact() {
        withAnimation{
            guard let randomContact = store.contacts.randomElement() else {
                return
            }
            
            store.contacts.append( randomContact )
        }
    }
    
    func filterSearchResults() {
        searchResults = store.contacts.filter({
            $0.fullName.localizedCaseInsensitiveContains(searchTerm)
        })
    }

    func resetContactList() {
       store.contacts = ContactStore.mockData

    }

    func editContactList() {
        if store.contacts.count >= 2 {
            
            let firstContact = store.contacts.removeFirst()
            store.contacts.append( firstContact )
            
        }
    }
    
    func deleteContact(offset: IndexSet) {
        store.contacts.remove(atOffsets: offset)
        }
    
    func moveContact(from: IndexSet, to: Int){
        store.contacts.move(fromOffsets: from, toOffset: to)
    }
}
