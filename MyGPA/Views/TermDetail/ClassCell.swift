//
//  ClassCell.swift
//  MyGPA
//
//  Created by Sae Pasomba on 21/04/22.
//

import SwiftUI

struct ClassCell: View {
    var classItem: ClassTaken?
    
    var body: some View {
        HStack {
            Group {
                Text("\(classItem?.name ?? "")")
                    .fontWeight(.bold)
                    .frame(maxWidth: 200, alignment: .center)
                Spacer()
                Text("\(classItem?.credits ?? 0) Credits")
                Spacer()
                Text("\(classItem?.grade ?? "Unknown")")
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
