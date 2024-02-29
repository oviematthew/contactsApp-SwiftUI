
import SwiftUI

struct ContactsListView: View {
    @StateObject var viewModel: ContactsListViewModel
    @State private var isEditing = false
    @State private var searchText = "" 
    
    var body: some View {
        NavigationStack {
                List {
                    ForEach(viewModel.listData) { contact in
                                ContactRow(contact: contact)
                            }
                    .onMove(perform: viewModel.moveContact)
                    .onDelete(perform: viewModel.deleteContact)
                    
                    
                    //Total count of contacts
                    HStack {
                        Spacer()
                        Text(viewModel.displayCount)
                            .font(.headline)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
                .navigationTitle(viewModel.navTitle)
                .searchable(text: $viewModel.searchTerm, placement:
                        .navigationBarDrawer(displayMode: .automatic), prompt: "Search For Contacts")
                .onChange(of: viewModel.searchTerm){
                    viewModel.filterSearchResults()
                }
            
            
                .toolbar {
                    HStack {
                        Button("Add") {
                            viewModel.addRandomContact()
                        }
                    }
                    Spacer()
                    EditButton()
                    
                    Spacer()
                        Button("Reset") {
                            viewModel.resetContactList()
                        }
                    }
                }
        
                //student details
                Text("INFO 6131 Midterm")
                .font(.title)
                Text("Matthew Ovie Enamuotor - 1146253")
                .font(.subheadline)
            }
       
        }
        
    
    

#Preview {
    ContactsListView(viewModel: ContactsListViewModel())
}


