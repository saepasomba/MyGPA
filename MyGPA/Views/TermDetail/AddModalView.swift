//
//  AddModalView.swift
//  MyGPA
//
//  Created by Sae Pasomba on 23/04/22.
//

import SwiftUI

struct AddModalView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var selectedTerm: Term
    
    @Binding var isPresented: Bool
    
    @State var nameInput: String = ""
    @State var creditsInput: String = ""
    @State var gradeInput: String = ""
    var grades = ["A", "A-", "B+", "B", "B-", "C+", "C", "D", "E"]
    
    var body: some View {
        ZStack {
            Color("Background")
            NavigationView {
                Form {
                    Section {
                        HStack {
                            Text("Name")
                                .frame(width: 75, alignment: .leading)
                            TextField("Class name", text: $nameInput)
                        }
                        
                        HStack {
                            Text("Credits")
                                .frame(width: 75, alignment: .leading)
                            TextField("Credits of the class", text: $creditsInput)
                                .keyboardType(.numberPad)
                        }
                        Picker("Grade", selection: $gradeInput) {
                            ForEach(grades, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    
                    HStack {
                        Spacer()
                        Button {
                            addItem()
                            isPresented.toggle()
                        } label: {
                            Text("Add")
                        }
                        Spacer()
                    }
                    
                }
                .navigationTitle("Add class")
            }
        }
    }
    
    private func addItem() {
        if inputsAreValid() {
            withAnimation {
                let newClass = ClassTaken(context: viewContext)
                newClass.name = nameInput
                newClass.grade = gradeInput
                newClass.credits = Int64(creditsInput)!
                newClass.parentTerm = selectedTerm
                selectedTerm.classTaken += 1
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
                
            }
        }
    }
    
    private func inputsAreValid() -> Bool {
        let nameIsValid = (nameInput != "")
        let creditsIsValid = (creditsInput != "") && (Int(creditsInput) != nil)
        let gradeInputIsValid = (gradeInput != "")
        
        return (nameIsValid && creditsIsValid && gradeInputIsValid)
    }
    
}


//struct AddModalView_Previews: PreviewProvider {
//    let termDetailView = TermDetailView()
//    static var previews: some View {
//        AddModalView()
//    }
//}
