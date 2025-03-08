//
//  Item.swift
//  HackerNews
//
//  Created by Matteo Manferdini on 12/12/23.
//

import SwiftUI

struct Entry: View {
	let title: String
	let footnote: String
	let score: Int
	let commentCount: Int

	var body: some View {
		VStack(alignment: .leading, spacing: 8.0) {
			Text(title)
				.font(.headline)
			Text(footnote)
				.font(.footnote)
				.foregroundColor(.secondary)
			ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
				Label(score.formatted(), systemImage: "arrowtriangle.up.circle")
					.foregroundStyle(.blue)
				Label(commentCount.formatted(), systemImage: "ellipses.bubble")
					.foregroundStyle(.orange)
					.padding(.leading, 96.0)
			}
			.font(.footnote)
			.labelStyle(.titleAndIcon)
		}
	}
}

#Preview {
	Entry(
		title: "If buying isn't owning, piracy isn't stealing",
		footnote: "pluralistic.net - 3 days ago - by jay_kyburz",
		score: 1535,
		commentCount: 773
	)
}
