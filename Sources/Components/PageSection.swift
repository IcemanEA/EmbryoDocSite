import Foundation
import Ignite

/// A numbered page section: "01 Title", a lead line, then the content.
struct PageSection<Content: HTML>: HTML {
	var id: String
	var number: String
	var title: String
	var lead: String
	var style: String? = nil
	@HTMLBuilder var content: Content

	var body: some HTML {
		Tag("section") {
			Tag("div") {
				SectionHeader(number: number, title: title, lead: lead)
				content
			}
			.class("wrap")
		}
		.class("section", style)
		.id(id)
	}
}

struct SectionHeader: HTML {
	var number: String
	var title: String
	var lead: String

	var body: some HTML {
		Tag("div") {
			Tag("span") { number }
				.class("num")
			Tag("h2") { title }
		}
		.class("section-head")

		Tag("p") { lead }
			.class("section-lead")
	}
}
