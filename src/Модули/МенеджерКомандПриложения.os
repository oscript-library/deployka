
Перем мИсполнителиКоманд;

Процедура ЗарегистрироватьКоманды(Знач Парсер) Экспорт
	
	мИсполнителиКоманд = Новый Соответствие;
	
	ДобавитьКоманду("help"    ,       "КомандаСправкаПоПараметрам", Парсер);
	ДобавитьКоманду("loadcfg" ,       "КомандаЗагрузитьКонфигурацию", Парсер);
	ДобавитьКоманду("loadrepo",       "КомандаОбновитьИзХранилища", Парсер);
	ДобавитьКоманду("session" ,       "КомандаУправлениеСеансами", Парсер);
	ДобавитьКоманду("dbupdate",       "КомандаОбновитьКонфигурациюБД", Парсер);
	ДобавитьКоманду("run",            "КомандаЗапуститьВРежимеПредприятия", Парсер);
	ДобавитьКоманду("disablesupport", "КомандаСнятьСПоддержки", Парсер);
	ДобавитьКоманду("unbindrepo",     "КомандаОтключитьсяОтХранилища", Парсер);
	ДобавитьКоманду("scheduledjobs",  "КомандаУправлениеСеансами", Парсер);
	ДобавитьКоманду("info",           "КомандаУправлениеСеансами", Парсер);
	ДобавитьКоманду("release",		  "КомандаУправлениеПоставкой", Парсер);
	
КонецПроцедуры

Функция ПолучитьКоманду(Знач ИмяКоманды) Экспорт
	
	КлассРеализации = мИсполнителиКоманд[ИмяКоманды];
	Если КлассРеализации = Неопределено Тогда
		ВызватьИсключение "Неверная операция. Команда '"+ИмяКоманды+"' не предусмотрена";
	КонецЕсли;
	
	Возврат КлассРеализации;
	
КонецФункции

Функция ВыполнитьКоманду(Знач ИмяКоманды, Знач ПараметрыКоманды) Экспорт
	
	Команда = ПолучитьКоманду(ИмяКоманды);

	Возврат Команда.ВыполнитьКоманду(ПараметрыКоманды);

КонецФункции

Функция РезультатыКоманд() Экспорт

	РезультатыКоманд = Новый Структура;
	РезультатыКоманд.Вставить("НеРеализовано", 255);
	РезультатыКоманд.Вставить("Успех", 0);
	РезультатыКоманд.Вставить("НеверныеПараметры", 5);
	РезультатыКоманд.Вставить("ОшибкаВремениВыполнения", 1);
	
	Возврат РезультатыКоманд;

КонецФункции

Функция КодВозвратаКоманды(Знач Команда) Экспорт
	Возврат Число(Команда);
КонецФункции

Процедура ДобавитьКоманду(Знач ИмяКоманды, Знач КлассРеализации, Знач Парсер)
	
	РеализацияКоманды = Новый(КлассРеализации);
	РеализацияКоманды.ЗарегистрироватьКоманду(ИмяКоманды, Парсер);
	мИсполнителиКоманд.Вставить(ИмяКоманды, РеализацияКоманды);

КонецПроцедуры

Процедура ПоказатьСправкуПоКомандам() Экспорт
	ВыполнитьКоманду("help", Новый Соответствие);
КонецПроцедуры
