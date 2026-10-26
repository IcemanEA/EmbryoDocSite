// Theme toggle and the demo request form for the EmbryoDoc site.
(function () {
	var root = document.documentElement;
	var key = 'embryodoc-theme';
	var saved = null;
	try { saved = localStorage.getItem(key); } catch (e) {}
	var dark = saved ? saved === 'dark' : window.matchMedia('(prefers-color-scheme: dark)').matches;

	function apply() { root.setAttribute('data-theme', dark ? 'dark' : 'light'); }
	apply();

	document.addEventListener('DOMContentLoaded', function () {
		var toggle = document.getElementById('theme-toggle');
		if (toggle) {
			toggle.addEventListener('click', function () {
				dark = !dark;
				apply();
				try { localStorage.setItem(key, dark ? 'dark' : 'light'); } catch (e) {}
			});
		}

		// The site is static, so the form opens a prefilled email instead of posting.
		var form = document.getElementById('demo-form');
		if (form) {
			form.addEventListener('submit', function (event) {
				event.preventDefault();
				var value = function (name) { return (form.elements[name] && form.elements[name].value || '').trim(); };
				var body = [
					'Имя: ' + value('name'),
					'Клиника: ' + value('clinic'),
					'Контакт: ' + value('contact'),
					'',
					value('message')
				].join('\n');
				window.location.href = 'mailto:' + form.dataset.email +
					'?subject=' + encodeURIComponent('Демо EmbryoDoc') +
					'&body=' + encodeURIComponent(body);
			});
		}
	});
})();
