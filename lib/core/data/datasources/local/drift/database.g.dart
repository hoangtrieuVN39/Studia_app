// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $StandardsTableTable extends StandardsTable
    with TableInfo<$StandardsTableTable, Standards> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StandardsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _standard_idMeta = const VerificationMeta(
    'standard_id',
  );
  @override
  late final GeneratedColumn<int> standard_id = GeneratedColumn<int>(
    'standard_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _standardMeta = const VerificationMeta(
    'standard',
  );
  @override
  late final GeneratedColumn<String> standard = GeneratedColumn<String>(
    'standard',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parent_idMeta = const VerificationMeta(
    'parent_id',
  );
  @override
  late final GeneratedColumn<int> parent_id = GeneratedColumn<int>(
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
    standard_id,
    standard,
    parent_id,
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
    if (data.containsKey('standard_id')) {
      context.handle(
        _standard_idMeta,
        standard_id.isAcceptableOrUnknown(
          data['standard_id']!,
          _standard_idMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_standard_idMeta);
    }
    if (data.containsKey('standard')) {
      context.handle(
        _standardMeta,
        standard.isAcceptableOrUnknown(data['standard']!, _standardMeta),
      );
    } else if (isInserting) {
      context.missing(_standardMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parent_idMeta,
        parent_id.isAcceptableOrUnknown(data['parent_id']!, _parent_idMeta),
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
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Standards map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Standards(
      standard_id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}standard_id'],
          )!,
      standard:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}standard'],
          )!,
      parent_id: attachedDatabase.typeMapping.read(
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
  final int standard_id;
  final String standard;
  final int? parent_id;
  final int level;
  final int domain;
  final int skill;
  final String? description;
  const Standards({
    required this.standard_id,
    required this.standard,
    this.parent_id,
    required this.level,
    required this.domain,
    required this.skill,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['standard_id'] = Variable<int>(standard_id);
    map['standard'] = Variable<String>(standard);
    if (!nullToAbsent || parent_id != null) {
      map['parent_id'] = Variable<int>(parent_id);
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
      standard_id: Value(standard_id),
      standard: Value(standard),
      parent_id:
          parent_id == null && nullToAbsent
              ? const Value.absent()
              : Value(parent_id),
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
      standard_id: serializer.fromJson<int>(json['standard_id']),
      standard: serializer.fromJson<String>(json['standard']),
      parent_id: serializer.fromJson<int?>(json['parent_id']),
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
      'standard_id': serializer.toJson<int>(standard_id),
      'standard': serializer.toJson<String>(standard),
      'parent_id': serializer.toJson<int?>(parent_id),
      'level': serializer.toJson<int>(level),
      'domain': serializer.toJson<int>(domain),
      'skill': serializer.toJson<int>(skill),
      'description': serializer.toJson<String?>(description),
    };
  }

  Standards copyWith({
    int? standard_id,
    String? standard,
    Value<int?> parent_id = const Value.absent(),
    int? level,
    int? domain,
    int? skill,
    Value<String?> description = const Value.absent(),
  }) => Standards(
    standard_id: standard_id ?? this.standard_id,
    standard: standard ?? this.standard,
    parent_id: parent_id.present ? parent_id.value : this.parent_id,
    level: level ?? this.level,
    domain: domain ?? this.domain,
    skill: skill ?? this.skill,
    description: description.present ? description.value : this.description,
  );
  Standards copyWithCompanion(StandardsTableCompanion data) {
    return Standards(
      standard_id:
          data.standard_id.present ? data.standard_id.value : this.standard_id,
      standard: data.standard.present ? data.standard.value : this.standard,
      parent_id: data.parent_id.present ? data.parent_id.value : this.parent_id,
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
          ..write('standard_id: $standard_id, ')
          ..write('standard: $standard, ')
          ..write('parent_id: $parent_id, ')
          ..write('level: $level, ')
          ..write('domain: $domain, ')
          ..write('skill: $skill, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    standard_id,
    standard,
    parent_id,
    level,
    domain,
    skill,
    description,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Standards &&
          other.standard_id == this.standard_id &&
          other.standard == this.standard &&
          other.parent_id == this.parent_id &&
          other.level == this.level &&
          other.domain == this.domain &&
          other.skill == this.skill &&
          other.description == this.description);
}

class StandardsTableCompanion extends UpdateCompanion<Standards> {
  final Value<int> standard_id;
  final Value<String> standard;
  final Value<int?> parent_id;
  final Value<int> level;
  final Value<int> domain;
  final Value<int> skill;
  final Value<String?> description;
  final Value<int> rowid;
  const StandardsTableCompanion({
    this.standard_id = const Value.absent(),
    this.standard = const Value.absent(),
    this.parent_id = const Value.absent(),
    this.level = const Value.absent(),
    this.domain = const Value.absent(),
    this.skill = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StandardsTableCompanion.insert({
    required int standard_id,
    required String standard,
    this.parent_id = const Value.absent(),
    required int level,
    required int domain,
    required int skill,
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : standard_id = Value(standard_id),
       standard = Value(standard),
       level = Value(level),
       domain = Value(domain),
       skill = Value(skill);
  static Insertable<Standards> custom({
    Expression<int>? standard_id,
    Expression<String>? standard,
    Expression<int>? parent_id,
    Expression<int>? level,
    Expression<int>? domain,
    Expression<int>? skill,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (standard_id != null) 'standard_id': standard_id,
      if (standard != null) 'standard': standard,
      if (parent_id != null) 'parent_id': parent_id,
      if (level != null) 'level': level,
      if (domain != null) 'domain': domain,
      if (skill != null) 'skill': skill,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StandardsTableCompanion copyWith({
    Value<int>? standard_id,
    Value<String>? standard,
    Value<int?>? parent_id,
    Value<int>? level,
    Value<int>? domain,
    Value<int>? skill,
    Value<String?>? description,
    Value<int>? rowid,
  }) {
    return StandardsTableCompanion(
      standard_id: standard_id ?? this.standard_id,
      standard: standard ?? this.standard,
      parent_id: parent_id ?? this.parent_id,
      level: level ?? this.level,
      domain: domain ?? this.domain,
      skill: skill ?? this.skill,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (standard_id.present) {
      map['standard_id'] = Variable<int>(standard_id.value);
    }
    if (standard.present) {
      map['standard'] = Variable<String>(standard.value);
    }
    if (parent_id.present) {
      map['parent_id'] = Variable<int>(parent_id.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StandardsTableCompanion(')
          ..write('standard_id: $standard_id, ')
          ..write('standard: $standard, ')
          ..write('parent_id: $parent_id, ')
          ..write('level: $level, ')
          ..write('domain: $domain, ')
          ..write('skill: $skill, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _domain_idMeta = const VerificationMeta(
    'domain_id',
  );
  @override
  late final GeneratedColumn<int> domain_id = GeneratedColumn<int>(
    'domain_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _domain_nameMeta = const VerificationMeta(
    'domain_name',
  );
  @override
  late final GeneratedColumn<String> domain_name = GeneratedColumn<String>(
    'domain_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [domain_id, domain_name];
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
    if (data.containsKey('domain_id')) {
      context.handle(
        _domain_idMeta,
        domain_id.isAcceptableOrUnknown(data['domain_id']!, _domain_idMeta),
      );
    } else if (isInserting) {
      context.missing(_domain_idMeta);
    }
    if (data.containsKey('domain_name')) {
      context.handle(
        _domain_nameMeta,
        domain_name.isAcceptableOrUnknown(
          data['domain_name']!,
          _domain_nameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_domain_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Domains map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Domains(
      domain_id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}domain_id'],
          )!,
      domain_name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}domain_name'],
          )!,
    );
  }

  @override
  $DomainsTableTable createAlias(String alias) {
    return $DomainsTableTable(attachedDatabase, alias);
  }
}

class Domains extends DataClass implements Insertable<Domains> {
  final int domain_id;
  final String domain_name;
  const Domains({required this.domain_id, required this.domain_name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['domain_id'] = Variable<int>(domain_id);
    map['domain_name'] = Variable<String>(domain_name);
    return map;
  }

  DomainsTableCompanion toCompanion(bool nullToAbsent) {
    return DomainsTableCompanion(
      domain_id: Value(domain_id),
      domain_name: Value(domain_name),
    );
  }

  factory Domains.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Domains(
      domain_id: serializer.fromJson<int>(json['domain_id']),
      domain_name: serializer.fromJson<String>(json['domain_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'domain_id': serializer.toJson<int>(domain_id),
      'domain_name': serializer.toJson<String>(domain_name),
    };
  }

  Domains copyWith({int? domain_id, String? domain_name}) => Domains(
    domain_id: domain_id ?? this.domain_id,
    domain_name: domain_name ?? this.domain_name,
  );
  Domains copyWithCompanion(DomainsTableCompanion data) {
    return Domains(
      domain_id: data.domain_id.present ? data.domain_id.value : this.domain_id,
      domain_name:
          data.domain_name.present ? data.domain_name.value : this.domain_name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Domains(')
          ..write('domain_id: $domain_id, ')
          ..write('domain_name: $domain_name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(domain_id, domain_name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Domains &&
          other.domain_id == this.domain_id &&
          other.domain_name == this.domain_name);
}

class DomainsTableCompanion extends UpdateCompanion<Domains> {
  final Value<int> domain_id;
  final Value<String> domain_name;
  final Value<int> rowid;
  const DomainsTableCompanion({
    this.domain_id = const Value.absent(),
    this.domain_name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DomainsTableCompanion.insert({
    required int domain_id,
    required String domain_name,
    this.rowid = const Value.absent(),
  }) : domain_id = Value(domain_id),
       domain_name = Value(domain_name);
  static Insertable<Domains> custom({
    Expression<int>? domain_id,
    Expression<String>? domain_name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (domain_id != null) 'domain_id': domain_id,
      if (domain_name != null) 'domain_name': domain_name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DomainsTableCompanion copyWith({
    Value<int>? domain_id,
    Value<String>? domain_name,
    Value<int>? rowid,
  }) {
    return DomainsTableCompanion(
      domain_id: domain_id ?? this.domain_id,
      domain_name: domain_name ?? this.domain_name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (domain_id.present) {
      map['domain_id'] = Variable<int>(domain_id.value);
    }
    if (domain_name.present) {
      map['domain_name'] = Variable<String>(domain_name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DomainsTableCompanion(')
          ..write('domain_id: $domain_id, ')
          ..write('domain_name: $domain_name, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _skill_idMeta = const VerificationMeta(
    'skill_id',
  );
  @override
  late final GeneratedColumn<int> skill_id = GeneratedColumn<int>(
    'skill_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _skill_nameMeta = const VerificationMeta(
    'skill_name',
  );
  @override
  late final GeneratedColumn<String> skill_name = GeneratedColumn<String>(
    'skill_name',
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
  List<GeneratedColumn> get $columns => [skill_id, skill_name, domain, level];
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
    if (data.containsKey('skill_id')) {
      context.handle(
        _skill_idMeta,
        skill_id.isAcceptableOrUnknown(data['skill_id']!, _skill_idMeta),
      );
    } else if (isInserting) {
      context.missing(_skill_idMeta);
    }
    if (data.containsKey('skill_name')) {
      context.handle(
        _skill_nameMeta,
        skill_name.isAcceptableOrUnknown(data['skill_name']!, _skill_nameMeta),
      );
    } else if (isInserting) {
      context.missing(_skill_nameMeta);
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
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Skills map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Skills(
      skill_id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}skill_id'],
          )!,
      skill_name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}skill_name'],
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
  final int skill_id;
  final String skill_name;
  final int domain;
  final int level;
  const Skills({
    required this.skill_id,
    required this.skill_name,
    required this.domain,
    required this.level,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['skill_id'] = Variable<int>(skill_id);
    map['skill_name'] = Variable<String>(skill_name);
    map['domain'] = Variable<int>(domain);
    map['level'] = Variable<int>(level);
    return map;
  }

  SkillsTableCompanion toCompanion(bool nullToAbsent) {
    return SkillsTableCompanion(
      skill_id: Value(skill_id),
      skill_name: Value(skill_name),
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
      skill_id: serializer.fromJson<int>(json['skill_id']),
      skill_name: serializer.fromJson<String>(json['skill_name']),
      domain: serializer.fromJson<int>(json['domain']),
      level: serializer.fromJson<int>(json['level']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'skill_id': serializer.toJson<int>(skill_id),
      'skill_name': serializer.toJson<String>(skill_name),
      'domain': serializer.toJson<int>(domain),
      'level': serializer.toJson<int>(level),
    };
  }

  Skills copyWith({
    int? skill_id,
    String? skill_name,
    int? domain,
    int? level,
  }) => Skills(
    skill_id: skill_id ?? this.skill_id,
    skill_name: skill_name ?? this.skill_name,
    domain: domain ?? this.domain,
    level: level ?? this.level,
  );
  Skills copyWithCompanion(SkillsTableCompanion data) {
    return Skills(
      skill_id: data.skill_id.present ? data.skill_id.value : this.skill_id,
      skill_name:
          data.skill_name.present ? data.skill_name.value : this.skill_name,
      domain: data.domain.present ? data.domain.value : this.domain,
      level: data.level.present ? data.level.value : this.level,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Skills(')
          ..write('skill_id: $skill_id, ')
          ..write('skill_name: $skill_name, ')
          ..write('domain: $domain, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(skill_id, skill_name, domain, level);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Skills &&
          other.skill_id == this.skill_id &&
          other.skill_name == this.skill_name &&
          other.domain == this.domain &&
          other.level == this.level);
}

class SkillsTableCompanion extends UpdateCompanion<Skills> {
  final Value<int> skill_id;
  final Value<String> skill_name;
  final Value<int> domain;
  final Value<int> level;
  final Value<int> rowid;
  const SkillsTableCompanion({
    this.skill_id = const Value.absent(),
    this.skill_name = const Value.absent(),
    this.domain = const Value.absent(),
    this.level = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SkillsTableCompanion.insert({
    required int skill_id,
    required String skill_name,
    required int domain,
    required int level,
    this.rowid = const Value.absent(),
  }) : skill_id = Value(skill_id),
       skill_name = Value(skill_name),
       domain = Value(domain),
       level = Value(level);
  static Insertable<Skills> custom({
    Expression<int>? skill_id,
    Expression<String>? skill_name,
    Expression<int>? domain,
    Expression<int>? level,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (skill_id != null) 'skill_id': skill_id,
      if (skill_name != null) 'skill_name': skill_name,
      if (domain != null) 'domain': domain,
      if (level != null) 'level': level,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SkillsTableCompanion copyWith({
    Value<int>? skill_id,
    Value<String>? skill_name,
    Value<int>? domain,
    Value<int>? level,
    Value<int>? rowid,
  }) {
    return SkillsTableCompanion(
      skill_id: skill_id ?? this.skill_id,
      skill_name: skill_name ?? this.skill_name,
      domain: domain ?? this.domain,
      level: level ?? this.level,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (skill_id.present) {
      map['skill_id'] = Variable<int>(skill_id.value);
    }
    if (skill_name.present) {
      map['skill_name'] = Variable<String>(skill_name.value);
    }
    if (domain.present) {
      map['domain'] = Variable<int>(domain.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SkillsTableCompanion(')
          ..write('skill_id: $skill_id, ')
          ..write('skill_name: $skill_name, ')
          ..write('domain: $domain, ')
          ..write('level: $level, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _level_idMeta = const VerificationMeta(
    'level_id',
  );
  @override
  late final GeneratedColumn<int> level_id = GeneratedColumn<int>(
    'level_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _level_nameMeta = const VerificationMeta(
    'level_name',
  );
  @override
  late final GeneratedColumn<String> level_name = GeneratedColumn<String>(
    'level_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [level_id, level_name];
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
    if (data.containsKey('level_id')) {
      context.handle(
        _level_idMeta,
        level_id.isAcceptableOrUnknown(data['level_id']!, _level_idMeta),
      );
    } else if (isInserting) {
      context.missing(_level_idMeta);
    }
    if (data.containsKey('level_name')) {
      context.handle(
        _level_nameMeta,
        level_name.isAcceptableOrUnknown(data['level_name']!, _level_nameMeta),
      );
    } else if (isInserting) {
      context.missing(_level_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Levels map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Levels(
      level_id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}level_id'],
          )!,
      level_name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}level_name'],
          )!,
    );
  }

  @override
  $LevelsTableTable createAlias(String alias) {
    return $LevelsTableTable(attachedDatabase, alias);
  }
}

class Levels extends DataClass implements Insertable<Levels> {
  final int level_id;
  final String level_name;
  const Levels({required this.level_id, required this.level_name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['level_id'] = Variable<int>(level_id);
    map['level_name'] = Variable<String>(level_name);
    return map;
  }

  LevelsTableCompanion toCompanion(bool nullToAbsent) {
    return LevelsTableCompanion(
      level_id: Value(level_id),
      level_name: Value(level_name),
    );
  }

  factory Levels.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Levels(
      level_id: serializer.fromJson<int>(json['level_id']),
      level_name: serializer.fromJson<String>(json['level_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'level_id': serializer.toJson<int>(level_id),
      'level_name': serializer.toJson<String>(level_name),
    };
  }

  Levels copyWith({int? level_id, String? level_name}) => Levels(
    level_id: level_id ?? this.level_id,
    level_name: level_name ?? this.level_name,
  );
  Levels copyWithCompanion(LevelsTableCompanion data) {
    return Levels(
      level_id: data.level_id.present ? data.level_id.value : this.level_id,
      level_name:
          data.level_name.present ? data.level_name.value : this.level_name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Levels(')
          ..write('level_id: $level_id, ')
          ..write('level_name: $level_name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(level_id, level_name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Levels &&
          other.level_id == this.level_id &&
          other.level_name == this.level_name);
}

class LevelsTableCompanion extends UpdateCompanion<Levels> {
  final Value<int> level_id;
  final Value<String> level_name;
  final Value<int> rowid;
  const LevelsTableCompanion({
    this.level_id = const Value.absent(),
    this.level_name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LevelsTableCompanion.insert({
    required int level_id,
    required String level_name,
    this.rowid = const Value.absent(),
  }) : level_id = Value(level_id),
       level_name = Value(level_name);
  static Insertable<Levels> custom({
    Expression<int>? level_id,
    Expression<String>? level_name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (level_id != null) 'level_id': level_id,
      if (level_name != null) 'level_name': level_name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LevelsTableCompanion copyWith({
    Value<int>? level_id,
    Value<String>? level_name,
    Value<int>? rowid,
  }) {
    return LevelsTableCompanion(
      level_id: level_id ?? this.level_id,
      level_name: level_name ?? this.level_name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (level_id.present) {
      map['level_id'] = Variable<int>(level_id.value);
    }
    if (level_name.present) {
      map['level_name'] = Variable<String>(level_name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LevelsTableCompanion(')
          ..write('level_id: $level_id, ')
          ..write('level_name: $level_name, ')
          ..write('rowid: $rowid')
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
      required int standard_id,
      required String standard,
      Value<int?> parent_id,
      required int level,
      required int domain,
      required int skill,
      Value<String?> description,
      Value<int> rowid,
    });
typedef $$StandardsTableTableUpdateCompanionBuilder =
    StandardsTableCompanion Function({
      Value<int> standard_id,
      Value<String> standard,
      Value<int?> parent_id,
      Value<int> level,
      Value<int> domain,
      Value<int> skill,
      Value<String?> description,
      Value<int> rowid,
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
  ColumnFilters<int> get standard_id => $composableBuilder(
    column: $table.standard_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get standard => $composableBuilder(
    column: $table.standard,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get parent_id => $composableBuilder(
    column: $table.parent_id,
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
  ColumnOrderings<int> get standard_id => $composableBuilder(
    column: $table.standard_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get standard => $composableBuilder(
    column: $table.standard,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get parent_id => $composableBuilder(
    column: $table.parent_id,
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
  GeneratedColumn<int> get standard_id => $composableBuilder(
    column: $table.standard_id,
    builder: (column) => column,
  );

  GeneratedColumn<String> get standard =>
      $composableBuilder(column: $table.standard, builder: (column) => column);

  GeneratedColumn<int> get parent_id =>
      $composableBuilder(column: $table.parent_id, builder: (column) => column);

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
                Value<int> standard_id = const Value.absent(),
                Value<String> standard = const Value.absent(),
                Value<int?> parent_id = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<int> domain = const Value.absent(),
                Value<int> skill = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StandardsTableCompanion(
                standard_id: standard_id,
                standard: standard,
                parent_id: parent_id,
                level: level,
                domain: domain,
                skill: skill,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int standard_id,
                required String standard,
                Value<int?> parent_id = const Value.absent(),
                required int level,
                required int domain,
                required int skill,
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StandardsTableCompanion.insert(
                standard_id: standard_id,
                standard: standard,
                parent_id: parent_id,
                level: level,
                domain: domain,
                skill: skill,
                description: description,
                rowid: rowid,
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
    DomainsTableCompanion Function({
      required int domain_id,
      required String domain_name,
      Value<int> rowid,
    });
typedef $$DomainsTableTableUpdateCompanionBuilder =
    DomainsTableCompanion Function({
      Value<int> domain_id,
      Value<String> domain_name,
      Value<int> rowid,
    });

class $$DomainsTableTableFilterComposer
    extends Composer<_$AppDatabase, $DomainsTableTable> {
  $$DomainsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get domain_id => $composableBuilder(
    column: $table.domain_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get domain_name => $composableBuilder(
    column: $table.domain_name,
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
  ColumnOrderings<int> get domain_id => $composableBuilder(
    column: $table.domain_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get domain_name => $composableBuilder(
    column: $table.domain_name,
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
  GeneratedColumn<int> get domain_id =>
      $composableBuilder(column: $table.domain_id, builder: (column) => column);

  GeneratedColumn<String> get domain_name => $composableBuilder(
    column: $table.domain_name,
    builder: (column) => column,
  );
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
                Value<int> domain_id = const Value.absent(),
                Value<String> domain_name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DomainsTableCompanion(
                domain_id: domain_id,
                domain_name: domain_name,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int domain_id,
                required String domain_name,
                Value<int> rowid = const Value.absent(),
              }) => DomainsTableCompanion.insert(
                domain_id: domain_id,
                domain_name: domain_name,
                rowid: rowid,
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
      required int skill_id,
      required String skill_name,
      required int domain,
      required int level,
      Value<int> rowid,
    });
typedef $$SkillsTableTableUpdateCompanionBuilder =
    SkillsTableCompanion Function({
      Value<int> skill_id,
      Value<String> skill_name,
      Value<int> domain,
      Value<int> level,
      Value<int> rowid,
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
  ColumnFilters<int> get skill_id => $composableBuilder(
    column: $table.skill_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get skill_name => $composableBuilder(
    column: $table.skill_name,
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
  ColumnOrderings<int> get skill_id => $composableBuilder(
    column: $table.skill_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get skill_name => $composableBuilder(
    column: $table.skill_name,
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
  GeneratedColumn<int> get skill_id =>
      $composableBuilder(column: $table.skill_id, builder: (column) => column);

  GeneratedColumn<String> get skill_name => $composableBuilder(
    column: $table.skill_name,
    builder: (column) => column,
  );

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
                Value<int> skill_id = const Value.absent(),
                Value<String> skill_name = const Value.absent(),
                Value<int> domain = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SkillsTableCompanion(
                skill_id: skill_id,
                skill_name: skill_name,
                domain: domain,
                level: level,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int skill_id,
                required String skill_name,
                required int domain,
                required int level,
                Value<int> rowid = const Value.absent(),
              }) => SkillsTableCompanion.insert(
                skill_id: skill_id,
                skill_name: skill_name,
                domain: domain,
                level: level,
                rowid: rowid,
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
    LevelsTableCompanion Function({
      required int level_id,
      required String level_name,
      Value<int> rowid,
    });
typedef $$LevelsTableTableUpdateCompanionBuilder =
    LevelsTableCompanion Function({
      Value<int> level_id,
      Value<String> level_name,
      Value<int> rowid,
    });

class $$LevelsTableTableFilterComposer
    extends Composer<_$AppDatabase, $LevelsTableTable> {
  $$LevelsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get level_id => $composableBuilder(
    column: $table.level_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get level_name => $composableBuilder(
    column: $table.level_name,
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
  ColumnOrderings<int> get level_id => $composableBuilder(
    column: $table.level_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get level_name => $composableBuilder(
    column: $table.level_name,
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
  GeneratedColumn<int> get level_id =>
      $composableBuilder(column: $table.level_id, builder: (column) => column);

  GeneratedColumn<String> get level_name => $composableBuilder(
    column: $table.level_name,
    builder: (column) => column,
  );
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
                Value<int> level_id = const Value.absent(),
                Value<String> level_name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LevelsTableCompanion(
                level_id: level_id,
                level_name: level_name,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int level_id,
                required String level_name,
                Value<int> rowid = const Value.absent(),
              }) => LevelsTableCompanion.insert(
                level_id: level_id,
                level_name: level_name,
                rowid: rowid,
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
