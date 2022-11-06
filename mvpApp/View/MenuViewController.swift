//
//  MenuViewController.swift
//  mvpApp
//
//  Created by Damirka on 06.11.2022.
//

import UIKit

class MenuViewController: UIViewController {
    let tableView = UITableView()
    var menuPresenter : MenuPresenter?
    
    override func  loadView() {
        let view = UIView()
        self.view = view
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        blueView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(blueView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        
        let exampleButton = UIButton()
        exampleButton.setTitle("test", for: .normal)
        exampleButton.translatesAutoresizingMaskIntoConstraints = false
        exampleButton.addTarget(menuPresenter, action: #selector(menuPresenter?.buttonPressed), for: .touchUpOutside)
        self.view.addSubview(exampleButton)
        
        NSLayoutConstraint.activate([
            
            blueView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            blueView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            blueView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            blueView.heightAnchor.constraint(equalToConstant: 50),
            
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            exampleButton.centerXAnchor.constraint(equalTo: blueView.centerXAnchor),
            exampleButton.centerYAnchor.constraint(equalTo: blueView.centerYAnchor),
            exampleButton.heightAnchor.constraint(equalTo: blueView.heightAnchor),
            exampleButton.widthAnchor.constraint(equalTo: blueView.widthAnchor),
        
        ])
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        menuPresenter?.showDetail(data: menuPresenter?.data[indexPath.row] ?? "")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuPresenter?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuPresenter?.data[indexPath.row]
        return cell
    }
}

extension MenuViewController {
    func set(presenter: MenuPresenter) {
        self.menuPresenter = presenter
    }
}
