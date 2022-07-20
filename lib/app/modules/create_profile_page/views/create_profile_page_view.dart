import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:naan_wallet/app/modules/common_widgets/naan_textfield.dart';
import 'package:naan_wallet/app/modules/common_widgets/solid_button.dart';
import 'package:naan_wallet/utils/colors/colors.dart';
import 'package:naan_wallet/utils/constants/path_const.dart';
import 'package:naan_wallet/utils/extensions/size_extension.dart';
import 'package:naan_wallet/utils/material_Tap.dart';

import '../../../../utils/styles/styles.dart';
import '../controllers/create_profile_page_controller.dart';

class CreateProfilePageView extends GetView<CreateProfilePageController> {
  const CreateProfilePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: GradConst.GradientBackground),
      width: 1.width,
      padding: EdgeInsets.symmetric(horizontal: 0.05.width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          0.1.vspace,
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Create Profile", style: titleLarge),
          ),
          0.05.vspace,
          Container(
            height: 120,
            width: 120,
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(60),
            ),
            child: materialTap(
              onPressed: () {
                Get.bottomSheet(changePhotoBottomSheet());
              },
              inkwellRadius: 18,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: SvgPicture.asset(PathConst.SVG + "add_photo.svg"),
              ),
            ),
          ),
          0.05.vspace,
          NaanTextfield(hint: "Account Name"),
          0.02.vspace,
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "or  choose a avatar",
              textAlign: TextAlign.left,
              style: labelSmall.apply(color: ColorConst.NeutralVariant.shade60),
            ),
          ),
          //  19.h.vspace,
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: List.generate(
                11,
                (index) => CircleAvatar(
                  radius: 30,
                ),
              ),
            ),
          ),
          SolidButton(
            title: "Start using Naan wallet",
            onPressed: () {},
          ),
          0.05.vspace
        ],
      ),
    );
  }

  Widget changePhotoBottomSheet() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff07030c).withOpacity(0.49),
              Color(0xff2d004f),
            ],
          ),
        ),
        width: 1.width,
        height: 296,
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            0.005.vspace,
            Container(
              height: 5,
              width: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorConst.NeutralVariant.shade60.withOpacity(0.3),
              ),
            ),
            0.03.vspace,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Change profile photo",
                textAlign: TextAlign.start,
                style: titleLarge,
              ),
            ),
            0.03.vspace,
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorConst.NeutralVariant.shade60.withOpacity(0.2),
              ),
              child: Column(
                children: [
                  materialTap(
                    onPressed: () {},
                    noSplash: true,
                    child: Container(
                      width: double.infinity,
                      height: 51,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Choose photo",
                        style: labelMedium,
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xff4a454e),
                    height: 1,
                    thickness: 1,
                  ),
                  materialTap(
                    onPressed: () {},
                    noSplash: true,
                    child: Container(
                      width: double.infinity,
                      height: 51,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Take photo",
                        style: labelMedium,
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xff4a454e),
                    height: 1,
                    thickness: 1,
                  ),
                  materialTap(
                    onPressed: () {},
                    noSplash: true,
                    child: Container(
                      width: double.infinity,
                      height: 51,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Remove current photo",
                        style:
                            labelMedium.apply(color: ColorConst.Error.shade60),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
