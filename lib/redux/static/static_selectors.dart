import 'package:built_collection/built_collection.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:memoize/memoize.dart';

var memoizedCountryList = memo1(
    (BuiltMap<String, CountryEntity> countryMap) => countryList(countryMap));

List<String> countryList(BuiltMap<String, CountryEntity> countryMap) {
  final list = countryMap.keys.toList();

  list.sort((idA, idB) => countryMap[idA]
      .listDisplayName
      .compareTo(countryMap[idB].listDisplayName));

  return list;
}

var memoizedLanguageList = memo1(
    (BuiltMap<String, LanguageEntity> languageMap) =>
        languageList(languageMap));

List<String> languageList(BuiltMap<String, LanguageEntity> languageMap) {
  final list = languageMap.keys.toList();

  list.sort((idA, idB) => languageMap[idA]
      .listDisplayName
      .compareTo(languageMap[idB].listDisplayName));

  return list;
}

var memoizedCurrencyList = memo1(
    (BuiltMap<String, CurrencyEntity> currencyMap) =>
        currencyList(currencyMap));

List<String> currencyList(BuiltMap<String, CurrencyEntity> currencyMap) {
  final list = currencyMap.keys.toList();

  list.sort((idA, idB) => currencyMap[idA]
      .listDisplayName
      .compareTo(currencyMap[idB].listDisplayName));

  return list;
}

var memoizedIndustryList = memo1(
    (BuiltMap<String, IndustryEntity> industryMap) =>
        industryList(industryMap));

List<String> industryList(BuiltMap<String, IndustryEntity> industryMap) {
  final list = industryMap.keys.toList();

  list.sort((idA, idB) => industryMap[idA]
      .listDisplayName
      .compareTo(industryMap[idB].listDisplayName));

  return list;
}

var memoizedSizeList =
    memo1((BuiltMap<String, SizeEntity> sizeMap) => sizeList(sizeMap));

List<String> sizeList(BuiltMap<String, SizeEntity> sizeMap) {
  final list = sizeMap.keys.toList();

  list.sort((idA, idB) => sizeMap[idA].id.compareTo(sizeMap[idB].id));

  return list;
}

var memoizedPaymentTypeList = memo1(
    (BuiltMap<String, PaymentTypeEntity> paymentTypeMap) =>
        paymentTypeList(paymentTypeMap));

List<String> paymentTypeList(
    BuiltMap<String, PaymentTypeEntity> paymentTypeMap) {
  final list = paymentTypeMap.keys.toList();

  list.sort(
      (idA, idB) => paymentTypeMap[idA].id.compareTo(paymentTypeMap[idB].id));

  return list;
}
