//
//  PresentationView.swift
//  PresentationFramework
//
//  Created by Michael Long on 6/19/21.
//

import SwiftUI
import ResolverFramework

extension Resolver {
    public static func registerPresentationServices() {
        register { PresentationViewModel() }
            .scope(.shared)
    }
}

public protocol PresentationViewModelDelegate {
    func test()
}

public class PresentationViewModel: ObservableObject {
    @Injected public var delegate: PresentationViewModelDelegate
    @Published public var myText: String
    public init() {
        myText = "ID = \(UUID())"
        delegate.test()
    }
}

public struct PresentationView: View {
    @InjectedObject public var viewModel: PresentationViewModel
    public init() {}
    public var body: some View {
        Text(viewModel.myText)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.viewModel.myText = "ID = \(UUID())"
                }
            }
    }
}

struct PresentationView_Previews: PreviewProvider {
    static var previews: some View {
        PresentationView()
    }
}
