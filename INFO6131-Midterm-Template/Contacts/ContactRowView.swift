//
//  ContactRowView.swift
//  INFO6131-Midterm-Template
//
//  Created by Matthew Ovie Enamuotor on 29/02/2024.
//

import Foundation
import SwiftUI

struct ContactRowView: View {
    
    let leftLabel : String
    let rightLabel: String
    
    
    var body: some View {

        VStack {
            HStack {
                Text("\(leftLabel):")
                    .font(.subheadline)
                    .foregroundColor(.black)
                Spacer()
                
                //Right label foreground color is grey for each row e.g gray
                Text(rightLabel)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            //Adding bottom padding of 5 after each row and a divider e.g Divider()
            .padding(5)
            Divider()
        }
    }
}
