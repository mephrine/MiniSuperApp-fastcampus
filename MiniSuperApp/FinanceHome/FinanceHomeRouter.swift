import ModernRIBs

protocol FinanceHomeInteractable: Interactable, SuperPayDashboardListener, CardOnFileDashboardListener {
  var router: FinanceHomeRouting? { get set }
  var listener: FinanceHomeListener? { get set }
}

protocol FinanceHomeViewControllable: ViewControllable {
	func addDashboard(view: ViewControllable)
}

final class FinanceHomeRouter: ViewableRouter<FinanceHomeInteractable, FinanceHomeViewControllable>, FinanceHomeRouting {
	private let superPayDashboardBuilder: SuperPayDashboardBuildable
	private var superPayRouting: Routing?
	
	private let cardOnFileDashboardBuilder: CardOnFileDashboardBuildable
	private var cardOnFileRouting: Routing?
	
	init(
		interactor: FinanceHomeInteractable,
		viewController: FinanceHomeViewControllable,
		superPayDashboardBuilder: SuperPayDashboardBuildable,
		cardOnFileDashboardBuilder: CardOnFileDashboardBuildable
	) {
		self.superPayDashboardBuilder = superPayDashboardBuilder
		self.cardOnFileDashboardBuilder = cardOnFileDashboardBuilder
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
	
	func attachSuperPayDashboard() {
		guard superPayRouting == nil else { return }
		let router = superPayDashboardBuilder.build(withListener: interactor)
		let dashboard = router.viewControllable
		viewController.addDashboard(view: dashboard)
		superPayRouting = router
		attachChild(router)
	}
	
	func attachCardOnFileDashboard() {
		guard cardOnFileRouting == nil else { return }
		let router = cardOnFileDashboardBuilder.build(withListener: interactor)
		let dashboard = router.viewControllable
		viewController.addDashboard(view: dashboard)
		cardOnFileRouting = router
		attachChild(router)
	}
}
