import Foundation
import Ignite

@main
struct IgniteWebsite {
	static func main() async {
		var site = EmbryoDocSite()

		do {
			try await site.publish(buildDirectoryPath: "docs")
			print("✅ Build completed: docs/")
			print("💡 Preview: ignite run --directory docs --preview")
		} catch {
			print(error.localizedDescription)
		}
	}
}

struct EmbryoDocSite: Site {
	var name = "EmbryoDoc App"
	var titleSuffix = " – Приложение для эмбриологов и репродуктологов"
	var url = URL(static: "https://embryodoc.app")
	var builtInIconsEnabled = true
	
	var author = "Egor Ledkov"
	
	var homePage = Home()
	var layout = MainLayout()
}
