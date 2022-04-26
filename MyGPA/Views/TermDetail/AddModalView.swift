//
//  AddModalView.swift
//  MyGPA
//
//  Created by Sae Pasomba on 23/04/22.
//

import SwiftUI

struct AddModalView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    let selectedTerm: Term?
    
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
        withAnimation {
            let newClass = ClassTaken(context: viewContext)
            newClass.name = nameInput
            newClass.grade = gradeInput
            newClass.credits = Int64(creditsInput)!
            newClass.parentTerm = selectedTerm
            
            
//            print(newClass.term)
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
        }
    }
}


//struct AddModalView_Previews: PreviewProvider {
//    let termDetailView = TermDetailView()
//    static var previews: some View {
//        AddModalView()
//    }
//}
