//
//  DetailPresenter.swift
//  mvpApp
//
//  Created by Damirka on 06.11.2022.
//

import Foundation

protocol DetailPresenterProtocol { }

class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewController?
    
    init(view: DetailViewController) {
        self.view = view
    }
}
