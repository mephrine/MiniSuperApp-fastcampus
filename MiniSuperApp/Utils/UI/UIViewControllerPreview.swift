//
//  UIViewControllerPreview.swift
//  MiniSuperApp
//
//  Created by Mephrine on 2021/12/17.
//

#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
public struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
		public let viewController: ViewController

		public init(_ builder: @escaping () -> ViewController) {
				viewController = builder()
		}

		public func makeUIViewController(context: Context) -> ViewController {
				viewController
		}

		public func updateUIViewController(_ uiViewController: ViewController, context: Context) {
				viewController.view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
				viewController.view.setContentHuggingPriority(.defaultHigh, for: .vertical)
		}
}
#endif
