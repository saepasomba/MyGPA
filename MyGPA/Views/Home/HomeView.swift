//
//  HomeView.swift
//  MyGPA
//
//  Created by Sae Pasomba on 18/04/22.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Term.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Term.term, ascending: true)]) private var terms: FetchedResults<Term>
    
    @FetchRequest(entity: ClassTaken.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ClassTaken.name, ascending: true)]) private var classList: FetchedResults<ClassTaken>
    
    @State var totalCredits: Int?
    @State var gpa: Double?
    @State var homeViewIsHidden: Bool? = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                List {
                    ForEach(terms, id:\.self) { term in
                        ZStack {
                            TermCell(term: term)
                                .padding()
                                .transition(.slide)
                            NavigationLink {
                                TermDetailView(selectedTerm: term, homeViewIsHidden: $homeViewIsHidden)
                            } label: {
                                EmptyView()
                            }
                            .opacity(0)
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                    }
                }
                .listStyle(.plain)
                .safeAreaInset(edge: .top) {
                    SummaryTable(totalCredits: $totalCredits, gpa: $gpa)
                    //                    SummaryTable(totalCredits: <#T##Binding<Int?>#>, gpa: <#T##Binding<Double?>#>)
                        .shadow(radius: 10)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 50.0)
                }
                .safeAreaInset(edge: .bottom) {
                    
                    HStack {
                        Button {
                            popLastSemester()
                        } label: {
                            Text("Pop last semester")
                                .frame(maxWidth: 75)
                        }
                        .foregroundColor(.red)
                        .padding()
                        .padding(.horizontal)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 25))
                        
                        
                        Button {
                            addItem()
                        } label: {
                            Text("Tambah Semester")
                                .frame(maxWidth: 75)
                        }
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 25))
                    }
                    
                }
                //                    .toolbar {
                //                        ToolbarItem(placement: .status) {
                //                            EditButton()
                //                        }
                //
                //                    }
                //                    .navigationTitle("MyGPA")
                .navigationBarHidden(true)
            }
        }
        .onAppear {
            print(homeViewIsHidden)
            dataCalculate()
        }
        .onChange(of: homeViewIsHidden) { newValue in
            dataCalculate()
        }
    }
    
    private func addItem() {
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        withAnimation {
            let newTerm = Term(context: viewContext)
            if terms.isEmpty {
                newTerm.term = 1
            } else {
                newTerm.term = Int64(terms.endIndex + 1)
            }
            newTerm.gpa = 0
            print(newTerm.term)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func popLastSemester() {
        withAnimation {
            if let lastTerm = terms.last {
                viewContext.delete(lastTerm)
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
                dataCalculate()
            }
        }
    }
    
    private func dataCalculate() {
        withAnimation {
            var totalCredits = 0
            var totalPoints = 0.0
            
            for classTaken in classList {
                totalCredits += Int(classTaken.credits)
                totalPoints += (Double(classTaken.credits) * gradeToPoint(classTaken.grade ?? "F"))
            }
            
            self.totalCredits = totalCredits
            let tempGPA = totalPoints / Double(totalCredits)
            self.gpa = tempGPA.isNaN ? 0.0 : tempGPA
        }
        
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

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            HomeView()
//                .previewDevice("iPhone 11")
//        }
//    }
//}
