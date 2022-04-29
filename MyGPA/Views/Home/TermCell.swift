//
//  TermCell.swift
//  MyGPA
//
//  Created by Sae Pasomba on 18/04/22.
//

import SwiftUI

struct TermCell: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var term: Term
//    @FetchRequest var classList: FetchedResults<ClassTaken>
    
//    init(term: Term) {
//        self._classList = FetchRequest<ClassTaken>(
//            entity: ClassTaken.entity(),
//            sortDescriptors: [NSSortDescriptor(keyPath: \ClassTaken.name, ascending: true)],
//            predicate: NSPredicate(format: "parentTerm.term == %@", NSNumber(value: term.term))
//        )
//
//        self.term = term
//    }
    
    var body: some View {
        VStack {
            Text("Term \(term.term)")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.top)
            
            HStack {
                VStack {
                    Text("Total Credits")
                    Text("\(term.totalCredit)")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                VStack {
                    Text("GPA")
                    Text("\((term.gpa), specifier: "%.2f")")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                VStack {
                    Text("Classes Taken")
                    Text("\(term.classTaken)")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding()
            
            
            
        }
        .foregroundColor(Color("YellowLabel"))
        .multilineTextAlignment(.center)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color("YellowLabel"))
        )
    }
}

//struct SemesterCell_Previews: PreviewProvider {
//    static var previews: some View {
//        TermCell()
//        TermCell().previewLayout(.sizeThatFits)
//    }
//}
