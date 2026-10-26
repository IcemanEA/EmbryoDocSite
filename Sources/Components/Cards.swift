import Foundation
import Ignite

/// A link card for one audience in the strip under the hero.
struct RoleCard: HTML {
	var number: String
	var title: String
	var text: String
	var target: String

	var body: some HTML {
		Tag("a") {
			Tag("span") { number }
				.class("num")
			Tag("span") { title }
				.class("card-title")
			Tag("span") { text }
				.class("card-body")
			Tag("span") { "Подробнее →" }
				.class("arrow")
		}
		.class("card")
		.attribute("href", target)
	}
}

/// A card with an optional photo or overline, a title and a plain list.
struct FeatureCard: HTML {
	var overline: String? = nil
	var image: (path: String, description: String)? = nil
	var title: String
	var items: [String]

	var body: some HTML {
		Tag("div") {
			if let image {
				Tag("div") {
					Image(image.path, description: image.description)
				}
				.class("media r21x9")
			}

			if let overline {
				Tag("span") { overline }
					.class("overline")
			}

			Tag("span") { title }
				.class("card-title")

			BulletList(items: items)
		}
		.class("card")
	}
}

struct BulletList: HTML {
	var items: [String]

	var body: some HTML {
		Tag("ul") {
			ForEach(items) { item in
				Tag("li") { item }
			}
		}
		.class("list")
	}
}

/// One row of a feature list: a short title on the left, text on the right.
struct FeatureRow: HTML {
	var title: String
	var text: String

	var body: some HTML {
		Tag("div") {
			Tag("h3") { title }
			Tag("p") { text }
		}
		.class("row")
	}
}

struct Benefit: HTML {
	var title: String
	var text: String

	var body: some HTML {
		Tag("div") {
			Tag("h3") { title }
			Tag("p") { text }
		}
		.class("benefit")
	}
}

/// A photo in a rounded frame with a fixed aspect ratio class (r4x3, r16x11, r3x1).
struct Photo: HTML {
	var path: String
	var description: String
	var ratio: String

	var body: some HTML {
		Tag("figure") {
			Image(path, description: description)
		}
		.class("media", ratio)
	}
}
