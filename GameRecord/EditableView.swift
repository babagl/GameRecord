//
//  EditableView.swift
//  GameRecord
//
//  Created by Abdoulaye Aliou SALL on 08/02/2023.
//

import SwiftUI

struct EditableView: View {
    let title :String
    @State private var isEditing = false
    @Binding var editedTexte :String
    var body: some View {
        HStack {
            if isEditing == true {
                TextField(title, text: $editedTexte)
                    .frame(width: 300.0)
                    .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            }else{
                Text(editedTexte)
                    .frame(width: 300.0)
            }
            Image(systemName: "pencil.circle")
                .onTapGesture {
                        isEditing.toggle()
                        print(isEditing)
                    
                }
        }
            
    }
}

struct EditableView_Previews: PreviewProvider {
    static var previews: some View {
        EditableView(title: "pseudo", editedTexte: .constant("sheldon"))
            
    }
}
