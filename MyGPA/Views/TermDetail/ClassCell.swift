//
//  ClassCell.swift
//  MyGPA
//
//  Created by Sae Pasomba on 21/04/22.
//

import SwiftUI

struct ClassCell: View {
    var body: some View {
        HStack {
            Group {
                Text("Dasar-Dasar Pemrograman 1")
                    .fontWeight(.bold)
                    .frame(maxWidth: 200, alignment: .center)
                Spacer()
                Text("4 Credits")
                Spacer()
                Text("A")
                    .padding(.trailing)
            }
        }
        .multilineTextAlignment(.center)
        .padding()
        .background(Color("YellowLabel"))
        .foregroundColor(Color("Background"))
        .cornerRadius(25)
    }
}

struct ClassCell_Previews: PreviewProvider {
    static var previews: some View {
        ClassCell()
    }
}
