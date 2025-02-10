//
//  ContentView.swift
//  LabAssignment1
//
//  Created by Anna on 9.02.25.
//

import SwiftUI

struct ContentView: View {
    @State private var number = 0
    @State private var correct = 0
    @State private var wrong = 0
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("\(wrong)")
            
            Button("Prime") {
                answer(isPrime: true)
            }
            Button("Not Prime") {
                answer(isPrime: false)
            }
        }
        .padding()
    }
    
    func answer(isPrime: Bool) {
        number += 1
        if isPrime == isPrimeNumber(n: number) {
            correct += 1
        } else {
            wrong += 1
        }
    }
    
    func isPrimeNumber(n: Int) -> Bool {
        return true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
