//
//  MenuPresenter.swift
//  mvpApp
//
//  Created by Damirka on 06.11.2022.
//

import Foundation

@objc protocol MenuPresenterProtocol {
    var data: [String] { get }
    func buttonPressed()
}

class MenuPresenter {
    let data = ["1", "2", "3", "4"]
    weak private var view: MenuViewController?
    private var coordinator: ProjectCoordinator?
    
    @objc func buttonPressed() {
        print("Button is pressed")
    }
    
    init(coordinator: ProjectCoordinator, view: MenuViewController) {
        self.coordinator = coordinator
        self.view = view
    }
    
    func showDetail(data: String) {
        coordinator?.moveToDetail(withData: data)
    }
}
