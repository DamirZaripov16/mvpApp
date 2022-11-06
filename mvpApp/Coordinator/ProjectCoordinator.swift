//
//  ProjectCoordinator.swift
//  mvpApp
//
//  Created by Damirka on 06.11.2022.
//

import UIKit

class ProjectCoordinator: AbstractCoordinator, RootCoordinator {
    private(set) var childCoordinators: [AbstractCoordinator] = []
    weak var navigationController: UINavigationController?
    private var factory: Factory
    
    init(factory: Factory) {
        self.factory = factory
    }
    
    func addChildCoordinator(_ coordinator: AbstractCoordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeAllChildCoordinatorsWith<Element>(type: Element.Type) {
        childCoordinators = childCoordinators.filter { $0 is Element == false }
    }
    
    func revomeAllChildCoordinators() {
        childCoordinators.removeAll()
    }
    
    func start(_ navigationController: UINavigationController) {
        let vc = factory.makeInitialViewController(coordinator: self)
        self.navigationController = navigationController
        navigationController.pushViewController(vc, animated: true)
    }
    
    func moveToDetail(withData data: String) {
        let vc = factory.makeDetailViewController(coordinator: self, data: data)
        navigationController?.pushViewController(vc, animated: true)
    }
}
