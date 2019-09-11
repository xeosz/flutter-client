import 'package:memoize/memoize.dart';
import 'package:built_collection/built_collection.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/redux/ui/list_ui_state.dart';

var memoizedDropdownClientList = memo2(
    (BuiltMap<String, ClientEntity> clientMap, BuiltList<String> clientList) =>
        dropdownClientsSelector(clientMap, clientList));

List<String> dropdownClientsSelector(
    BuiltMap<String, ClientEntity> clientMap, BuiltList<String> clientList) {
  final list =
      clientList.where((clientId) => clientMap[clientId].isActive).toList();

  list.sort((clientAId, clientBId) {
    final clientA = clientMap[clientAId];
    final clientB = clientMap[clientBId];
    return clientA.compareTo(clientB, ClientFields.name, true);
  });

  return list;
}

var memoizedFilteredClientList = memo3(
    (BuiltMap<String, ClientEntity> clientMap, BuiltList<String> clientList,
            ListUIState clientListState) =>
        filteredClientsSelector(clientMap, clientList, clientListState));

List<String> filteredClientsSelector(BuiltMap<String, ClientEntity> clientMap,
    BuiltList<String> clientList, ListUIState clientListState) {
  final list = clientList.where((clientId) {
    final client = clientMap[clientId];
    if (!client.matchesStates(clientListState.stateFilters)) {
      return false;
    }
    if (clientListState.custom1Filters.isNotEmpty &&
        !clientListState.custom1Filters.contains(client.customValue1)) {
      return false;
    }
    if (clientListState.custom2Filters.isNotEmpty &&
        !clientListState.custom2Filters.contains(client.customValue2)) {
      return false;
    }
    return client.matchesFilter(clientListState.filter);
  }).toList();

  list.sort((clientAId, clientBId) {
    final clientA = clientMap[clientAId];
    final clientB = clientMap[clientBId];
    return clientA.compareTo(
        clientB, clientListState.sortField, clientListState.sortAscending);
  });

  return list;
}

bool hasClientChanges(
        ClientEntity client, BuiltMap<String, ClientEntity> clientMap) =>
    client.isNew || client != clientMap[client.id];
