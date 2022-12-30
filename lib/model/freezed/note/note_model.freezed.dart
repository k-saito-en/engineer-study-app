// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteStateData {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isReadyData => throw _privateConstructorUsedError;
  List<NoteItem> get todoItems => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteStateDataCopyWith<NoteStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteStateDataCopyWith<$Res> {
  factory $NoteStateDataCopyWith(
          NoteStateData value, $Res Function(NoteStateData) then) =
      _$NoteStateDataCopyWithImpl<$Res, NoteStateData>;
  @useResult
  $Res call({bool isLoading, bool isReadyData, List<NoteItem> todoItems});
}

/// @nodoc
class _$NoteStateDataCopyWithImpl<$Res, $Val extends NoteStateData>
    implements $NoteStateDataCopyWith<$Res> {
  _$NoteStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isReadyData = null,
    Object? todoItems = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: null == isReadyData
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      todoItems: null == todoItems
          ? _value.todoItems
          : todoItems // ignore: cast_nullable_to_non_nullable
              as List<NoteItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NoteStateDataCopyWith<$Res>
    implements $NoteStateDataCopyWith<$Res> {
  factory _$$_NoteStateDataCopyWith(
          _$_NoteStateData value, $Res Function(_$_NoteStateData) then) =
      __$$_NoteStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isReadyData, List<NoteItem> todoItems});
}

/// @nodoc
class __$$_NoteStateDataCopyWithImpl<$Res>
    extends _$NoteStateDataCopyWithImpl<$Res, _$_NoteStateData>
    implements _$$_NoteStateDataCopyWith<$Res> {
  __$$_NoteStateDataCopyWithImpl(
      _$_NoteStateData _value, $Res Function(_$_NoteStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isReadyData = null,
    Object? todoItems = null,
  }) {
    return _then(_$_NoteStateData(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: null == isReadyData
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      todoItems: null == todoItems
          ? _value._todoItems
          : todoItems // ignore: cast_nullable_to_non_nullable
              as List<NoteItem>,
    ));
  }
}

/// @nodoc

class _$_NoteStateData implements _NoteStateData {
  _$_NoteStateData(
      {this.isLoading = false,
      this.isReadyData = false,
      final List<NoteItem> todoItems = const []})
      : _todoItems = todoItems;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isReadyData;
  final List<NoteItem> _todoItems;
  @override
  @JsonKey()
  List<NoteItem> get todoItems {
    if (_todoItems is EqualUnmodifiableListView) return _todoItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todoItems);
  }

  @override
  String toString() {
    return 'NoteStateData(isLoading: $isLoading, isReadyData: $isReadyData, todoItems: $todoItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteStateData &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isReadyData, isReadyData) ||
                other.isReadyData == isReadyData) &&
            const DeepCollectionEquality()
                .equals(other._todoItems, _todoItems));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isReadyData,
      const DeepCollectionEquality().hash(_todoItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoteStateDataCopyWith<_$_NoteStateData> get copyWith =>
      __$$_NoteStateDataCopyWithImpl<_$_NoteStateData>(this, _$identity);
}

abstract class _NoteStateData implements NoteStateData {
  factory _NoteStateData(
      {final bool isLoading,
      final bool isReadyData,
      final List<NoteItem> todoItems}) = _$_NoteStateData;

  @override
  bool get isLoading;
  @override
  bool get isReadyData;
  @override
  List<NoteItem> get todoItems;
  @override
  @JsonKey(ignore: true)
  _$$_NoteStateDataCopyWith<_$_NoteStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TempNoteItemData {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime? get limit => throw _privateConstructorUsedError;
  bool get isNotify => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TempNoteItemDataCopyWith<TempNoteItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TempNoteItemDataCopyWith<$Res> {
  factory $TempNoteItemDataCopyWith(
          TempNoteItemData value, $Res Function(TempNoteItemData) then) =
      _$TempNoteItemDataCopyWithImpl<$Res, TempNoteItemData>;
  @useResult
  $Res call({String title, String description, DateTime? limit, bool isNotify});
}

/// @nodoc
class _$TempNoteItemDataCopyWithImpl<$Res, $Val extends TempNoteItemData>
    implements $TempNoteItemDataCopyWith<$Res> {
  _$TempNoteItemDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? limit = freezed,
    Object? isNotify = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isNotify: null == isNotify
          ? _value.isNotify
          : isNotify // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TempNoteItemDataCopyWith<$Res>
    implements $TempNoteItemDataCopyWith<$Res> {
  factory _$$_TempNoteItemDataCopyWith(
          _$_TempNoteItemData value, $Res Function(_$_TempNoteItemData) then) =
      __$$_TempNoteItemDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description, DateTime? limit, bool isNotify});
}

/// @nodoc
class __$$_TempNoteItemDataCopyWithImpl<$Res>
    extends _$TempNoteItemDataCopyWithImpl<$Res, _$_TempNoteItemData>
    implements _$$_TempNoteItemDataCopyWith<$Res> {
  __$$_TempNoteItemDataCopyWithImpl(
      _$_TempNoteItemData _value, $Res Function(_$_TempNoteItemData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? limit = freezed,
    Object? isNotify = null,
  }) {
    return _then(_$_TempNoteItemData(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isNotify: null == isNotify
          ? _value.isNotify
          : isNotify // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TempNoteItemData implements _TempNoteItemData {
  _$_TempNoteItemData(
      {this.title = '',
      this.description = '',
      this.limit = null,
      this.isNotify = true});

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final DateTime? limit;
  @override
  @JsonKey()
  final bool isNotify;

  @override
  String toString() {
    return 'TempNoteItemData(title: $title, description: $description, limit: $limit, isNotify: $isNotify)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TempNoteItemData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.isNotify, isNotify) ||
                other.isNotify == isNotify));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, description, limit, isNotify);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TempNoteItemDataCopyWith<_$_TempNoteItemData> get copyWith =>
      __$$_TempNoteItemDataCopyWithImpl<_$_TempNoteItemData>(this, _$identity);
}

abstract class _TempNoteItemData implements TempNoteItemData {
  factory _TempNoteItemData(
      {final String title,
      final String description,
      final DateTime? limit,
      final bool isNotify}) = _$_TempNoteItemData;

  @override
  String get title;
  @override
  String get description;
  @override
  DateTime? get limit;
  @override
  bool get isNotify;
  @override
  @JsonKey(ignore: true)
  _$$_TempNoteItemDataCopyWith<_$_TempNoteItemData> get copyWith =>
      throw _privateConstructorUsedError;
}
