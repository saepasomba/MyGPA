//
//  TermDetailView.swift
//  MyGPA
//
//  Created by Sae Pasomba on 20/04/22.
//

import SwiftUI

struct TermDetailView: View {
    
    @State var addModalIsShown: Bool = false
    
    var body: some View {
        VStack {
            NavigationView {
                ZStack {
                    Color("Background")
                        .ignoresSafeArea()
                    List {
                        ClassCell()
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                        ClassCell()
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                        ClassCell()
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                        ClassCell()
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                        ClassCell()
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                        ClassCell()
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                        ClassCell()
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }
                    .listStyle(.plain)
                    .safeAreaInset(edge: .top) {
                        TermCell()
                            .background(
                                .ultraThinMaterial, in: RoundedRectangle(cornerRadius: 25)
                            )
                            .padding()
                        
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
            AddModalView()
        }
    }
}

struct TermDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TermDetailView()
    }
}
