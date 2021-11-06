//
//  ViewController.swift
//  FriendriOSInterview
//
//  Created by Yesbol Kulanbekov on 11/7/21.
//

import UIKit

class ViewController: UIViewController {
	
	private let bananaFinder = BananaFinder()
	
	private let titleLabel = UILabel()
	private let countLabel = UILabel()
	private let ai = UIActivityIndicatorView(style: .large)

	override func viewDidLoad() {
		super.viewDidLoad()
		
		layout()
		configureSubViews()
		
		ai.startAnimating()
		bananaFinder.find { [weak self] (count) in
			self?.countLabel.text = "\(count)"
			self?.ai.stopAnimating()
		}
	}
	
	private func configureSubViews() {
		titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
		titleLabel.text = "Number of bananas in a wikipedia article"
		titleLabel.numberOfLines = 0
		titleLabel.textAlignment = .center
		
		countLabel.font = UIFont.preferredFont(forTextStyle: .title1)
		countLabel.textAlignment = .center
	}

	private func layout() {
		view.addSubview(titleLabel)
		view.addSubview(countLabel)
		
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		let titleConstraints = [
			titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
			titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
		]
		NSLayoutConstraint.activate(titleConstraints)
		
		countLabel.translatesAutoresizingMaskIntoConstraints = false
		let countLabelConstraints = [
			countLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
			countLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			countLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
		]
		NSLayoutConstraint.activate(countLabelConstraints)
		
		countLabel.addSubview(ai)
		ai.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			ai.topAnchor.constraint(equalTo: countLabel.topAnchor),
			ai.leadingAnchor.constraint(equalTo: countLabel.leadingAnchor),
			ai.trailingAnchor.constraint(equalTo: countLabel.trailingAnchor),
			ai.bottomAnchor.constraint(equalTo: countLabel.bottomAnchor)
		])
	}
}

