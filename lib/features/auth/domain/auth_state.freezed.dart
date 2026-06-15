// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AgentUser {

 int get id; String get name; String get email; String get role; int? get restaurantId;
/// Create a copy of AgentUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentUserCopyWith<AgentUser> get copyWith => _$AgentUserCopyWithImpl<AgentUser>(this as AgentUser, _$identity);

  /// Serializes this AgentUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,role,restaurantId);

@override
String toString() {
  return 'AgentUser(id: $id, name: $name, email: $email, role: $role, restaurantId: $restaurantId)';
}


}

/// @nodoc
abstract mixin class $AgentUserCopyWith<$Res>  {
  factory $AgentUserCopyWith(AgentUser value, $Res Function(AgentUser) _then) = _$AgentUserCopyWithImpl;
@useResult
$Res call({
 int id, String name, String email, String role, int? restaurantId
});




}
/// @nodoc
class _$AgentUserCopyWithImpl<$Res>
    implements $AgentUserCopyWith<$Res> {
  _$AgentUserCopyWithImpl(this._self, this._then);

  final AgentUser _self;
  final $Res Function(AgentUser) _then;

/// Create a copy of AgentUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? role = null,Object? restaurantId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,restaurantId: freezed == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AgentUser].
extension AgentUserPatterns on AgentUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AgentUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AgentUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AgentUser value)  $default,){
final _that = this;
switch (_that) {
case _AgentUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AgentUser value)?  $default,){
final _that = this;
switch (_that) {
case _AgentUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String email,  String role,  int? restaurantId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AgentUser() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.role,_that.restaurantId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String email,  String role,  int? restaurantId)  $default,) {final _that = this;
switch (_that) {
case _AgentUser():
return $default(_that.id,_that.name,_that.email,_that.role,_that.restaurantId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String email,  String role,  int? restaurantId)?  $default,) {final _that = this;
switch (_that) {
case _AgentUser() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.role,_that.restaurantId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AgentUser implements AgentUser {
  const _AgentUser({required this.id, required this.name, required this.email, required this.role, this.restaurantId});
  factory _AgentUser.fromJson(Map<String, dynamic> json) => _$AgentUserFromJson(json);

@override final  int id;
@override final  String name;
@override final  String email;
@override final  String role;
@override final  int? restaurantId;

/// Create a copy of AgentUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AgentUserCopyWith<_AgentUser> get copyWith => __$AgentUserCopyWithImpl<_AgentUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AgentUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AgentUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,role,restaurantId);

@override
String toString() {
  return 'AgentUser(id: $id, name: $name, email: $email, role: $role, restaurantId: $restaurantId)';
}


}

/// @nodoc
abstract mixin class _$AgentUserCopyWith<$Res> implements $AgentUserCopyWith<$Res> {
  factory _$AgentUserCopyWith(_AgentUser value, $Res Function(_AgentUser) _then) = __$AgentUserCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String email, String role, int? restaurantId
});




}
/// @nodoc
class __$AgentUserCopyWithImpl<$Res>
    implements _$AgentUserCopyWith<$Res> {
  __$AgentUserCopyWithImpl(this._self, this._then);

  final _AgentUser _self;
  final $Res Function(_AgentUser) _then;

/// Create a copy of AgentUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? role = null,Object? restaurantId = freezed,}) {
  return _then(_AgentUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,restaurantId: freezed == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthInitial value)?  initial,TResult Function( AuthLoading value)?  loading,TResult Function( AuthAuthenticated value)?  authenticated,TResult Function( AuthUnauthenticated value)?  unauthenticated,TResult Function( AuthError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that);case AuthLoading() when loading != null:
return loading(_that);case AuthAuthenticated() when authenticated != null:
return authenticated(_that);case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthInitial value)  initial,required TResult Function( AuthLoading value)  loading,required TResult Function( AuthAuthenticated value)  authenticated,required TResult Function( AuthUnauthenticated value)  unauthenticated,required TResult Function( AuthError value)  error,}){
final _that = this;
switch (_that) {
case AuthInitial():
return initial(_that);case AuthLoading():
return loading(_that);case AuthAuthenticated():
return authenticated(_that);case AuthUnauthenticated():
return unauthenticated(_that);case AuthError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthInitial value)?  initial,TResult? Function( AuthLoading value)?  loading,TResult? Function( AuthAuthenticated value)?  authenticated,TResult? Function( AuthUnauthenticated value)?  unauthenticated,TResult? Function( AuthError value)?  error,}){
final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that);case AuthLoading() when loading != null:
return loading(_that);case AuthAuthenticated() when authenticated != null:
return authenticated(_that);case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( AgentUser user,  String accessToken)?  authenticated,TResult Function()?  unauthenticated,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial();case AuthLoading() when loading != null:
return loading();case AuthAuthenticated() when authenticated != null:
return authenticated(_that.user,_that.accessToken);case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated();case AuthError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( AgentUser user,  String accessToken)  authenticated,required TResult Function()  unauthenticated,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AuthInitial():
return initial();case AuthLoading():
return loading();case AuthAuthenticated():
return authenticated(_that.user,_that.accessToken);case AuthUnauthenticated():
return unauthenticated();case AuthError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( AgentUser user,  String accessToken)?  authenticated,TResult? Function()?  unauthenticated,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial();case AuthLoading() when loading != null:
return loading();case AuthAuthenticated() when authenticated != null:
return authenticated(_that.user,_that.accessToken);case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated();case AuthError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AuthInitial implements AuthState {
  const AuthInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class AuthLoading implements AuthState {
  const AuthLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class AuthAuthenticated implements AuthState {
  const AuthAuthenticated({required this.user, required this.accessToken});
  

 final  AgentUser user;
 final  String accessToken;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthAuthenticatedCopyWith<AuthAuthenticated> get copyWith => _$AuthAuthenticatedCopyWithImpl<AuthAuthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAuthenticated&&(identical(other.user, user) || other.user == user)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken));
}


@override
int get hashCode => Object.hash(runtimeType,user,accessToken);

@override
String toString() {
  return 'AuthState.authenticated(user: $user, accessToken: $accessToken)';
}


}

/// @nodoc
abstract mixin class $AuthAuthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthAuthenticatedCopyWith(AuthAuthenticated value, $Res Function(AuthAuthenticated) _then) = _$AuthAuthenticatedCopyWithImpl;
@useResult
$Res call({
 AgentUser user, String accessToken
});


$AgentUserCopyWith<$Res> get user;

}
/// @nodoc
class _$AuthAuthenticatedCopyWithImpl<$Res>
    implements $AuthAuthenticatedCopyWith<$Res> {
  _$AuthAuthenticatedCopyWithImpl(this._self, this._then);

  final AuthAuthenticated _self;
  final $Res Function(AuthAuthenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? accessToken = null,}) {
  return _then(AuthAuthenticated(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AgentUser,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AgentUserCopyWith<$Res> get user {
  
  return $AgentUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class AuthUnauthenticated implements AuthState {
  const AuthUnauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUnauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.unauthenticated()';
}


}




/// @nodoc


class AuthError implements AuthState {
  const AuthError(this.message);
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthErrorCopyWith<AuthError> get copyWith => _$AuthErrorCopyWithImpl<AuthError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthErrorCopyWith(AuthError value, $Res Function(AuthError) _then) = _$AuthErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthErrorCopyWithImpl<$Res>
    implements $AuthErrorCopyWith<$Res> {
  _$AuthErrorCopyWithImpl(this._self, this._then);

  final AuthError _self;
  final $Res Function(AuthError) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
