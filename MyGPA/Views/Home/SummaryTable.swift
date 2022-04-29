//
//  SummaryTable.swift
//  MyGPA
//
//  Created by Sae Pasomba on 18/04/22.
//

import SwiftUI

struct SummaryTable: View {    
    @Binding var totalCredits: Int?
    @Binding var gpa: Double?
    
    var body: some View {
        HStack {
            VStack {
                Text("Total Credits")
                Text("\(Int(totalCredits ?? 0))")
                    .font(.title)
                    .fontWeight(.heavy)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            VStack {
                Text("GPA")
                Text("\(Double(gpa ?? 0.0), specifier: "%.2f")")
                    .font(.title)
                    .fontWeight(.heavy)
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .multilineTextAlignment(.center)
        .padding()
        .background(Color("YellowLabel"))
        .foregroundColor(Color("Background"))
        .cornerRadius(25)
    }
}

//struct SummaryTable_Previews: PreviewProvider {
//    static var previews: some View {
//        SummaryTable()
//    }
//}
