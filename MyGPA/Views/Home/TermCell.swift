//
//  TermCell.swift
//  MyGPA
//
//  Created by Sae Pasomba on 18/04/22.
//

import SwiftUI

struct TermCell: View {
    var term: Term?
    
    var body: some View {
        VStack {
            Text("Semester \(term?.term ?? 1)")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.top)
            
            HStack {
                VStack {
                    Text("Total Credits")
                    Text("\(term?.totalCredit ?? 0)")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                VStack {
                    Text("GPA")
                    Text("\(term?.gpa ?? 0.0)")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                VStack {
                    Text("Classes Taken")
                    Text("\(term?.classTaken ?? 0)")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding()
            
            
            
        }
        .foregroundColor(Color("YellowLabel"))
        //        .background(Color.clear)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color("YellowLabel"))
        )
    }
}

struct SemesterCell_Previews: PreviewProvider {
    static var previews: some View {
        TermCell()
        TermCell().previewLayout(.sizeThatFits)
    }
}
