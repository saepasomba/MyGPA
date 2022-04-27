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
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                List(terms) { term in
                    ZStack {
                        TermCell(term: term)
                            .padding()
                            .transition(.slide)
                        NavigationLink {
                            TermDetailView(selectedTerm: term)
                        } label: {
                            EmptyView()
                        }
                        .opacity(0)
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
                .safeAreaInset(edge: .top) {
                    SummaryTable()
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
    }
    
    private func addItem() {
        withAnimation {
            let newTerm = Term(context: viewContext)
            if terms.isEmpty {
                newTerm.term = 1
            } else {
                newTerm.term = Int64(terms.endIndex + 1)
            }
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
            }
        }
    }
    
    private func updateSummary() {
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .previewDevice("iPhone 11")
        }
    }
}
