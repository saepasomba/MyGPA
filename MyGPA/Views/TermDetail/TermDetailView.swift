//
//  TermDetailView.swift
//  MyGPA
//
//  Created by Sae Pasomba on 20/04/22.
//

import SwiftUI

struct TermDetailView: View {
    
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
                            
                    }
                    .listStyle(.plain)
                    .safeAreaInset(edge: .top) {
                        TermCell()
                            .background {
                                Color.black
                                    .blur(radius: 2)
                                    .ignoresSafeArea()
                                    .cornerRadius(25)
                                    .opacity(0.9)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.yellow)
                                    )
                            }
                            .padding()

                        //                            .ignoresSafeArea()
                        //                            .padding(.top, 1)
                        
                    }
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                }
                .navigationTitle("Term Details")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(false)
            }
        }
    }
}

struct TermDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TermDetailView()
    }
}
