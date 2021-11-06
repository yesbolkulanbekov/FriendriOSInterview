//
//  BananaFinder.swift
//  FriendriOSInterview
//
//  Created by Yesbol Kulanbekov on 11/7/21.
//

import Foundation

struct BananaFinder {
	
	func find(_ onCompletion: @escaping (Int) -> Void) {
		search { (bananas) in
			DispatchQueue.main.async {
				onCompletion(bananas ?? 0)
			}
		}
	}
	
	private func search(_ onCompletion: @escaping (Int?) -> Void) {
		let request = URLRequest(url: URL(string: "https://en.wikipedia.org/wiki/Banana")!)
		let task = URLSession.shared.dataTask(with: request) { data, urlResponse, error in
			guard let data = data else {
				onCompletion(nil)
				return
			}
			
			guard let attributedString = try? NSAttributedString(
					data: data,
					options: [.documentType: NSAttributedString.DocumentType.html,
										.characterEncoding: String.Encoding.utf8.rawValue],
					documentAttributes: nil) else {
				onCompletion(nil)
				return
			}
			
			let htmlString = attributedString.string
			let bananas = htmlString.components(separatedBy: "banana")
			
			onCompletion(bananas.count - 1)
		}
		
		task.resume()
	}
	
}
