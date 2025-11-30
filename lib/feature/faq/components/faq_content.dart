import 'package:flutter/widgets.dart';

import 'faq_content_item.dart';

class FaqContent extends StatelessWidget {
  const FaqContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FaqContentItem(
          question: '주차 가능한가요?',
          answer:
              '- 지정 주차는 따로 없으나 지점 건물에 유료 주차장이 있습니다.\n- 덕암빌딩 기계식 주차장 (서울 서초구 효령로 276)\n- 30분 3000원 / 종일권 3만원',
        ),
        FaqContentItem(
          question: '흡연 가능한가요?',
          answer: '흡연(전자담배포함)불가합니다.',
        ),
        FaqContentItem(
          question: '같이 먹고 싶은 음식,주류가 있는데 콜키지 가능한가요?',
          answer: '주류, 음료만 반입 가능합니다. 음식은 reflection에서 준비한 음식들을 즐겨주세요!',
        ),
        FaqContentItem(
          question: '화장실은 어디에 있나요?',
          answer: '남/여 분리 - 한 층 위 1F,  남자 화장실(소변기) - 같은 층 B1F 복도 끝',
        ),
      ],
    );
  }
}
