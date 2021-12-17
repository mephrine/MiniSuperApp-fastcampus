//
//  SuperPayDashboardInteractor.swift
//  MiniSuperApp
//
//  Created by Mephrine on 2021/12/17.
//

import Combine
import ModernRIBs

protocol SuperPayDashboardRouting: ViewableRouting {
	// TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol SuperPayDashboardPresentable: Presentable {
	var listener: SuperPayDashboardPresentableListener? { get set }
	
	func updateBalance(to balance: String)
}

protocol SuperPayDashboardListener: AnyObject {
	// TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

protocol SuperPayDashboardInteractorDependency {
	var balance: ReadOnlyCurrentValuePublisher<Double> { get }
}

final class SuperPayDashboardInteractor: PresentableInteractor<SuperPayDashboardPresentable>, SuperPayDashboardInteractable, SuperPayDashboardPresentableListener {
	
	weak var router: SuperPayDashboardRouting?
	weak var listener: SuperPayDashboardListener?
	
	private let dependency: SuperPayDashboardInteractorDependency
	private var cancellables: Set<AnyCancellable>
	
	init(
		presenter: SuperPayDashboardPresentable,
		dependency: SuperPayDashboardInteractorDependency
	) {
		self.dependency = dependency
		self.cancellables = .init()
		super.init(presenter: presenter)
		presenter.listener = self
	}
	
	override func didBecomeActive() {
		super.didBecomeActive()
		
		dependency.balance.sink { [weak self] balance in
			self?.presenter.updateBalance(to: String(describing: balance))
		}.store(in: &cancellables)
	}
	
	override func willResignActive() {
		super.willResignActive()
		// TODO: Pause any business logic.
	}
}
