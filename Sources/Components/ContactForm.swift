import Foundation
import Ignite

/// Demo request form. GitHub Pages has no backend, so Assets/js/embryodoc.js
/// turns the submit into a prefilled email to `Contact.email`.
struct ContactForm: HTML {
	var body: some HTML {
		Tag("form") {
			Field(id: "f-name", name: "name", label: "Имя", placeholder: "Анна Петрова")
			Field(id: "f-clinic", name: "clinic", label: "Клиника", placeholder: "Центр ВРТ")
			Field(id: "f-contact", name: "contact", label: "Телефон или email", placeholder: "+7 … или name@clinic.ru", isFullWidth: true)
			Field(id: "f-msg", name: "message", label: "Что важно показать", placeholder: "Например: крио хранилище и отчёт РАРЧ", isFullWidth: true, isMultiline: true)

			Tag("div") {
				Tag("button") { "Запросить демо" }
					.class("btn lg")
					.attribute("type", "submit")
				Tag("span") { "Откроется письмо в вашей почтовой программе." }
			}
			.class("form-foot full")
		}
		.class("form")
		.id("demo-form")
		.data("email", Contact.email)
	}
}

private struct Field: HTML {
	var id: String
	var name: String
	var label: String
	var placeholder: String
	var isFullWidth = false
	var isMultiline = false

	var body: some HTML {
		Tag("div") {
			Tag("label") { label }
				.attribute("for", id)

			if isMultiline {
				Tag("textarea")
					.id(id)
					.attribute("name", name)
					.attribute("placeholder", placeholder)
			} else {
				Tag("input")
					.id(id)
					.attribute("name", name)
					.attribute("placeholder", placeholder)
			}
		}
		.class("field", isFullWidth ? "full" : nil)
	}
}
