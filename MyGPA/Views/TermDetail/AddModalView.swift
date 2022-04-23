//
//  AddModalView.swift
//  MyGPA
//
//  Created by Sae Pasomba on 23/04/22.
//

import SwiftUI

struct AddModalView: View {
//    @Binding var addModalIsShown: Bool
    
    @State var input1: String = ""
    @State var input2: String = ""
    @State var input3: String = ""
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
                            TextField("Class name", text: $input1)
                        }
                        
                        HStack {
                            Text("Credits")
                                .frame(width: 75, alignment: .leading)
                            TextField("Credits of the class", text: $input2)
                                .keyboardType(.numberPad)
                        }
                        Picker("Grade", selection: $input3) {
                            ForEach(grades, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    
                    Button {
                        print("\(input1) is added")
    //                    self.addModalIsShown.toggle()
                    } label: {
                        Text("Add")
                    }
                }
                .navigationTitle("Add class")
            }
        }
    }
}


struct AddModalView_Previews: PreviewProvider {
    let termDetailView = TermDetailView()
    static var previews: some View {
        AddModalView()
    }
}
