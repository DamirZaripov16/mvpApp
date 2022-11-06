//
//  AbstractCoordinator.swift
//  mvpApp
//
//  Created by Damirka on 06.11.2022.
//

import Foundation

protocol AbstractCoordinator {
    
    func addChildCoordinator(_ coordinator: AbstractCoordinator)
    func removeAllChildCoordinatorsWith<Element>(type: Element.Type)
    func revomeAllChildCoordinators()
}
