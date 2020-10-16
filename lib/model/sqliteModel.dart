import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'sqliteModel.g.dart';

const accountTable = SqfEntityTable(tableName: 'account', fields: [
  SqfEntityField('id', DbType.integer, isPrimaryKeyField: true),
  SqfEntityField('userId', DbType.text),
  SqfEntityField('email', DbType.text),
  SqfEntityField('fullName', DbType.text),
  SqfEntityField('gender', DbType.text),
  SqfEntityField('address', DbType.text),
  SqfEntityField('phone', DbType.text),
  SqfEntityField('birthDate', DbType.text),
  SqfEntityField('city', DbType.text),
  SqfEntityField('zipCode', DbType.text),
  SqfEntityField('isActive', DbType.text),
  SqfEntityField('idDoku', DbType.text),
  SqfEntityField('whatsAppNumber', DbType.text),
  SqfEntityField('loginCheck', DbType.text),
  SqfEntityField('deviceLoyalty', DbType.text),
  SqfEntityField('createDate', DbType.text)
]);

const seqIdentity = SqfEntitySequence(
  sequenceName: 'identity',
);

@SqfEntityBuilder(dbModel)
const dbModel = SqfEntityModel(
    modelName: 'AgrotechDBModel',
    databaseName: 'agrotech.db',
    databaseTables: [accountTable],
    sequences: [seqIdentity],
    bundledDatabasePath: null);
