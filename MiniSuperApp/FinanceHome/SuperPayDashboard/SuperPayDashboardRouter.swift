//
//  SuperPayDashboardRouter.swift
//  MiniSuperApp
//
//  Created by Mephrine on 2021/12/17.
//

import ModernRIBs

protocol SuperPayDashboardInteractable: Interactable {
    var router: SuperPayDashboardRouting? { get set }
    var listener: SuperPayDashboardListener? { get set }
}

protocol SuperPayDashboardViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class SuperPayDashboardRouter: ViewableRouter<SuperPayDashboardInteractable, SuperPayDashboardViewControllable>, SuperPayDashboardRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: SuperPayDashboardInteractable, viewController: SuperPayDashboardViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
