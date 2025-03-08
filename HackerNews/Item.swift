//
//  Item.swift
//  HackerNews
//
//  Created by Matteo Manferdini on 15/10/2020.
//

import Foundation

struct Item: Identifiable {
	let id: Int
	let commentCount: Int
	let score: Int
	let author: String
	let title: String
	let date: Date
	let url: URL
}

extension Item: Decodable {
	enum CodingKeys: String, CodingKey {
		case id, score, title, url
		case commentCount = "descendants"
		case date = "time"
		case author = "by"
	}
}
