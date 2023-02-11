//
//  ContentView.swift
//  Cutom Binding
//
//  Created by Tausif Qureshi on 2023-01-24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    @State private var agreeToTerms = false
    @State private var agreeToPrivacyPolicy = false
    @State private var agreeToEmails = false
    
    
    var body: some View {
        let binding = Binding(
            get: {selection},
            set: {selection = $0}
        )
        // Usage of custom bindings will be rare but is important to know that it's no magic done by Swift UI but behind the scenes this is what happens.
        
        let agreeToAll = Binding<Bool>(
            get: {
                agreeToTerms && agreeToPrivacyPolicy && agreeToEmails
            } ,
            set: {
                agreeToTerms = $0
                agreeToPrivacyPolicy = $0
                agreeToEmails = $0
            }
        )
        
        return VStack {
            Picker("Select a number", selection: binding) {
                ForEach(0..<3) {
                    Text("Item \($0)")
                }
            }
            .pickerStyle(.segmented)
            
            VStack(spacing: 20) {
                Toggle("Agree to terms", isOn: $agreeToTerms)
                Toggle("Agree to privacy policy", isOn: $agreeToPrivacyPolicy)
                Toggle("Agree to Emails", isOn: $agreeToEmails)
                Toggle("Agree to all", isOn: agreeToAll)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
