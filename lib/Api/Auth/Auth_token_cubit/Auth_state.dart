part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthorizationState extends AuthState {
  AuthorizationState(this.token, this.userRole, this.userId);
  final Token token;
  final Roles userRole;
  final String userId;
}

final class AuthorizationInitial extends AuthState {}



// @freezed
// class TokenState with _$TokenState {
//   const factory TokenState.initial() = _Initial;
//   const factory TokenState.authorized(Token token) = _Authorized;
//   // we need only two states - initial (which means unauthorized) and authorized
//   factory TokenState.fromJson(Map<String, dynamic>? json) {
//     if (json == null) {
//       return const TokenState.initial();
//     } else {
//       switch (json['type'] as String) {
//         case 'authorized':
//           return TokenState.authorized(
//             Token(
//                 json['accessToken'] as String,
//                 json['refreshToken'] as String,
//                 DateTime.parse(json['expiration'] as String),
//                 json['idToken'] as String),
//           );
//         case 'initial':
//           return const TokenState.initial();
//       }
//     }
//     return const TokenState.initial();
//   } // this factory is for hydrated bloc (which converts state to json and saves it to the storage - hive storage by default, but you can use whatever storage you want)
// }

// extension TokenStateX on TokenState {
//   Token? get token =>
//       maybeWhen(authorized: (token) => token, orElse: () => null);
//   bool isInitial() => maybeWhen(
//       orElse: () => false,
//       initial: () => true); //convenient way to check if user is unauthorized
//   Map<String, String> toAuthorizationHeader() => maybeWhen(
//         authorized: (token) => {
//           "Authorization": "Bearer ${token.accessToken}",
//         },
//         orElse: () => {},
//       ); //method to create header for dio easily
//   Map<String, dynamic> json() => when(
//         initial: () => {'type': 'initial'},
//         authorized: (token) => {
//           'type': 'authorized',
//           'accessToken': token.accessToken,
//           'refreshToken': token.refreshToken,
//           'expiration': token.accessTokenExpirationDateTime?.toIso8601String(),
//           'idToken': token.idToken,
//           'tokenType': token.tokenType
//         },
//       );
// }
