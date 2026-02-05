import Foundation
import Ignite

struct MainLayout: Layout {
	var body: some Document {
		Body {
			// Navigation Bar
			Section {
				Section {
					Link("EmbryoDoc", target: "#home")
						.font(.title3)

					Section {
						Link("Эмбриологам", target: "#embryologists")
							.margin(.horizontal, 15)

						Link("Репродуктологам", target: "#doctors")
							.margin(.horizontal, 15)

						Link("Администраторам", target: "#administrators")
							.margin(.horizontal, 15)

						Link("Клиентам", target: "#clients")
							.margin(.horizontal, 15)

						Link("Контакты", target: "#contact")
							.margin(.horizontal, 15)
					}
				}
			}
			.padding(.vertical, 20)
			.padding(.horizontal, 40)

			content

			IgniteFooter()
		}
	}
}
