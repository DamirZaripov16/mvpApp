//
//  DependencyFactory.swift
//  mvpApp
//
//  Created by Damirka on 06.11.2022.
//

import Foundation

protocol Factory {
    
    func makeInitialViewController(coordinator: ProjectCoordinator) -> MenuViewController
    func makeDetailViewController(coordinator: ProjectCoordinator, data: String) -> DetailViewController
    
}

class Dependency: Factory {
    func makeDetailViewController(coordinator: ProjectCoordinator, data: String) -> DetailViewController {
        let viewController = DetailViewController(data: data)
        let presenter = DetailPresenter(view: viewController)
        viewController.set(presenter: presenter)
        return viewController
    }
    
    func makeInitialViewController(coordinator: ProjectCoordinator) -> MenuViewController {
        let viewController = MenuViewController()
        let presenter = MenuPresenter(coordinator: coordinator, view: viewController)
        viewController.set(presenter: presenter)
        return viewController
    }
    
    struct Dependencies {
        
    }
    
    var dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        
    }
    
    func makeInitialCoordinator() -> ProjectCoordinator {
        let coordinator = ProjectCoordinator(factory: self)
        return coordinator
    }
}
