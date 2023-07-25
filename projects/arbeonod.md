---
layout: page
title: "Unseen Object Detection"
---

![]()
<p align="center">
<img src="../assets/img/arbeon_ar_img.png" width="80%"/>
</p>

[ARBEON(알비언)](https://www.arbeon.com/)은 현실기반 AR SNS 서비스를 개발하는 회사입니다. 눈 앞의 사물을 AR-SCAN을 통해 Social Media, Commerce, Advertisement, Contents 등 여러가지 서비스를 제공합니다. 저는 이곳에서 AR-SCAN 원천 기술 중 하나인 "Unseen Object Detection" 모델 개발 업무를 수행하였습니다. 개발 목표는 아래와 같습니다.
 - Unseen Object Detection: 한번도 보지못한, 세상의 모든 객체에 대해서 검출 가능해야함
 - Class-agnostic Object Detection: class 관계없이 object 유무만 구분해도 됨  
 - Efficient Object Detection: 자체 테스트 셋 기준 90% 이상의 정확도, 아이폰 pro 기준 50mesc 이하 속도 달성
 - Detect only one desired object: 검출된 모든 객체 중 사용자가 증강하길 원하는 단 하나의 객체를 리턴해야함.

##### **Unseen Object Detection 모델 개발 및 모바일 포팅, iOS 앱 데모 구현 (2022-12-05 ~ 2023-03-20)** 
 Multi-model baseline 모델을 테스트 후 효과성을 확인 한 후 이를 모바일에 동작할 수 있도록 가볍게 만들었습니다. iPhone 13 Pro 에서 **20ms**와 **97.12의 Top1 정확도** 를 달성하였습니다.

 - 개발 방향성 계획 수립  
 - 회사 내 자체 테스트 데이터셋과 task에 알맞는 평가 프로토콜 개발
 - Image-text pair를 활용한 Multi-model object detection 모델 개발
 - iOS에 동작 가능하도록 모델 경량화
 - coremltools 활용한 모델 포팅
 - iOS 앱 데모 개발 
 - Top1 (R@1) 알고리즘 개발
 - 패키지 라이브러리 배포

##### **안드로이드용 Unseen Object Detection 초 경량화 및 포팅, Android 앱 데모 구현 (2022-03-21 ~ 2023-04-19)**
 동일모델이라도 안드로이드는 아이폰 보다 훨씬 속도가 느렸습니다 (아이폰 30ms, 안드로이드 400ms). 동시에 발열 문제도 있었습니다. 안드로이드 최적화의 핵심은 uint8 quantization과 NNAPI 입니다. 문제는 아이폰과 달리 안드로이드는 multi-head attention의 BatchMatMul을 NNAPI가 지원하지 않기 때문에 개발했던 모델을 제대로 적용 할 수 없었습니다. 이를 해결하기 위해 uint8 quantization과 NNAPI 사용 가능하도록 모델 구조를 변경하였습니다. 또한 약간의 성능 하락을 감수하고 모델을 좀 더 경량화 진행하였습니다. 그 결과 Galaxy s22 에서 **12ms** 와 **90.28% Top1 정확도**를 달성하였습니다.
 
 - onnx2tf를 활용한 모델 포팅
 - uint8 & NNAPI 사용을 위한 모델 경량화 및 구조 변경 
 - Android 앱 데모 개발

##### **Points를 활용한 Unseen Object Detection 모델 고도화 (2022-04-20 ~ 2023-07-18)**
 기존 모델의 동작 방식은 모든 객체를 검출한 후 Top1 알고리즘을 통해 가장 적합한 1개의 객체를 검출하게 됩니다. 문제는 객체를 검출했음에도 불구하고 Top1 알고리즘을 통과할 때 사용자가 원하는 객체를 리턴하지 않아 급격한 성능하락이 발생합니다. Segment Anything Model의 points embedding에 영감을 얻어 새로운 모델과 학습 전략을 개발 하였습니다. 그 결과 iPhone 13 Pro에서 **43ms** 와 **98.44% Top1 정확도**를 달성하였습니다. 

 - Points를 활용한 Unseen Object Detection 고도화

##### **Demo**
 - ultralytics/yolov8n (오픈소스): 한번도 보지 못한 객체는 검출하지 못함.
 - Android용 multi-model (our): 객체 검출 시 노이즈 약간 존재, 
 - ios용 multi-model (our): 거의 모든 객체 검출
 - ios용 multi-model with points (our): Points를 활용한 정확하게 사용자가 원하는 하나의 객체 검출

<p align="center">
<img src="https://github.com/Jung-Jun-Uk/Jung-Jun-Uk.github.io/releases/download/gif.file/od_ultralytics.gif" 
title="ultralytics/yolov8n" width="20%"/>
<img src="https://github.com/Jung-Jun-Uk/Jung-Jun-Uk.github.io/releases/download/gif.file/unseenod_android.gif" title="A" width="20%"/>
<img src="https://github.com/Jung-Jun-Uk/Jung-Jun-Uk.github.io/releases/download/gif.file/unseenod_ios.gif" title="A" width="20%"/>
<img src="https://github.com/Jung-Jun-Uk/Jung-Jun-Uk.github.io/releases/download/gif.file/unseenod_ios_large.gif" title="A" width="20%"/>
</p>
