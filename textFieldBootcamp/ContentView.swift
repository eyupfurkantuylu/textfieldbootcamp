//
//  ContentView.swift
//  textFieldBootcamp
//
//  Created by Eyüp Tüylü on 4.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var textFieldText: String = ""
    @State var todoList: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Bir şeyler yaz...", text: $textFieldText)
                    .padding()
                    .background(.gray.opacity(0.3))
                    .cornerRadius(5)
                    .font(.headline)
                Button {
                    if textIsNotNull() {
                        saveTodo()
                    }
                    
                } label: {
                    Text("Save")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textIsNotNull() ? .blue : .gray )
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .font(.headline)
                }
                
                ForEach(todoList, id: \.self) { todo in
                    Text(todo)
                }

                
                
                Spacer()
            }
            .padding()
            .navigationTitle("Basic ToDo App")
        }
        
        
    }
    
    func textIsNotNull() -> Bool {
        if textFieldText.count >= 1 {
            return true
        }
        return false
    }
    
    func saveTodo(){
        todoList.append(textFieldText)
        textFieldText = ""
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
