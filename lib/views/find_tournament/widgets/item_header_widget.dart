import 'package:flutter/material.dart';
import 'package:pickle_ball/utils/assets_utils.dart';

class ItemHeaderWidget extends StatelessWidget {
  const ItemHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Image.asset(
            AssetUtils.imgSignIn,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Pickle Ball Tournament',
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Rounds and Knockout | Pickle Ball',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.remove_red_eye_outlined,
                    size: 15,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text('12'),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.person_2_outlined,
                    size: 15,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text('12'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
