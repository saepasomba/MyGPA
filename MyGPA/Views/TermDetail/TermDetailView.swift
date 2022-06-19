//
//  TermDetailView.swift
//  MyGPA
//
//  Created by Sae Pasomba on 20/04/22.
//

import SwiftUI

struct TermDetailView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var addModalIsShown: Bool = false
    
    @ObservedObject var selectedTerm: Term
    @FetchRequest var classList: FetchedResults<ClassTaken>
    @Binding var homeViewIsHidden: Bool?
    
    init(selectedTerm: Term, homeViewIsHidden: Binding<Bool?>) {
        self._classList = FetchRequest<ClassTaken>(
            entity: ClassTaken.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \ClassTaken.name, ascending: true)],
            predicate: NSPredicate(format: "parentTerm.term == %@", NSNumber(value: selectedTerm.term))
        )
        self._homeViewIsHidden = homeViewIsHidden
        self.selectedTerm = selectedTerm
    }
    
    
    var body: some View {
        VStack {
            NavigationView {
                ZStack {
                    Color("Background")
                        .ignoresSafeArea()
                    List {
                        ForEach(classList, id:\.self) { classItem in
                            ClassCell(classItem: classItem)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.clear)
                        }
                        .onDelete(perform: removeClass)
                    }
                    .listStyle(.plain)
                    .safeAreaInset(edge: .top) {
                        TermCell(term: selectedTerm)
                            .background(
                                .ultraThinMaterial, in: RoundedRectangle(cornerRadius: 25)
                            )
                            .padding()
                            .offset(y: -25)
                        
                    }
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .safeAreaInset(edge: .bottom) {
                        Button {
                            addModalIsShown.toggle()
                        } label: {
                            Text("Add class")
                        }
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 25))
                    }
                    
                }
                .navigationTitle("Term Details")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(false)
            }
        }
        .onAppear(perform: {
            homeViewIsHidden?.toggle()
        })
        .onDisappear(perform: {
            homeViewIsHidden?.toggle()
        })
        .onChange(of: addModalIsShown, perform: { newValue in
            dataCalculate()
        })
        .sheet(isPresented: $addModalIsShown) {
            //            AddModalView(addModalIsShown: self.$addModalIsShown)
            AddModalView(selectedTerm: selectedTerm, isPresented: $addModalIsShown)
        }
    }
    private func removeClass(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                let classTarget = classList[index]
                viewContext.delete(classTarget)
            }
            self.selectedTerm.classTaken -= 1
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            dataCalculate()
        }
    }
    
    private func dataCalculate() {
        var totalCredits = 0
        var totalPoints = 0.0
        
        for classTaken in classList {
            totalCredits += Int(classTaken.credits)
            totalPoints += (Double(classTaken.credits) * gradeToPoint(classTaken.grade ?? "F"))
        }
        
        selectedTerm.totalCredit = Int64(totalCredits)
        let tempGPA = totalPoints / Double(totalCredits)
        selectedTerm.gpa = tempGPA.isNaN ? 0.0 : tempGPA
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

//struct TermDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TermDetailView()
//    }
//}
