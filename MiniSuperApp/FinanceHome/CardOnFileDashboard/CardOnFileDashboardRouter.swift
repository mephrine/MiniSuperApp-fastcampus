//
//  CardOnFileDashboardRouter.swift
//  MiniSuperApp
//
//  Created by Mephrine on 2021/12/18.
//

import ModernRIBs

protocol CardOnFileDashboardInteractable: Interactable {
    var router: CardOnFileDashboardRouting? { get set }
    var listener: CardOnFileDashboardListener? { get set }
}

protocol CardOnFileDashboardViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class CardOnFileDashboardRouter: ViewableRouter<CardOnFileDashboardInteractable, CardOnFileDashboardViewControllable>, CardOnFileDashboardRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: CardOnFileDashboardInteractable, viewController: CardOnFileDashboardViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
