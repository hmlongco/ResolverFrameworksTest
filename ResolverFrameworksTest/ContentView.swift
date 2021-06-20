//
//  ContentView.swift
//  ResolverFrameworksTest
//
//  Created by Michael Long on 6/19/21.
//

import SwiftUI
import ResolverFramework
import PresentationFramework

struct ContentView: View {
    @InjectedObject var viewModel: PresentationViewModel
    var body: some View {
        List {
            PresentationView()
            Text(viewModel.myText)
        }
        .font(.caption)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
