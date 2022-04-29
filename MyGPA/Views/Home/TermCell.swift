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
            Text("Semester \(term.term)")
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
//        .onAppear(perform: updateTerm)
        .foregroundColor(Color("YellowLabel"))
        .multilineTextAlignment(.center)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color("YellowLabel"))
        )
    }
    
//    private func updateTerm() {
//        var totalPoints = 0.0
//        var classTaken = 0
//        var totalCredit = 0
//        
//        for classItem in classList {
//            classTaken += 1
//            totalCredit += Int(classItem.credits)
//            totalPoints += (Double(classItem.credits) * gradeToPoint(classItem.grade ?? "F"))
//        }
//        term?.totalCredit = Int64(totalCredit)
//        term?.classTaken = Int64(classTaken)
//        let tempGPA = totalPoints / Double(totalCredit)
//        print("TERM UPDATED! newGPA: \(tempGPA)")
//        term?.gpa = tempGPA.isNaN ? 0.0 : tempGPA
//        
//        do {
//            try viewContext.save()
//        } catch {
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//    }
    
    private func gradeToPoint(_ grade: String) -> Double {
        switch grade {
        case "A":
            return 4.0
        case "A-":
            return 3.7
        case "B+":
            return 3.3
        case "B":
            return 3.0
        case "B-":
            return 2.7
        case "C+":
            return 2.3
        case "C":
            return 2.0
        case "D":
            return 1.0
        case "F":
            return 0.0
        default:
            return 0.0
        }
    }
}

//struct SemesterCell_Previews: PreviewProvider {
//    static var previews: some View {
//        TermCell()
//        TermCell().previewLayout(.sizeThatFits)
//    }
//}
