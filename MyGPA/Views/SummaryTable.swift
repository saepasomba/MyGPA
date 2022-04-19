//
//  SummaryTable.swift
//  MyGPA
//
//  Created by Sae Pasomba on 18/04/22.
//

import SwiftUI

struct SummaryTable: View {
    var body: some View {
        HStack {
            VStack {
                Text("Total Credits")
                Text("96")
                    .font(.title)
                    .fontWeight(.heavy)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            VStack {
                Text("GPA")
                Text("3.6")
                    .font(.title)
                    .fontWeight(.heavy)
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding()
        .background(Color("YellowLabel"))
        .cornerRadius(25)
    }
    
}

struct SummaryTable_Previews: PreviewProvider {
    static var previews: some View {
        SummaryTable()
    }
}
