import Foundation
import Ignite

struct Home: StaticPage {
	var title = "Главная"
	var description = "EmbryoDoc — электронный документооборот для центров ВРТ: эмбриология, крио, циклы ВРТ, ЕГИСЗ и отчётность в одной системе."

	var body: some HTML {
		hero
		roles
		embryologists
		doctors
		administrators
		patients
		benefits
		contact
	}

	private var hero: some HTML {
		Tag("div") {
			Tag("div") {
				Tag("span") { "Электронный документооборот · Центры ВРТ" }
					.class("overline")
				Tag("h1") { "Каждый эмбрион и каждый протокол — в одной системе." }
				Tag("p") { "EmbryoDoc ведёт цикл ВРТ от стимуляции до переноса: эмбриология, крио, документы и обмен с ЕГИСЗ. Данные вносятся один раз и проверяются на каждом шаге." }
					.class("lead")

				Tag("div") {
					Tag("a") { "Запросить демо" }
						.class("btn lg")
						.attribute("href", "#contact")
					Tag("a") { "Возможности" }
						.class("btn lg secondary")
						.attribute("href", "#embryologists")
				}
				.class("actions")

				Tag("div") {
					ForEach(["Приказ № 803н", "ЕГИСЗ · СЭМД", "Отчёт РАРЧ"]) { label in
						Tag("span") { label }
							.class("tag neutral")
					}
				}
				.class("tags")
			}
			.class("hero-copy")

			CultureRecord()
		}
		.class("wrap hero")
	}

	private var roles: some HTML {
		Tag("div") {
			RoleCard(number: "01", title: "Эмбриологам", text: "Культивирование, крио, доноры, KPI лаборатории.", target: "#embryologists")
			RoleCard(number: "02", title: "Репродуктологам", text: "Циклы ВРТ, приёмы, шаблоны и ЕГИСЗ.", target: "#doctors")
			RoleCard(number: "03", title: "Администраторам", text: "Расписание, касса и печатные формы.", target: "#administrators")
			RoleCard(number: "04", title: "Пациентам", text: "Приложение: эмбрионы, запись, документы.", target: "#patients")
		}
		.class("wrap roles")
	}

	private var embryologists: some HTML {
		PageSection(id: "embryologists", number: "01", title: "Эмбриологам", lead: "Вся работа лаборатории в одном журнале: от получения ооцитов до переноса и криохранения.") {
			Tag("div") {
				Tag("div") {
					Photo(path: "/images/1_embryologist.jpeg", description: "Эмбриолог работает в лаборатории ЭКО за инвертированным микроскопом", ratio: "r4x3")
				}
				.class("wide")

				Tag("div") {
					Tag("span") { "Культивирование" }
						.class("overline")
					Tag("h3") { "Каждая стадия — с оценкой и снимком" }
					BulletList(items: [
						"Регистрация всех стадий развития эмбрионов",
						"Оценка морфологии на каждом этапе",
						"Фотодокументирование процесса",
						"Контроль параметров инкубаторов",
						"Учёт сред, реагентов и серий расходных материалов",
					])
				}
				.class("narrow")
			}
			.class("split")

			Tag("div") {
				FeatureCard(
					image: ("/images/3_cryo.jpeg", "Эмбриолог достаёт канистру из сосуда Дьюара с жидким азотом"),
					title: "КРИО хранилище",
					items: [
						"Электронное хранилище, мужское и женское",
						"Учёт всех единиц биоматериала и история манипуляций",
						"Уведомления об окончании договоров на хранение",
					]
				)
				FeatureCard(overline: "Real-time KPI", title: "Показатели лаборатории", items: [
					"Частота наступления беременности по протоколам",
					"Процент оплодотворения и дробления",
					"Эффективность криопрограмм",
					"Качество эмбрионов и имплантационный потенциал",
					"Дашборды и графики без ручного сбора",
				])
				FeatureCard(overline: "Донорство", title: "Донорские программы", items: [
					"База доноров ооцитов и спермы",
					"Профили доноров: фенотип и генотип",
					"Подбор по фенотипу",
					"Контроль числа детей от одного донора",
				])
				FeatureCard(overline: "Суррогатное материнство", title: "Программы суррогатного материнства", items: [
					"База суррогатных матерей",
					"Подбор пары и синхронизация циклов",
					"Протоколы подготовки эндометрия",
					"Мониторинг беременности",
				])
			}
			.class("grid cards-2")
		}
	}

	private var doctors: some HTML {
		PageSection(id: "doctors", number: "02", title: "Репродуктологам", lead: "Цикл ВРТ ведётся в одной карте. Система связывает этапы лечения и проверяет назначения.") {
			Tag("div") {
				Tag("div") {
					Photo(path: "/images/2_doctor.jpeg", description: "Репродуктолог обсуждает план лечения с парой", ratio: "r16x11")
				}
				.class("narrow")

				Tag("div") {
					FeatureRow(title: "Электронные циклы ВРТ", text: "Стимуляция по дням с препаратами, пункции и переносы. Логические связи между этапами и контроль назначений.")
					FeatureRow(title: "Шаблоны", text: "Обследования всех видов и протоколы УЗИ с измерениями. Настройка под клинику.")
					FeatureRow(title: "Приёмы", text: "Электронная медкарта, дневники приёмов, выписки и заключения.")
					FeatureRow(title: "Интеграция с ЕГИСЗ", text: "СЭМД создаются автоматически и отправляются в ЕГИСЗ. Формирование ИЭМК.")
					FeatureRow(title: "Статистика", text: "Эффективность протоколов, статистика по врачам и ежегодный отчёт РАРЧ.")
				}
				.class("wide rows")
			}
			.class("split")

			Tag("div") {
				Tag("p") { "Документы по приказу Минздрава № 803н от 31.07.2020 формируются из данных цикла." }
				Tag("a") { "Посмотреть на демо →" }
					.class("arrow")
					.attribute("href", "#contact")
			}
			.class("callout")
		}
	}

	private var administrators: some HTML {
		PageSection(id: "administrators", number: "03", title: "Администраторам", lead: "Регистратура, касса и документы работают на тех же данных, что и врачи.") {
			Photo(path: "/images/5_reception.jpeg", description: "Администратор клиники ведёт расписание за стойкой регистратуры", ratio: "r3x1 banner")

			Tag("div") {
				FeatureCard(title: "Регистратура", items: [
					"Календарь специалистов и кабинетов",
					"Гибкое расписание и услуги",
					"Онлайн-запись из внешних сервисов",
					"Контроль загрузки специалистов",
				])
				FeatureCard(title: "Касса", items: [
					"Отчёты по оказанным услугам",
					"Учёт потраченных материалов",
					"Дебиторская задолженность",
					"Счета, акты и онлайн-кассы",
				])
				FeatureCard(title: "Печатные формы", items: [
					"Договоры и информированные согласия",
					"Анкеты и опросники",
					"Шаблоны под нужды клиники",
					"Данные пациента подставляются сами",
				])
			}
			.class("grid cards-3")
		}
	}

	private var patients: some HTML {
		Tag("section") {
			Tag("div") {
				Tag("div") {
					SectionHeader(number: "04", title: "Пациентам", lead: "Мобильное приложение клиники. Пациент видит свой цикл и не звонит, чтобы узнать новости.")
					Tag("div") {
						FeatureRow(title: "Культивирование", text: "Снимки эмбрионов по дням, уведомления о важных этапах и комментарии эмбриолога.")
						FeatureRow(title: "Запись на приём", text: "Свободное время специалистов, напоминания, отмена и перенос.")
						FeatureRow(title: "Личный кабинет", text: "Календарь процедур, результаты анализов и документы для налогового вычета.")
					}
					.class("rows")
				}
				.class("wide")

				PatientPhone()
			}
			.class("wrap split")
		}
		.class("section surface")
		.id("patients")
	}

	private var benefits: some HTML {
		PageSection(id: "benefits", number: "05", title: "Почему EmbryoDoc", lead: "Система создана вместе с эмбриологами и врачами центров ВРТ.", style: "plain") {
			Tag("div") {
				Benefit(title: "Меньше ошибок", text: "Система проверяет данные при вводе и не даёт пропустить этап.")
				Benefit(title: "Качество данных", text: "Один источник для лаборатории, врачей, кассы и отчётов.")
				Benefit(title: "Без рутины", text: "Документы, дневники и статистика собираются автоматически.")
				Benefit(title: "Соответствие закону", text: "Требования ЕГИСЗ и приказа № 803н выполняются из коробки.")
				Benefit(title: "Контроль всего цикла", text: "Каждый этап лечения виден и связан с предыдущим.")
				Benefit(title: "Удобно пациентам", text: "Приложение снимает лишние звонки и вопросы.")
			}
			.class("benefits")
		}
	}

	private var contact: some HTML {
		Tag("section") {
			Tag("div") {
				Tag("div") {
					Tag("span") { "06 · Контакты" }
						.class("overline accent")
					Tag("h2") { "Покажем EmbryoDoc на задачах вашей клиники" }
					Tag("p") { "Оставьте контакты — договоримся о демонстрации в удобное время. Отвечаем в течение рабочего дня." }
						.class("lead")
					Tag("a") { Contact.email }
						.attribute("href", "mailto:\(Contact.email)")
				}

				ContactForm()
			}
			.class("wrap contact")
		}
		.class("section inverse")
		.id("contact")
		.data("theme", "dark")
	}
}
