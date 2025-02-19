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
    @State private var result: String? = nil
    @State private var timer: Timer? = nil
    @State private var showSummary: Bool = false
    
    
    var body: some View {
        ZStack {
            Color.teal.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 25) {
                Text("Prime Number Game")
                    .font(.title)
                    .foregroundColor(Color.white)
                
                Text("\(number)")
                    .font(.title)
                    .foregroundColor(Color.purple)
                
                Button("Prime") {
                    answer(isPrime: true)
                }
                Button("Not Prime") {
                    answer(isPrime: false)
                }
                
                Text(result ?? "")
            }
        }
        .onAppear {
            startNewGame()
        }
        .alert(isPresented: $showSummary) {
            Alert(
                title: Text("Game Summary"),
                message: Text("Correct guesses: \(correct), incorrect: \(wrong)"),
                dismissButton: .default(
                    Text("Try Again"),
                    action: startNewGame
                )
            )
        }
        .padding()
    }
    
    
    func answer(isPrime: Bool) {
        if isPrime == isPrimeNumber(n: number) {
            correct += 1
            result = "Last number: ✅"
        } else {
            wrongResult()
        }
        getNewNumber()
    }
    
    func wrongResult() {
        wrong += 1
        result = "Last number: ❌"
        getNewNumber()
    }
    
    func getNewNumber() {
        number = Int.random(in: 1...100)
        if correct + wrong >= 10 {
            showSummary = true
            timer?.invalidate()
        } else {
            restartTimer()
        }
    }
    
    func isPrimeNumber(n: Int) -> Bool {
        if n < 2 {
            return false
        }
        for i in 2..<n where n % i == 0 {
            return false
        }
        return true
    }
    
    func restartTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { _ in
            wrongResult()
        })
    }
    
    func startNewGame() {
        result = ""
        correct = 0
        wrong = 0
        showSummary = false
        getNewNumber()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
