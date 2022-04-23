//
//  HomeView.swift
//  MyGPA
//
//  Created by Sae Pasomba on 18/04/22.
//

import SwiftUI

struct HomeView: View {
    
    var termList: [Term] = [
        Term(term: 1),
        Term(term: 2),
        Term(term: 3),
        Term(term: 4),
        Term(term: 5),
    ]
    
    var body: some View {
            NavigationView {
                ZStack {
                    Color("Background")
                        .ignoresSafeArea()
                    List(termList) { term in
                        ZStack {
                            TermCell()
                                .padding()
                            NavigationLink {
                                TermDetailView()
//                                    .navigationBarHidden(false)
//                                    .navigationBarBackButtonHidden(true)
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
                        Button {
                            print("Button pressed")
                        } label: {
                            Text("Tambah Semester")
                        }
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 25))

                    }
//                    .navigationTitle("MyGPA")
                    .navigationBarHidden(true)
                }
            }
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
