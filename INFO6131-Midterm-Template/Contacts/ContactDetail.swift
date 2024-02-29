import SwiftUI

struct ContactDetail: View {
    let contact: Contact
    
    var body: some View {
        //TODO: Complete detail view
        //Text("Contact detail view")
        VStack {
            
            //Contact Name
            HStack {
                
                Text( contact.fullName )
                    .font( .largeTitle )

                if contact.isFavorite {
                    Image( systemName: "star.fill" )
                        .font( .largeTitle )
                        .foregroundColor( .yellow )
                } else {
                    Image( systemName: "star" )
                        .font( .headline )
                        .foregroundColor( .gray )
                }
                }
            Divider()
        
        //Contact Details
        ContactRowView( leftLabel : "Phone", rightLabel : contact.phone )
        ContactRowView( leftLabel : "Email", rightLabel : contact.email )
        ContactRowView( leftLabel : "Address", rightLabel : contact.fullAddress )
            
            Spacer()
            }
            .padding()
        }
}

#Preview {
    ContactDetail(contact: ContactStore.testStore.contacts[0])
}
