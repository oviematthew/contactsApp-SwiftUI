import SwiftUI

struct ContactRow: View {
    let contact: Contact
    
    var body: some View {
        
        //TODO: replace below with contact row
        //Text("Replace this with contact row")
        NavigationLink(destination: ContactDetail(contact: contact)){
            HStack {
                
                Text(contact.fullName)
                    .font(.headline)
                
                Spacer()
                
                if contact.isFavorite {
                    Image(systemName: "star.fill")
                        .font(.headline)
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}
        
        
 #Preview {
    ContactRow(contact: ContactStore.testStore.contacts[1])
}
        
