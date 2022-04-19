//
//  SemesterCell.swift
//  MyGPA
//
//  Created by Sae Pasomba on 18/04/22.
//

import SwiftUI

struct SemesterCell: View {
    var body: some View {
        VStack {
            Text("Semester 1")
                .font(.title2)
                .fontWeight(.heavy)
                .padding(.top)
            HStack {
                VStack {
                    Text("Total Credits")
                    Text("24")
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
                VStack {
                    Text("Classes Taken")
                    Text("6")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding()
            
        }
        .foregroundColor(Color("YellowLabel"))
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color("YellowLabel"))
        )
        .padding()
    }
}

struct SemesterCell_Previews: PreviewProvider {
    static var previews: some View {
        SemesterCell()
        SemesterCell().previewLayout(.sizeThatFits)
    }
}
