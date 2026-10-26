import Foundation
import Ignite

struct SiteFooter: HTML {
	var body: some HTML {
		Tag("footer") {
			Tag("div") {
				Tag("span") { "EmbryoDoc · Электронный документооборот для центров ВРТ" }

				Tag("nav") {
					Tag("a") { "Контакты" }
						.attribute("href", "#contact")
					Tag("a") { Contact.email }
						.attribute("href", "mailto:\(Contact.email)")
				}
				.aria(.label, "Контакты")
			}
			.class("wrap")
		}
		.class("site-footer")
		.data("theme", "dark")
	}
}

enum Contact {
	static let email = "egor@ledkov.org"
}
