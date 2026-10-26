import Foundation
import Ignite

struct MainLayout: Layout {
	var body: some Document {
		Head {
			MetaLink(href: "https://fonts.googleapis.com", rel: "preconnect")
			MetaLink(href: "https://fonts.googleapis.com/css2?family=Commissioner:wght@400;500;600&display=swap", rel: .stylesheet)
			MetaLink(href: "/css/embryodoc.css", rel: .stylesheet)
			// Loaded in <head> so the saved theme applies before the first paint.
			Script(file: "/js/embryodoc.js")
		}

		Body {
			SiteHeader()
			Tag("main") {
				content
			}
			.id("top")
			SiteFooter()
		}
		.ignorePageGutters()
	}
}
