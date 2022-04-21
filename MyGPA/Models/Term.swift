//
//  Term.swift
//  MyGPA
//
//  Created by Sae Pasomba on 18/04/22.
//

import Foundation

class Term: Identifiable {
    var id: Int? {
        return term
    }
    var term: Int? = nil
    
    init(term: Int) {
        self.term = term
    }
}
