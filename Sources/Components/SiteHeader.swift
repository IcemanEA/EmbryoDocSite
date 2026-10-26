import Foundation
import Ignite

struct SiteHeader: HTML {
	private let links = [
		("Эмбриологам", "#embryologists"),
		("Репродуктологам", "#doctors"),
		("Администраторам", "#administrators"),
		("Пациентам", "#patients"),
	]

	var body: some HTML {
		Tag("header") {
			Tag("div") {
				Tag("a") {
					Include("embryodoc-logo.svg")
				}
				.class("logo")
				.attribute("href", "/")
				.aria(.label, "EmbryoDoc, на главную")

				Tag("nav") {
					ForEach(links) { link in
						Tag("a") { link.0 }
							.class("nav-link")
							.attribute("href", link.1)
					}

					Tag("button") {
						#"<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" aria-hidden="true"><path d="M21 12.8A9 9 0 1 1 11.2 3a7 7 0 0 0 9.8 9.8z"/></svg>"#
					}
					.class("theme-toggle")
					.id("theme-toggle")
					.attribute("type", "button")
					.aria(.label, "Сменить тему")

					Tag("a") { "Запросить демо" }
						.class("btn sm")
						.attribute("href", "#contact")
				}
				.class("nav")
				.aria(.label, "Разделы")
			}
			.class("wrap")
		}
		.class("site-header")
	}
}
