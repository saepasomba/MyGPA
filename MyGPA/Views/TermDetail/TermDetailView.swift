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
    
    let selectedTerm: Term?
    @FetchRequest var classList: FetchedResults<ClassTaken>
    
    init(selectedTerm: Term) {       
        self._classList = FetchRequest<ClassTaken>(
            entity: ClassTaken.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \ClassTaken.name, ascending: true)],
            predicate: NSPredicate(format: "parentTerm.term == %@", NSNumber(value: selectedTerm.term))
        )
        
        self.selectedTerm = selectedTerm
    }
    
    
    var body: some View {
        VStack {
            NavigationView {
                ZStack {
                    Color("Background")
                        .ignoresSafeArea()
                    List(classList) { classItem in
                        ClassCell(classItem: classItem)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
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
        .sheet(isPresented: $addModalIsShown) {
            //            AddModalView(addModalIsShown: self.$addModalIsShown)
            AddModalView(selectedTerm: selectedTerm, isPresented: $addModalIsShown)
        }
    }
}

//struct TermDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TermDetailView()
//    }
//}
