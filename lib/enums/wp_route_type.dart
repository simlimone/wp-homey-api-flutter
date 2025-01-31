// Copyright (c) 2024, WooSignal Ltd.
// All rights reserved.
//
// Redistribution and use in source and binary forms are permitted
// provided that the above copyright notice and this paragraph are
// duplicated in all such forms and that any documentation,
// advertising materials, and other materials related to such
// distribution and use acknowledge that the software was developed
// by the WooSignal. The name of the
// WooSignal may not be used to endorse or promote products derived
// from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
// IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

enum WPRouteType {
  /// Route type [WPRouteType.UserUpdatePassword] is used to update a WordPress user's password.
  /// For WordPress
  UserUpdatePassword,

  /// Route type [WPRouteType.UserUpdateInfo] is used to update a WordPress user's account info.
  /// For WordPress
  UserUpdateInfo,

  /// Route type [WPRouteType.UserAddRole] is used to add a role to a WordPress user's account.
  /// For WordPress
  UserAddRole,

  /// Route type [WPRouteType.UserRemoveRole] is used to remove a role to a WordPress user's account.
  /// For WordPress
  UserRemoveRole,

  /// Route type [WPRouteType.UserInfo] is used to return a WordPress user's info.
  /// For WordPress
  UserInfo,

  /// Route type [WPRouteType.UserRegister] is used to Register a user's on WordPress.
  /// For WordPress
  UserRegister,

  /// Route type [WPRouteType.UserDelete] is used to delete a user from WordPress.
  /// For WordPress
  //UserDelete,

  /// Route type [WPRouteType.AuthNonce] is used to get a nonce token to authenticate future API requests.
  /// For WordPress
  AuthLogin,

  /// Route type [WPRouteType.AuthValidate] is used to verify an existing nonce token.
  /// For WordPress
  AuthValidate,

  /// Route type [WPRouteType.AuthRefresh] is used to refresh the token without credentials.
  /// For WordPress
  AuthRefresh,

  /// Route type [WPRouteType.SendEmail] is used to send email to users.
  ///
  SendEmail,
}
