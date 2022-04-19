//
//  HomeView.swift
//  MyGPA
//
//  Created by Sae Pasomba on 18/04/22.
//

import SwiftUI

struct HomeView: View {
    
    var semesterList: [Semester] = [
        Semester(term: 1),
        Semester(term: 2),
        Semester(term: 3),
        Semester(term: 4),
        Semester(term: 5),
    ]
    
    var body: some View {
        VStack {
            NavigationView {
                ZStack {
                    Color("Background")
                        .ignoresSafeArea()
                    List(semesterList) { semester in
                        ZStack {
                            SemesterCell()
                            NavigationLink {
                                Text("Hello")
                            } label: {
                                EmptyView()
                            }
                            .opacity(0)
                        }
                        .listRowSeparator(.hidden)
                        .background(.clear)
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(.plain)
                    .safeAreaInset(edge: .top) {
                        SummaryTable()
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50.0)
                    }
                    .safeAreaInset(edge: .bottom) {
                        Button {
                            print("Button pressed")
                        } label: {
                            Text("Tambah Semester")
                                .foregroundColor(.white)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(Color.blue)
                                        .shadow(color: .black, radius: 5)
                                }
                        }

                    }
                    .navigationTitle("MyGPA")
                    .navigationBarHidden(true)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 11")
        HomeView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
