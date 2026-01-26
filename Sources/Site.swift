import Foundation
import Ignite

enum Config {
	enum Path {
		static let buildOutput = "/Users/ledkov/Documents/Work/Embryodoc/site"
	}
}

@main
struct IgniteWebsite {
	static func main() async {
		var site = EmbryoDocSite()

		do {
			let sourceDirectory = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
			let buildDirectory = URL(fileURLWithPath: Config.Path.buildOutput)
			try await site.publish(sourceDirectory: sourceDirectory, buildDirectory: buildDirectory)
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
