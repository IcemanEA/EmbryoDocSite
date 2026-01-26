import Foundation
import Ignite

struct Home: StaticPage {
	var title = "Главная"
	
	var body: some HTML {
		Text("Приложение для эмбриологов и репродуктологов")
			.font(.title1)
	}
}
