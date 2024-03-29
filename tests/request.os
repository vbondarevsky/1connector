#Использовать asserts
#Использовать "../src"

// BSLLS:UnusedParameters-off
Функция ПолучитьСписокТестов(МенеджерТестирования) Экспорт
// BSLLS:UnusedParameters-on
	МассивТестов = Новый Массив;
	МассивТестов.Добавить("ТестДолжен_ПроверитьЧтоРаботаетAWS4_HMAC_SHA256_ПустоеТелоПортНеУказан");
	МассивТестов.Добавить("ТестДолжен_ПроверитьЧтоРаботаетAWS4_HMAC_SHA256_ПустоеТелоУказанСтандартныйПорт");
	МассивТестов.Добавить("ТестДолжен_ПроверитьЧтоРаботаетAWS4_HMAC_SHA256_ПустоеТелоУказанНеСтандартныйПорт");
	МассивТестов.Добавить("ТестДолжен_ПроверитьЧтоРаботаетДатаИзСтрокиRFC7231");

	Возврат МассивТестов;

КонецФункции

Процедура ТестДолжен_ПроверитьЧтоРаботаетAWS4_HMAC_SHA256_ПустоеТелоПортНеУказан() Экспорт

	URL = "https://sqs.eu-north-1.amazonaws.com/123456789101/test";

	Аутентификация = Новый Структура;
	Аутентификация.Вставить("Тип", "AWS4-HMAC-SHA256");
	Аутентификация.Вставить("ИдентификаторКлючаДоступа", "ACCESS_KEY");
	Аутентификация.Вставить("СекретныйКлюч", "SECRET_KEY");
	Аутентификация.Вставить("Регион", "eu-north-1");
	Аутентификация.Вставить("Сервис", "sqs");

	Заголовки = Новый Соответствие;
	Заголовки.Вставить("x-amz-date", "20200426T122000Z");

	Сессия = Новый Сессия;
	Сессия.Заголовки = Заголовки;
	Сессия.Аутентификация = Аутентификация;

	ПодготовленныйЗапрос = Новый ПодготовленныйЗапрос(Сессия, "GET", URL, Новый Структура);

	Ожидаем.Что(ПодготовленныйЗапрос.Заголовки["x-amz-date"]).Равно("20200426T122000Z");
	Ожидаем.Что(ПодготовленныйЗапрос.Заголовки["x-amz-content-sha256"]).Равно(
		"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855");
	// BSLLS:LineLength-off
	Ожидаем.Что(ПодготовленныйЗапрос.Заголовки["Authorization"]).Равно(
		"AWS4-HMAC-SHA256 Credential=ACCESS_KEY/20200426/eu-north-1/sqs/aws4_request, SignedHeaders=host;x-amz-content-sha256;x-amz-date, Signature=ad98a02ef5df6b5337128ccdac1e5a279846c0d1c4b409e713a75dae0c9e4cb3");
	// BSLLS:LineLength-on
КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтоРаботаетAWS4_HMAC_SHA256_ПустоеТелоУказанСтандартныйПорт() Экспорт

	URL = "https://sqs.eu-north-1.amazonaws.com:443/123456789101/test";

	Аутентификация = Новый Структура;
	Аутентификация.Вставить("Тип", "AWS4-HMAC-SHA256");
	Аутентификация.Вставить("ИдентификаторКлючаДоступа", "ACCESS_KEY");
	Аутентификация.Вставить("СекретныйКлюч", "SECRET_KEY");
	Аутентификация.Вставить("Регион", "eu-north-1");
	Аутентификация.Вставить("Сервис", "sqs");

	Заголовки = Новый Соответствие;
	Заголовки.Вставить("x-amz-date", "20200426T122000Z");

	Сессия = Новый Сессия;
	Сессия.Заголовки = Заголовки;
	Сессия.Аутентификация = Аутентификация;

	ПодготовленныйЗапрос = Новый ПодготовленныйЗапрос(Сессия, "GET", URL, Новый Структура);

	Ожидаем.Что(ПодготовленныйЗапрос.Заголовки["x-amz-date"]).Равно("20200426T122000Z");
	Ожидаем.Что(ПодготовленныйЗапрос.Заголовки["x-amz-content-sha256"]).Равно(
		"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855");
	// BSLLS:LineLength-off
	Ожидаем.Что(ПодготовленныйЗапрос.Заголовки["Authorization"]).Равно(
		"AWS4-HMAC-SHA256 Credential=ACCESS_KEY/20200426/eu-north-1/sqs/aws4_request, SignedHeaders=host;x-amz-content-sha256;x-amz-date, Signature=ad98a02ef5df6b5337128ccdac1e5a279846c0d1c4b409e713a75dae0c9e4cb3");
	// BSLLS:LineLength-on
КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтоРаботаетAWS4_HMAC_SHA256_ПустоеТелоУказанНеСтандартныйПорт() Экспорт

	URL = "https://sqs.eu-north-1.amazonaws.com:444/123456789101/test";

	Аутентификация = Новый Структура;
	Аутентификация.Вставить("Тип", "AWS4-HMAC-SHA256");
	Аутентификация.Вставить("ИдентификаторКлючаДоступа", "ACCESS_KEY");
	Аутентификация.Вставить("СекретныйКлюч", "SECRET_KEY");
	Аутентификация.Вставить("Регион", "eu-north-1");
	Аутентификация.Вставить("Сервис", "sqs");

	Заголовки = Новый Соответствие;
	Заголовки.Вставить("x-amz-date", "20200426T122000Z");

	Сессия = Новый Сессия;
	Сессия.Заголовки = Заголовки;
	Сессия.Аутентификация = Аутентификация;

	ПодготовленныйЗапрос = Новый ПодготовленныйЗапрос(Сессия, "GET", URL, Новый Структура);

	Ожидаем.Что(ПодготовленныйЗапрос.Заголовки["x-amz-date"]).Равно("20200426T122000Z");
	Ожидаем.Что(ПодготовленныйЗапрос.Заголовки["x-amz-content-sha256"]).Равно(
		"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855");
	// BSLLS:LineLength-off
	Ожидаем.Что(ПодготовленныйЗапрос.Заголовки["Authorization"]).Равно(
		"AWS4-HMAC-SHA256 Credential=ACCESS_KEY/20200426/eu-north-1/sqs/aws4_request, SignedHeaders=host;x-amz-content-sha256;x-amz-date, Signature=96df4fab493e08b8a72965acf7a6d2fd651a883a2766a2b0e4c0cd113dea7d8c");
	// BSLLS:LineLength-on
КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтоРаботаетДатаИзСтрокиRFC7231() Экспорт

	Ожидаем.Что(КоннекторHTTPСлужебный.ДатаИзСтрокиRFC7231("Tue, 15 Nov 1994 12:45:26 GMT")).Равно(Дата(1994, 11, 15, 12, 45, 26));

КонецПроцедуры
