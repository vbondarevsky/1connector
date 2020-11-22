#Использовать "../internal"

Перем Заголовки Экспорт;
Перем Аутентификация Экспорт;
Перем Прокси Экспорт;
Перем ПараметрыЗапроса Экспорт;
Перем МаксимальноеКоличествоПеренаправлений Экспорт;
Перем Cookies Экспорт;
Перем СлужебныеДанные Экспорт;

Процедура ПриСозданииОбъекта()
	
	Заголовки = ЗаголовкиПоУмолчанию();
	ПараметрыЗапроса = Новый Структура();
	МаксимальноеКоличествоПеренаправлений = 30;
	Cookies = Новый Соответствие();
	СлужебныеДанные = Новый Структура("ПараметрыDigest");
	
КонецПроцедуры

Функция ВызватьМетод(Метод, URL, ДополнительныеПараметры = Неопределено) Экспорт

	КоннекторHTTPСлужебный.ЗаполнитьДополнительныеДанные(
		ДополнительныеПараметры, Неопределено, Неопределено, Неопределено);
	Возврат КоннекторHTTPСлужебный.ВызватьHTTPМетод(ЭтотОбъект, Метод, URL, ДополнительныеПараметры);

КонецФункции

Функция ЗаголовкиПоУмолчанию()
	
	Заголовки = Новый Соответствие;
	Заголовки.Вставить("Accept-Encoding", "gzip");
	Заголовки.Вставить("Accept", "*/*");
	Заголовки.Вставить("User-Agent", "1connector");
	
	Возврат Заголовки;
	
КонецФункции