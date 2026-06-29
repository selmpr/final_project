enum ProfileStatus { initial, loding, success, error }

class ProfileState {
  final ProfileStatus status;
  final String? errorMessage;
  final Map<String, dynamic>? data;
  const ProfileState({
    this.status = ProfileStatus.initial,
    this.errorMessage,
    this.data,
  });
  ProfileState copyWith({
    ProfileStatus? status,
    String? errorMessage,
    Map<String, dynamic>? data,
  }) {
    return ProfileState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
    );
  }

  @override
  String toString() {
    return 'status: $status error:$errorMessage'
        'data:$data';
  }
}
