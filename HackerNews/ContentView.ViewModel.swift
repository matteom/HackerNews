//
//  NewsModel.swift
//  HackerNews
//
//  Created by Matteo Manferdini on 21/10/2020.
//

import Foundation

extension ContentView {
	@Observable @MainActor class ViewModel {
		var stories: [Item] = []

		func fetchTopStories() async throws {
			let url = URL(string: "https://hacker-news.firebaseio.com/v0/beststories.json")!
			let (data, _) = try await URLSession.shared.data(from: url)
			let ids = try JSONDecoder().decode([Int].self, from: data)
			stories = try await withThrowingTaskGroup(of: Item.self) { group in
				for id in ids.prefix(10) {
					group.addTask { try await self.fetchStory(withID: id) }
				}
				var stories: [Item] = []
				for try await item in group {
					stories.append(item)
				}
				return stories
			}
		}

		private func fetchStory(withID id: Int) async throws -> Item {
			let url = URL(string: "https://hacker-news.firebaseio.com/v0/item/\(id).json")!
			let (data, _) = try await URLSession.shared.data(from: url)
			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = .secondsSince1970
			return try decoder.decode(Item.self, from: data)
		}
	}
}
