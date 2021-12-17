//
//  UIViewPreview.swift
//  MiniSuperApp
//
//  Created by Mephrine on 2021/12/17.
//

#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
public struct UIViewPreview<View: UIView>: UIViewRepresentable {
		let view: View

		public init(_ builder: @escaping () -> View) {
				view = builder()
		}

		public func makeUIView(context: Context) -> UIView {
				view
		}

		public func updateUIView(_ view: UIView, context: Context) {
				view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
				view.setContentHuggingPriority(.defaultHigh, for: .vertical)
		}
}
#endif
