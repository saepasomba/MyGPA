//
//  SummaryTable.swift
//  MyGPA
//
//  Created by Sae Pasomba on 18/04/22.
//

import SwiftUI

struct SummaryTable: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: ClassTaken.entity(), sortDescriptors: []) private var classList: FetchedResults<ClassTaken>
    
    @State var totalCredits: Int?
    @State var gpa: Double?
    
    var body: some View {
        HStack {
            VStack {
                Text("Total Credits")
                Text("\(totalCredits ?? 0)")
                    .font(.title)
                    .fontWeight(.heavy)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            VStack {
                Text("GPA")
                Text("\((gpa ?? 0.0), specifier: "%.2f")")
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
        .onAppear(perform: dataCalculate)
    }
    
    private func dataCalculate() {
        var totalCredits = 0
        var totalPoints = 0.0
        
        for classTaken in classList {
            totalCredits += Int(classTaken.credits)
            totalPoints += (Double(classTaken.credits) * gradeToPoint(classTaken.grade ?? "F"))
        }
        
        self.totalCredits = totalCredits
        self.gpa = totalPoints / Double(totalCredits)
    }
    
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

struct SummaryTable_Previews: PreviewProvider {
    static var previews: some View {
        SummaryTable()
    }
}
