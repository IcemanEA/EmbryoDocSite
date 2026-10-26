import Foundation
import Ignite

/// The hero card: one culture record as the app shows it.
struct CultureRecord: HTML {
	private let days = ["Д0", "Д1", "Д2", "Д3", "Д4", "Д5", "Д6"]
	private let currentDay = 3

	var body: some HTML {
		Tag("div") {
			Tag("div") {
				Tag("span") { "Культивирование · цикл 2026-0412" }
					.class("overline")
				Tag("b") { "Эмбрион 2" }
			}
			.class("record-head")

			Tag("div") {
				Image("/images/4_2_morula.jpeg", description: "Эмбрион человека на третьи сутки, стадия дробления, снимок в микроскоп")
				Tag("span") { "Д3 · 68 ч" }
			}
			.class("record-photo")

			Tag("span") { "День 3 · дробление" }
				.class("record-title")

			Tag("div") {
				Tag("span") { "Класс A" }
					.class("tag")
				Tag("span") { "Фрагментация &lt; 10 %" }
					.class("tag neutral")
				Tag("span") { "Инкубатор 2" }
					.class("tag neutral")
			}
			.class("tags")

			Tag("div") {
				ForEach(days.enumerated()) { index, day in
					Tag("span") { day }
						.class(index < currentDay ? "done" : index == currentDay ? "now" : nil)
				}
			}
			.class("days")
			.aria(.label, "Дни культивирования")
		}
		.class("record")
		.aria(.label, "Пример карточки культивирования")
	}
}

/// The patient app screen. It stays light in both themes, like the real app.
struct PatientPhone: HTML {
	var body: some HTML {
		Tag("div") {
			Tag("div") {
				Tag("div") {
					Tag("span") { "Цикл ЭКО · октябрь" }
						.class("overline")
					Tag("div") { "Ваши эмбрионы" }
						.class("phone-title")
				}

				Tag("div") {
					Image("/images/4_3_blastocista.jpeg", description: "Снимок бластоцисты в приложении")
					Tag("div") {
						Tag("b") { "Эмбрион 1 · День 5" }
						Tag("span") { "Бластоциста" }
							.class("tag")
					}
					.class("p-row")
					Tag("span") { "Обновлено сегодня в 10:20" }
						.class("p-muted")
				}
				.class("p-card")

				Tag("div") {
					Tag("b") { "Комментарий эмбриолога" }
					"Развитие идёт по плану. Перенос назначен на завтра, 11:00."
				}
				.class("p-note")

				Tag("div") {
					Tag("b") { "Перенос эмбриона" }
					Tag("span") { "Завтра · 11:00" }
						.class("p-muted")
				}
				.class("p-card p-row")
			}
			.class("phone-screen")
		}
		.class("phone")
		.aria(.label, "Пример экрана приложения для пациента")
	}
}
