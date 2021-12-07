Programming Study
=================

## 목차

- [Algorithm](#Algorithm)
    - [BinarySearch](#BinarySearch)
    - [MergeSort](#MergeSort)
- [Swift](#Swift)
    - [Core Graphic Transformation](#Core-Graphic-Transformation)
    - [CollectionView Context Menus](#CollectionView-Context-Menus)
    - [PropertyWrapper](#PropertyWrapper)
    - [DynamicMemberLookup](#DynamicMemberLookup)
    - [Will Set Blocks for Properties](#Will-Set-Blocks-for-Properties)
    - [Reflection Mirror](#Reflection-Mirror)
    

## Algorithm

### [BinarySearch](https://github.com/Jino0910/Study/blob/master/Algorithm/BinarySearch.playground/Contents.swift)
>오름차순으로 정렬된 배열이 있다.  
>**[17, 28, 43, 67, 88, 92, 100]**  
>이 배열에서 `이진 탐색`을 이용하여 **43**의 값을 찾아보자.


### [MergeSort](https://github.com/Jino0910/Study/blob/master/Algorithm/MergeSort.playground/Contents.swift)
>정렬되어 있지 않은 배열이 있다.  
>**[12, 3, 13, 111, 987, 71, 17, 22, 3, 89, 18, 12]**  
>`MergeSort`를 활용하여 오름차순으로 정렬해 보자.

## Swift

### Core Graphic Transformation
> Rotation, Translation, Scale, identity 활용

### CollectionView Context Menus
> **Peek and Pop**: 상세 보기 컨트롤러에서 콘텐츠를 미리 볼 수 있는 프리뷰를 제공합니다.  
> iOS13+

### PropertyWrapper
> `@propertyWrapper`를 붙여 프로퍼티 단위로 특정 행동(비지니스 로직)을 하도록 정의할 수 있습니다.  
>`class`, `struct`, `enum`에 사용 가능(프로퍼티를 가질 수 있는 타입)

### DynamicMemberLookup
>동적으로 프로퍼티에 접근해보자.  
>`class`, `struct`, `enum`, `protocol`에 사용 가능

### Will Set Blocks for Properties
> **Property Observer**는 프로퍼티의 `값의 변화`를 관찰하고, 이에 응답합니다.  
> 프로퍼티의 값이 **반드시 초기화** 되어 있어야 합니다.

### Reflection Mirror
> **struct**입니다.  
> Mirror는 인스턴스의 `stored property`, `collection`, `tuple element`, `active enumeration case`와 같이 특정 인스턴스를 구성하는 부분(parts)을 설명한다고 합니다.

