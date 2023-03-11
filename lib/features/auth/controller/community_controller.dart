import 'package:code_assist/core/constants/constants.dart';
import 'package:code_assist/core/utils.dart';
import 'package:code_assist/features/auth/controller/auth_controller.dart';
import 'package:code_assist/features/auth/home/screens/drawers/community/repository/community_repository.dart';
import 'package:code_assist/models/community_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class CommunityController extends StateNotifier<bool> {
  final CommunityRepository _communityRepository;
  final Ref _ref;
  CommunityController({
    required CommunityRepository communityRepository,
    required Ref ref,
  })  : _communityRepository = communityRepository,
        _ref = ref,
        super(false);

  void createCommunity(String name, BuildContext context) async {
    state = true;
    final uid = _ref.read(userProvider)?.uid ?? '';
    Community community = Community(
      id: name,
      name: name,
      banner: Constants.bannerDefault,
      avatar: Constants.avatarDefault,
      members: [],
      mods: [],
    );

    final res = await _communityRepository.createCommunity(community);
    state = false;
    res.fold((l) => showSnackBar(context, l.message), (r) {
      showSnackBar(context, 'codeRoom created successfully!');
      Routemaster.of(context).pop();
    });
  }
}
