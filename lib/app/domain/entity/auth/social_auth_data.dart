class SocialAuthData {
  final String email;
  final String? displayName;
  final String? userId;
  final String? tokenId;
  final String? photoUrl;
  final String? accessToken;
  final String? serverAuthCode;
  final String? secretToken;

  SocialAuthData({
    required this.email,
    this.displayName,
    this.userId,
    this.tokenId,
    this.photoUrl,
    this.accessToken,
    this.secretToken,
    this.serverAuthCode,
  });
}
