// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $StandardsTableTable extends StandardsTable
    with TableInfo<$StandardsTableTable, Standards> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StandardsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _domainMeta = const VerificationMeta('domain');
  @override
  late final GeneratedColumn<int> domain = GeneratedColumn<int>(
    'domain',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _skillMeta = const VerificationMeta('skill');
  @override
  late final GeneratedColumn<int> skill = GeneratedColumn<int>(
    'skill',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    parentId,
    level,
    domain,
    skill,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'standards_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<Standards> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('domain')) {
      context.handle(
        _domainMeta,
        domain.isAcceptableOrUnknown(data['domain']!, _domainMeta),
      );
    } else if (isInserting) {
      context.missing(_domainMeta);
    }
    if (data.containsKey('skill')) {
      context.handle(
        _skillMeta,
        skill.isAcceptableOrUnknown(data['skill']!, _skillMeta),
      );
    } else if (isInserting) {
      context.missing(_skillMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Standards map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Standards(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_id'],
      ),
      level:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}level'],
          )!,
      domain:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}domain'],
          )!,
      skill:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}skill'],
          )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $StandardsTableTable createAlias(String alias) {
    return $StandardsTableTable(attachedDatabase, alias);
  }
}

class Standards extends DataClass implements Insertable<Standards> {
  final int id;
  final String name;
  final int? parentId;
  final int level;
  final int domain;
  final int skill;
  final String? description;
  const Standards({
    required this.id,
    required this.name,
    this.parentId,
    required this.level,
    required this.domain,
    required this.skill,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int>(parentId);
    }
    map['level'] = Variable<int>(level);
    map['domain'] = Variable<int>(domain);
    map['skill'] = Variable<int>(skill);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  StandardsTableCompanion toCompanion(bool nullToAbsent) {
    return StandardsTableCompanion(
      id: Value(id),
      name: Value(name),
      parentId:
          parentId == null && nullToAbsent
              ? const Value.absent()
              : Value(parentId),
      level: Value(level),
      domain: Value(domain),
      skill: Value(skill),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
    );
  }

  factory Standards.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Standards(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      parentId: serializer.fromJson<int?>(json['parentId']),
      level: serializer.fromJson<int>(json['level']),
      domain: serializer.fromJson<int>(json['domain']),
      skill: serializer.fromJson<int>(json['skill']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'parentId': serializer.toJson<int?>(parentId),
      'level': serializer.toJson<int>(level),
      'domain': serializer.toJson<int>(domain),
      'skill': serializer.toJson<int>(skill),
      'description': serializer.toJson<String?>(description),
    };
  }

  Standards copyWith({
    int? id,
    String? name,
    Value<int?> parentId = const Value.absent(),
    int? level,
    int? domain,
    int? skill,
    Value<String?> description = const Value.absent(),
  }) => Standards(
    id: id ?? this.id,
    name: name ?? this.name,
    parentId: parentId.present ? parentId.value : this.parentId,
    level: level ?? this.level,
    domain: domain ?? this.domain,
    skill: skill ?? this.skill,
    description: description.present ? description.value : this.description,
  );
  Standards copyWithCompanion(StandardsTableCompanion data) {
    return Standards(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      level: data.level.present ? data.level.value : this.level,
      domain: data.domain.present ? data.domain.value : this.domain,
      skill: data.skill.present ? data.skill.value : this.skill,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Standards(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('parentId: $parentId, ')
          ..write('level: $level, ')
          ..write('domain: $domain, ')
          ..write('skill: $skill, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, parentId, level, domain, skill, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Standards &&
          other.id == this.id &&
          other.name == this.name &&
          other.parentId == this.parentId &&
          other.level == this.level &&
          other.domain == this.domain &&
          other.skill == this.skill &&
          other.description == this.description);
}

class StandardsTableCompanion extends UpdateCompanion<Standards> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> parentId;
  final Value<int> level;
  final Value<int> domain;
  final Value<int> skill;
  final Value<String?> description;
  const StandardsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.parentId = const Value.absent(),
    this.level = const Value.absent(),
    this.domain = const Value.absent(),
    this.skill = const Value.absent(),
    this.description = const Value.absent(),
  });
  StandardsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.parentId = const Value.absent(),
    required int level,
    required int domain,
    required int skill,
    this.description = const Value.absent(),
  }) : name = Value(name),
       level = Value(level),
       domain = Value(domain),
       skill = Value(skill);
  static Insertable<Standards> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? parentId,
    Expression<int>? level,
    Expression<int>? domain,
    Expression<int>? skill,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (parentId != null) 'parent_id': parentId,
      if (level != null) 'level': level,
      if (domain != null) 'domain': domain,
      if (skill != null) 'skill': skill,
      if (description != null) 'description': description,
    });
  }

  StandardsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int?>? parentId,
    Value<int>? level,
    Value<int>? domain,
    Value<int>? skill,
    Value<String?>? description,
  }) {
    return StandardsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      level: level ?? this.level,
      domain: domain ?? this.domain,
      skill: skill ?? this.skill,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (domain.present) {
      map['domain'] = Variable<int>(domain.value);
    }
    if (skill.present) {
      map['skill'] = Variable<int>(skill.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StandardsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('parentId: $parentId, ')
          ..write('level: $level, ')
          ..write('domain: $domain, ')
          ..write('skill: $skill, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $DomainsTableTable extends DomainsTable
    with TableInfo<$DomainsTableTable, Domains> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DomainsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'domains_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<Domains> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Domains map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Domains(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
    );
  }

  @override
  $DomainsTableTable createAlias(String alias) {
    return $DomainsTableTable(attachedDatabase, alias);
  }
}

class Domains extends DataClass implements Insertable<Domains> {
  final int id;
  final String name;
  const Domains({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  DomainsTableCompanion toCompanion(bool nullToAbsent) {
    return DomainsTableCompanion(id: Value(id), name: Value(name));
  }

  factory Domains.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Domains(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Domains copyWith({int? id, String? name}) =>
      Domains(id: id ?? this.id, name: name ?? this.name);
  Domains copyWithCompanion(DomainsTableCompanion data) {
    return Domains(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Domains(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Domains && other.id == this.id && other.name == this.name);
}

class DomainsTableCompanion extends UpdateCompanion<Domains> {
  final Value<int> id;
  final Value<String> name;
  const DomainsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  DomainsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Domains> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  DomainsTableCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return DomainsTableCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DomainsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $SkillsTableTable extends SkillsTable
    with TableInfo<$SkillsTableTable, Skills> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SkillsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _domainMeta = const VerificationMeta('domain');
  @override
  late final GeneratedColumn<int> domain = GeneratedColumn<int>(
    'domain',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, domain, level];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'skills_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<Skills> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('domain')) {
      context.handle(
        _domainMeta,
        domain.isAcceptableOrUnknown(data['domain']!, _domainMeta),
      );
    } else if (isInserting) {
      context.missing(_domainMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Skills map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Skills(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      domain:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}domain'],
          )!,
      level:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}level'],
          )!,
    );
  }

  @override
  $SkillsTableTable createAlias(String alias) {
    return $SkillsTableTable(attachedDatabase, alias);
  }
}

class Skills extends DataClass implements Insertable<Skills> {
  final int id;
  final String name;
  final int domain;
  final int level;
  const Skills({
    required this.id,
    required this.name,
    required this.domain,
    required this.level,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['domain'] = Variable<int>(domain);
    map['level'] = Variable<int>(level);
    return map;
  }

  SkillsTableCompanion toCompanion(bool nullToAbsent) {
    return SkillsTableCompanion(
      id: Value(id),
      name: Value(name),
      domain: Value(domain),
      level: Value(level),
    );
  }

  factory Skills.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Skills(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      domain: serializer.fromJson<int>(json['domain']),
      level: serializer.fromJson<int>(json['level']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'domain': serializer.toJson<int>(domain),
      'level': serializer.toJson<int>(level),
    };
  }

  Skills copyWith({int? id, String? name, int? domain, int? level}) => Skills(
    id: id ?? this.id,
    name: name ?? this.name,
    domain: domain ?? this.domain,
    level: level ?? this.level,
  );
  Skills copyWithCompanion(SkillsTableCompanion data) {
    return Skills(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      domain: data.domain.present ? data.domain.value : this.domain,
      level: data.level.present ? data.level.value : this.level,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Skills(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('domain: $domain, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, domain, level);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Skills &&
          other.id == this.id &&
          other.name == this.name &&
          other.domain == this.domain &&
          other.level == this.level);
}

class SkillsTableCompanion extends UpdateCompanion<Skills> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> domain;
  final Value<int> level;
  const SkillsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.domain = const Value.absent(),
    this.level = const Value.absent(),
  });
  SkillsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int domain,
    required int level,
  }) : name = Value(name),
       domain = Value(domain),
       level = Value(level);
  static Insertable<Skills> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? domain,
    Expression<int>? level,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (domain != null) 'domain': domain,
      if (level != null) 'level': level,
    });
  }

  SkillsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? domain,
    Value<int>? level,
  }) {
    return SkillsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      domain: domain ?? this.domain,
      level: level ?? this.level,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (domain.present) {
      map['domain'] = Variable<int>(domain.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SkillsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('domain: $domain, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }
}

class $LevelsTableTable extends LevelsTable
    with TableInfo<$LevelsTableTable, Levels> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LevelsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'levels_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<Levels> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Levels map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Levels(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
    );
  }

  @override
  $LevelsTableTable createAlias(String alias) {
    return $LevelsTableTable(attachedDatabase, alias);
  }
}

class Levels extends DataClass implements Insertable<Levels> {
  final int id;
  final String name;
  const Levels({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  LevelsTableCompanion toCompanion(bool nullToAbsent) {
    return LevelsTableCompanion(id: Value(id), name: Value(name));
  }

  factory Levels.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Levels(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Levels copyWith({int? id, String? name}) =>
      Levels(id: id ?? this.id, name: name ?? this.name);
  Levels copyWithCompanion(LevelsTableCompanion data) {
    return Levels(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Levels(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Levels && other.id == this.id && other.name == this.name);
}

class LevelsTableCompanion extends UpdateCompanion<Levels> {
  final Value<int> id;
  final Value<String> name;
  const LevelsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  LevelsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Levels> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  LevelsTableCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return LevelsTableCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LevelsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $StandardsTableTable standardsTable = $StandardsTableTable(this);
  late final $DomainsTableTable domainsTable = $DomainsTableTable(this);
  late final $SkillsTableTable skillsTable = $SkillsTableTable(this);
  late final $LevelsTableTable levelsTable = $LevelsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    standardsTable,
    domainsTable,
    skillsTable,
    levelsTable,
  ];
}

typedef $$StandardsTableTableCreateCompanionBuilder =
    StandardsTableCompanion Function({
      Value<int> id,
      required String name,
      Value<int?> parentId,
      required int level,
      required int domain,
      required int skill,
      Value<String?> description,
    });
typedef $$StandardsTableTableUpdateCompanionBuilder =
    StandardsTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int?> parentId,
      Value<int> level,
      Value<int> domain,
      Value<int> skill,
      Value<String?> description,
    });

class $$StandardsTableTableFilterComposer
    extends Composer<_$AppDatabase, $StandardsTableTable> {
  $$StandardsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get domain => $composableBuilder(
    column: $table.domain,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get skill => $composableBuilder(
    column: $table.skill,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StandardsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $StandardsTableTable> {
  $$StandardsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get domain => $composableBuilder(
    column: $table.domain,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get skill => $composableBuilder(
    column: $table.skill,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StandardsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $StandardsTableTable> {
  $$StandardsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<int> get domain =>
      $composableBuilder(column: $table.domain, builder: (column) => column);

  GeneratedColumn<int> get skill =>
      $composableBuilder(column: $table.skill, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
}

class $$StandardsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StandardsTableTable,
          Standards,
          $$StandardsTableTableFilterComposer,
          $$StandardsTableTableOrderingComposer,
          $$StandardsTableTableAnnotationComposer,
          $$StandardsTableTableCreateCompanionBuilder,
          $$StandardsTableTableUpdateCompanionBuilder,
          (
            Standards,
            BaseReferences<_$AppDatabase, $StandardsTableTable, Standards>,
          ),
          Standards,
          PrefetchHooks Function()
        > {
  $$StandardsTableTableTableManager(
    _$AppDatabase db,
    $StandardsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$StandardsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$StandardsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$StandardsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int?> parentId = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<int> domain = const Value.absent(),
                Value<int> skill = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => StandardsTableCompanion(
                id: id,
                name: name,
                parentId: parentId,
                level: level,
                domain: domain,
                skill: skill,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<int?> parentId = const Value.absent(),
                required int level,
                required int domain,
                required int skill,
                Value<String?> description = const Value.absent(),
              }) => StandardsTableCompanion.insert(
                id: id,
                name: name,
                parentId: parentId,
                level: level,
                domain: domain,
                skill: skill,
                description: description,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StandardsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StandardsTableTable,
      Standards,
      $$StandardsTableTableFilterComposer,
      $$StandardsTableTableOrderingComposer,
      $$StandardsTableTableAnnotationComposer,
      $$StandardsTableTableCreateCompanionBuilder,
      $$StandardsTableTableUpdateCompanionBuilder,
      (
        Standards,
        BaseReferences<_$AppDatabase, $StandardsTableTable, Standards>,
      ),
      Standards,
      PrefetchHooks Function()
    >;
typedef $$DomainsTableTableCreateCompanionBuilder =
    DomainsTableCompanion Function({Value<int> id, required String name});
typedef $$DomainsTableTableUpdateCompanionBuilder =
    DomainsTableCompanion Function({Value<int> id, Value<String> name});

class $$DomainsTableTableFilterComposer
    extends Composer<_$AppDatabase, $DomainsTableTable> {
  $$DomainsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DomainsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DomainsTableTable> {
  $$DomainsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DomainsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DomainsTableTable> {
  $$DomainsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$DomainsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DomainsTableTable,
          Domains,
          $$DomainsTableTableFilterComposer,
          $$DomainsTableTableOrderingComposer,
          $$DomainsTableTableAnnotationComposer,
          $$DomainsTableTableCreateCompanionBuilder,
          $$DomainsTableTableUpdateCompanionBuilder,
          (Domains, BaseReferences<_$AppDatabase, $DomainsTableTable, Domains>),
          Domains,
          PrefetchHooks Function()
        > {
  $$DomainsTableTableTableManager(_$AppDatabase db, $DomainsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$DomainsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$DomainsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$DomainsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => DomainsTableCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  DomainsTableCompanion.insert(id: id, name: name),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DomainsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DomainsTableTable,
      Domains,
      $$DomainsTableTableFilterComposer,
      $$DomainsTableTableOrderingComposer,
      $$DomainsTableTableAnnotationComposer,
      $$DomainsTableTableCreateCompanionBuilder,
      $$DomainsTableTableUpdateCompanionBuilder,
      (Domains, BaseReferences<_$AppDatabase, $DomainsTableTable, Domains>),
      Domains,
      PrefetchHooks Function()
    >;
typedef $$SkillsTableTableCreateCompanionBuilder =
    SkillsTableCompanion Function({
      Value<int> id,
      required String name,
      required int domain,
      required int level,
    });
typedef $$SkillsTableTableUpdateCompanionBuilder =
    SkillsTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> domain,
      Value<int> level,
    });

class $$SkillsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SkillsTableTable> {
  $$SkillsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get domain => $composableBuilder(
    column: $table.domain,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SkillsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SkillsTableTable> {
  $$SkillsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get domain => $composableBuilder(
    column: $table.domain,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SkillsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SkillsTableTable> {
  $$SkillsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get domain =>
      $composableBuilder(column: $table.domain, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);
}

class $$SkillsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SkillsTableTable,
          Skills,
          $$SkillsTableTableFilterComposer,
          $$SkillsTableTableOrderingComposer,
          $$SkillsTableTableAnnotationComposer,
          $$SkillsTableTableCreateCompanionBuilder,
          $$SkillsTableTableUpdateCompanionBuilder,
          (Skills, BaseReferences<_$AppDatabase, $SkillsTableTable, Skills>),
          Skills,
          PrefetchHooks Function()
        > {
  $$SkillsTableTableTableManager(_$AppDatabase db, $SkillsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SkillsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SkillsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$SkillsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> domain = const Value.absent(),
                Value<int> level = const Value.absent(),
              }) => SkillsTableCompanion(
                id: id,
                name: name,
                domain: domain,
                level: level,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int domain,
                required int level,
              }) => SkillsTableCompanion.insert(
                id: id,
                name: name,
                domain: domain,
                level: level,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SkillsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SkillsTableTable,
      Skills,
      $$SkillsTableTableFilterComposer,
      $$SkillsTableTableOrderingComposer,
      $$SkillsTableTableAnnotationComposer,
      $$SkillsTableTableCreateCompanionBuilder,
      $$SkillsTableTableUpdateCompanionBuilder,
      (Skills, BaseReferences<_$AppDatabase, $SkillsTableTable, Skills>),
      Skills,
      PrefetchHooks Function()
    >;
typedef $$LevelsTableTableCreateCompanionBuilder =
    LevelsTableCompanion Function({Value<int> id, required String name});
typedef $$LevelsTableTableUpdateCompanionBuilder =
    LevelsTableCompanion Function({Value<int> id, Value<String> name});

class $$LevelsTableTableFilterComposer
    extends Composer<_$AppDatabase, $LevelsTableTable> {
  $$LevelsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LevelsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LevelsTableTable> {
  $$LevelsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LevelsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LevelsTableTable> {
  $$LevelsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$LevelsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LevelsTableTable,
          Levels,
          $$LevelsTableTableFilterComposer,
          $$LevelsTableTableOrderingComposer,
          $$LevelsTableTableAnnotationComposer,
          $$LevelsTableTableCreateCompanionBuilder,
          $$LevelsTableTableUpdateCompanionBuilder,
          (Levels, BaseReferences<_$AppDatabase, $LevelsTableTable, Levels>),
          Levels,
          PrefetchHooks Function()
        > {
  $$LevelsTableTableTableManager(_$AppDatabase db, $LevelsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$LevelsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$LevelsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$LevelsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => LevelsTableCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  LevelsTableCompanion.insert(id: id, name: name),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LevelsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LevelsTableTable,
      Levels,
      $$LevelsTableTableFilterComposer,
      $$LevelsTableTableOrderingComposer,
      $$LevelsTableTableAnnotationComposer,
      $$LevelsTableTableCreateCompanionBuilder,
      $$LevelsTableTableUpdateCompanionBuilder,
      (Levels, BaseReferences<_$AppDatabase, $LevelsTableTable, Levels>),
      Levels,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$StandardsTableTableTableManager get standardsTable =>
      $$StandardsTableTableTableManager(_db, _db.standardsTable);
  $$DomainsTableTableTableManager get domainsTable =>
      $$DomainsTableTableTableManager(_db, _db.domainsTable);
  $$SkillsTableTableTableManager get skillsTable =>
      $$SkillsTableTableTableManager(_db, _db.skillsTable);
  $$LevelsTableTableTableManager get levelsTable =>
      $$LevelsTableTableTableManager(_db, _db.levelsTable);
}
