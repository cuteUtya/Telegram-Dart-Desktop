part of 'tdapi.dart';

TdObject convertToObject(String query) {
    final newJson = json.decode(query);
    final object = allObjects[newJson['@type']]!(newJson);
    return object;
}
