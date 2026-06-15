// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderItem {

 int get id; String get snapshotName;@DoubleConverter() double get snapshotPrice; int get qty;
/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemCopyWith<OrderItem> get copyWith => _$OrderItemCopyWithImpl<OrderItem>(this as OrderItem, _$identity);

  /// Serializes this OrderItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.snapshotName, snapshotName) || other.snapshotName == snapshotName)&&(identical(other.snapshotPrice, snapshotPrice) || other.snapshotPrice == snapshotPrice)&&(identical(other.qty, qty) || other.qty == qty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,snapshotName,snapshotPrice,qty);

@override
String toString() {
  return 'OrderItem(id: $id, snapshotName: $snapshotName, snapshotPrice: $snapshotPrice, qty: $qty)';
}


}

/// @nodoc
abstract mixin class $OrderItemCopyWith<$Res>  {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) _then) = _$OrderItemCopyWithImpl;
@useResult
$Res call({
 int id, String snapshotName,@DoubleConverter() double snapshotPrice, int qty
});




}
/// @nodoc
class _$OrderItemCopyWithImpl<$Res>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._self, this._then);

  final OrderItem _self;
  final $Res Function(OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? snapshotName = null,Object? snapshotPrice = null,Object? qty = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,snapshotName: null == snapshotName ? _self.snapshotName : snapshotName // ignore: cast_nullable_to_non_nullable
as String,snapshotPrice: null == snapshotPrice ? _self.snapshotPrice : snapshotPrice // ignore: cast_nullable_to_non_nullable
as double,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItem].
extension OrderItemPatterns on OrderItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItem value)  $default,){
final _that = this;
switch (_that) {
case _OrderItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItem value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String snapshotName, @DoubleConverter()  double snapshotPrice,  int qty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.id,_that.snapshotName,_that.snapshotPrice,_that.qty);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String snapshotName, @DoubleConverter()  double snapshotPrice,  int qty)  $default,) {final _that = this;
switch (_that) {
case _OrderItem():
return $default(_that.id,_that.snapshotName,_that.snapshotPrice,_that.qty);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String snapshotName, @DoubleConverter()  double snapshotPrice,  int qty)?  $default,) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.id,_that.snapshotName,_that.snapshotPrice,_that.qty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItem implements OrderItem {
  const _OrderItem({required this.id, required this.snapshotName, @DoubleConverter() required this.snapshotPrice, required this.qty});
  factory _OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

@override final  int id;
@override final  String snapshotName;
@override@DoubleConverter() final  double snapshotPrice;
@override final  int qty;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemCopyWith<_OrderItem> get copyWith => __$OrderItemCopyWithImpl<_OrderItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.snapshotName, snapshotName) || other.snapshotName == snapshotName)&&(identical(other.snapshotPrice, snapshotPrice) || other.snapshotPrice == snapshotPrice)&&(identical(other.qty, qty) || other.qty == qty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,snapshotName,snapshotPrice,qty);

@override
String toString() {
  return 'OrderItem(id: $id, snapshotName: $snapshotName, snapshotPrice: $snapshotPrice, qty: $qty)';
}


}

/// @nodoc
abstract mixin class _$OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$OrderItemCopyWith(_OrderItem value, $Res Function(_OrderItem) _then) = __$OrderItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String snapshotName,@DoubleConverter() double snapshotPrice, int qty
});




}
/// @nodoc
class __$OrderItemCopyWithImpl<$Res>
    implements _$OrderItemCopyWith<$Res> {
  __$OrderItemCopyWithImpl(this._self, this._then);

  final _OrderItem _self;
  final $Res Function(_OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? snapshotName = null,Object? snapshotPrice = null,Object? qty = null,}) {
  return _then(_OrderItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,snapshotName: null == snapshotName ? _self.snapshotName : snapshotName // ignore: cast_nullable_to_non_nullable
as String,snapshotPrice: null == snapshotPrice ? _self.snapshotPrice : snapshotPrice // ignore: cast_nullable_to_non_nullable
as double,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DeliveryAddress {

 int get id; String get addressLine; String? get city; String? get state; String? get pincode; String? get phone;@NullableDoubleConverter() double? get latitude;@NullableDoubleConverter() double? get longitude;
/// Create a copy of DeliveryAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryAddressCopyWith<DeliveryAddress> get copyWith => _$DeliveryAddressCopyWithImpl<DeliveryAddress>(this as DeliveryAddress, _$identity);

  /// Serializes this DeliveryAddress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryAddress&&(identical(other.id, id) || other.id == id)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.pincode, pincode) || other.pincode == pincode)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,addressLine,city,state,pincode,phone,latitude,longitude);

@override
String toString() {
  return 'DeliveryAddress(id: $id, addressLine: $addressLine, city: $city, state: $state, pincode: $pincode, phone: $phone, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $DeliveryAddressCopyWith<$Res>  {
  factory $DeliveryAddressCopyWith(DeliveryAddress value, $Res Function(DeliveryAddress) _then) = _$DeliveryAddressCopyWithImpl;
@useResult
$Res call({
 int id, String addressLine, String? city, String? state, String? pincode, String? phone,@NullableDoubleConverter() double? latitude,@NullableDoubleConverter() double? longitude
});




}
/// @nodoc
class _$DeliveryAddressCopyWithImpl<$Res>
    implements $DeliveryAddressCopyWith<$Res> {
  _$DeliveryAddressCopyWithImpl(this._self, this._then);

  final DeliveryAddress _self;
  final $Res Function(DeliveryAddress) _then;

/// Create a copy of DeliveryAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? addressLine = null,Object? city = freezed,Object? state = freezed,Object? pincode = freezed,Object? phone = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,addressLine: null == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,pincode: freezed == pincode ? _self.pincode : pincode // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryAddress].
extension DeliveryAddressPatterns on DeliveryAddress {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryAddress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryAddress() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryAddress value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryAddress():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryAddress value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryAddress() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String addressLine,  String? city,  String? state,  String? pincode,  String? phone, @NullableDoubleConverter()  double? latitude, @NullableDoubleConverter()  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryAddress() when $default != null:
return $default(_that.id,_that.addressLine,_that.city,_that.state,_that.pincode,_that.phone,_that.latitude,_that.longitude);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String addressLine,  String? city,  String? state,  String? pincode,  String? phone, @NullableDoubleConverter()  double? latitude, @NullableDoubleConverter()  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _DeliveryAddress():
return $default(_that.id,_that.addressLine,_that.city,_that.state,_that.pincode,_that.phone,_that.latitude,_that.longitude);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String addressLine,  String? city,  String? state,  String? pincode,  String? phone, @NullableDoubleConverter()  double? latitude, @NullableDoubleConverter()  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryAddress() when $default != null:
return $default(_that.id,_that.addressLine,_that.city,_that.state,_that.pincode,_that.phone,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryAddress implements DeliveryAddress {
  const _DeliveryAddress({required this.id, required this.addressLine, this.city, this.state, this.pincode, this.phone, @NullableDoubleConverter() this.latitude, @NullableDoubleConverter() this.longitude});
  factory _DeliveryAddress.fromJson(Map<String, dynamic> json) => _$DeliveryAddressFromJson(json);

@override final  int id;
@override final  String addressLine;
@override final  String? city;
@override final  String? state;
@override final  String? pincode;
@override final  String? phone;
@override@NullableDoubleConverter() final  double? latitude;
@override@NullableDoubleConverter() final  double? longitude;

/// Create a copy of DeliveryAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryAddressCopyWith<_DeliveryAddress> get copyWith => __$DeliveryAddressCopyWithImpl<_DeliveryAddress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryAddressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryAddress&&(identical(other.id, id) || other.id == id)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.pincode, pincode) || other.pincode == pincode)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,addressLine,city,state,pincode,phone,latitude,longitude);

@override
String toString() {
  return 'DeliveryAddress(id: $id, addressLine: $addressLine, city: $city, state: $state, pincode: $pincode, phone: $phone, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$DeliveryAddressCopyWith<$Res> implements $DeliveryAddressCopyWith<$Res> {
  factory _$DeliveryAddressCopyWith(_DeliveryAddress value, $Res Function(_DeliveryAddress) _then) = __$DeliveryAddressCopyWithImpl;
@override @useResult
$Res call({
 int id, String addressLine, String? city, String? state, String? pincode, String? phone,@NullableDoubleConverter() double? latitude,@NullableDoubleConverter() double? longitude
});




}
/// @nodoc
class __$DeliveryAddressCopyWithImpl<$Res>
    implements _$DeliveryAddressCopyWith<$Res> {
  __$DeliveryAddressCopyWithImpl(this._self, this._then);

  final _DeliveryAddress _self;
  final $Res Function(_DeliveryAddress) _then;

/// Create a copy of DeliveryAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? addressLine = null,Object? city = freezed,Object? state = freezed,Object? pincode = freezed,Object? phone = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_DeliveryAddress(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,addressLine: null == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,pincode: freezed == pincode ? _self.pincode : pincode // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$AssignedAgent {

 int get id; String get name;
/// Create a copy of AssignedAgent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignedAgentCopyWith<AssignedAgent> get copyWith => _$AssignedAgentCopyWithImpl<AssignedAgent>(this as AssignedAgent, _$identity);

  /// Serializes this AssignedAgent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignedAgent&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'AssignedAgent(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $AssignedAgentCopyWith<$Res>  {
  factory $AssignedAgentCopyWith(AssignedAgent value, $Res Function(AssignedAgent) _then) = _$AssignedAgentCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$AssignedAgentCopyWithImpl<$Res>
    implements $AssignedAgentCopyWith<$Res> {
  _$AssignedAgentCopyWithImpl(this._self, this._then);

  final AssignedAgent _self;
  final $Res Function(AssignedAgent) _then;

/// Create a copy of AssignedAgent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AssignedAgent].
extension AssignedAgentPatterns on AssignedAgent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssignedAgent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssignedAgent() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssignedAgent value)  $default,){
final _that = this;
switch (_that) {
case _AssignedAgent():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssignedAgent value)?  $default,){
final _that = this;
switch (_that) {
case _AssignedAgent() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssignedAgent() when $default != null:
return $default(_that.id,_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _AssignedAgent():
return $default(_that.id,_that.name);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _AssignedAgent() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssignedAgent implements AssignedAgent {
  const _AssignedAgent({required this.id, required this.name});
  factory _AssignedAgent.fromJson(Map<String, dynamic> json) => _$AssignedAgentFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of AssignedAgent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignedAgentCopyWith<_AssignedAgent> get copyWith => __$AssignedAgentCopyWithImpl<_AssignedAgent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssignedAgentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignedAgent&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'AssignedAgent(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$AssignedAgentCopyWith<$Res> implements $AssignedAgentCopyWith<$Res> {
  factory _$AssignedAgentCopyWith(_AssignedAgent value, $Res Function(_AssignedAgent) _then) = __$AssignedAgentCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$AssignedAgentCopyWithImpl<$Res>
    implements _$AssignedAgentCopyWith<$Res> {
  __$AssignedAgentCopyWithImpl(this._self, this._then);

  final _AssignedAgent _self;
  final $Res Function(_AssignedAgent) _then;

/// Create a copy of AssignedAgent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_AssignedAgent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Order {

 int get id; String get status; String get deliveryType;@DoubleConverter() double get totalPrice; List<OrderItem> get orderItems; DeliveryAddress? get deliveryAddress; AssignedAgent? get assignedAgent; String? get estimatedDeliveryTime; String? get createdAt;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&const DeepCollectionEquality().equals(other.orderItems, orderItems)&&(identical(other.deliveryAddress, deliveryAddress) || other.deliveryAddress == deliveryAddress)&&(identical(other.assignedAgent, assignedAgent) || other.assignedAgent == assignedAgent)&&(identical(other.estimatedDeliveryTime, estimatedDeliveryTime) || other.estimatedDeliveryTime == estimatedDeliveryTime)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,deliveryType,totalPrice,const DeepCollectionEquality().hash(orderItems),deliveryAddress,assignedAgent,estimatedDeliveryTime,createdAt);

@override
String toString() {
  return 'Order(id: $id, status: $status, deliveryType: $deliveryType, totalPrice: $totalPrice, orderItems: $orderItems, deliveryAddress: $deliveryAddress, assignedAgent: $assignedAgent, estimatedDeliveryTime: $estimatedDeliveryTime, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 int id, String status, String deliveryType,@DoubleConverter() double totalPrice, List<OrderItem> orderItems, DeliveryAddress? deliveryAddress, AssignedAgent? assignedAgent, String? estimatedDeliveryTime, String? createdAt
});


$DeliveryAddressCopyWith<$Res>? get deliveryAddress;$AssignedAgentCopyWith<$Res>? get assignedAgent;

}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? deliveryType = null,Object? totalPrice = null,Object? orderItems = null,Object? deliveryAddress = freezed,Object? assignedAgent = freezed,Object? estimatedDeliveryTime = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,deliveryType: null == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as String,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,orderItems: null == orderItems ? _self.orderItems : orderItems // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,deliveryAddress: freezed == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as DeliveryAddress?,assignedAgent: freezed == assignedAgent ? _self.assignedAgent : assignedAgent // ignore: cast_nullable_to_non_nullable
as AssignedAgent?,estimatedDeliveryTime: freezed == estimatedDeliveryTime ? _self.estimatedDeliveryTime : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryAddressCopyWith<$Res>? get deliveryAddress {
    if (_self.deliveryAddress == null) {
    return null;
  }

  return $DeliveryAddressCopyWith<$Res>(_self.deliveryAddress!, (value) {
    return _then(_self.copyWith(deliveryAddress: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssignedAgentCopyWith<$Res>? get assignedAgent {
    if (_self.assignedAgent == null) {
    return null;
  }

  return $AssignedAgentCopyWith<$Res>(_self.assignedAgent!, (value) {
    return _then(_self.copyWith(assignedAgent: value));
  });
}
}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String status,  String deliveryType, @DoubleConverter()  double totalPrice,  List<OrderItem> orderItems,  DeliveryAddress? deliveryAddress,  AssignedAgent? assignedAgent,  String? estimatedDeliveryTime,  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.status,_that.deliveryType,_that.totalPrice,_that.orderItems,_that.deliveryAddress,_that.assignedAgent,_that.estimatedDeliveryTime,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String status,  String deliveryType, @DoubleConverter()  double totalPrice,  List<OrderItem> orderItems,  DeliveryAddress? deliveryAddress,  AssignedAgent? assignedAgent,  String? estimatedDeliveryTime,  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.id,_that.status,_that.deliveryType,_that.totalPrice,_that.orderItems,_that.deliveryAddress,_that.assignedAgent,_that.estimatedDeliveryTime,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String status,  String deliveryType, @DoubleConverter()  double totalPrice,  List<OrderItem> orderItems,  DeliveryAddress? deliveryAddress,  AssignedAgent? assignedAgent,  String? estimatedDeliveryTime,  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.status,_that.deliveryType,_that.totalPrice,_that.orderItems,_that.deliveryAddress,_that.assignedAgent,_that.estimatedDeliveryTime,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Order implements Order {
  const _Order({required this.id, required this.status, required this.deliveryType, @DoubleConverter() required this.totalPrice, required final  List<OrderItem> orderItems, this.deliveryAddress, this.assignedAgent, this.estimatedDeliveryTime, this.createdAt}): _orderItems = orderItems;
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

@override final  int id;
@override final  String status;
@override final  String deliveryType;
@override@DoubleConverter() final  double totalPrice;
 final  List<OrderItem> _orderItems;
@override List<OrderItem> get orderItems {
  if (_orderItems is EqualUnmodifiableListView) return _orderItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orderItems);
}

@override final  DeliveryAddress? deliveryAddress;
@override final  AssignedAgent? assignedAgent;
@override final  String? estimatedDeliveryTime;
@override final  String? createdAt;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&const DeepCollectionEquality().equals(other._orderItems, _orderItems)&&(identical(other.deliveryAddress, deliveryAddress) || other.deliveryAddress == deliveryAddress)&&(identical(other.assignedAgent, assignedAgent) || other.assignedAgent == assignedAgent)&&(identical(other.estimatedDeliveryTime, estimatedDeliveryTime) || other.estimatedDeliveryTime == estimatedDeliveryTime)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,deliveryType,totalPrice,const DeepCollectionEquality().hash(_orderItems),deliveryAddress,assignedAgent,estimatedDeliveryTime,createdAt);

@override
String toString() {
  return 'Order(id: $id, status: $status, deliveryType: $deliveryType, totalPrice: $totalPrice, orderItems: $orderItems, deliveryAddress: $deliveryAddress, assignedAgent: $assignedAgent, estimatedDeliveryTime: $estimatedDeliveryTime, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 int id, String status, String deliveryType,@DoubleConverter() double totalPrice, List<OrderItem> orderItems, DeliveryAddress? deliveryAddress, AssignedAgent? assignedAgent, String? estimatedDeliveryTime, String? createdAt
});


@override $DeliveryAddressCopyWith<$Res>? get deliveryAddress;@override $AssignedAgentCopyWith<$Res>? get assignedAgent;

}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? deliveryType = null,Object? totalPrice = null,Object? orderItems = null,Object? deliveryAddress = freezed,Object? assignedAgent = freezed,Object? estimatedDeliveryTime = freezed,Object? createdAt = freezed,}) {
  return _then(_Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,deliveryType: null == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as String,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,orderItems: null == orderItems ? _self._orderItems : orderItems // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,deliveryAddress: freezed == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as DeliveryAddress?,assignedAgent: freezed == assignedAgent ? _self.assignedAgent : assignedAgent // ignore: cast_nullable_to_non_nullable
as AssignedAgent?,estimatedDeliveryTime: freezed == estimatedDeliveryTime ? _self.estimatedDeliveryTime : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryAddressCopyWith<$Res>? get deliveryAddress {
    if (_self.deliveryAddress == null) {
    return null;
  }

  return $DeliveryAddressCopyWith<$Res>(_self.deliveryAddress!, (value) {
    return _then(_self.copyWith(deliveryAddress: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssignedAgentCopyWith<$Res>? get assignedAgent {
    if (_self.assignedAgent == null) {
    return null;
  }

  return $AssignedAgentCopyWith<$Res>(_self.assignedAgent!, (value) {
    return _then(_self.copyWith(assignedAgent: value));
  });
}
}

// dart format on
