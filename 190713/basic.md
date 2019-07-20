# R 배경지식
## R vs Python
: 통계전용 툴에 가까움, 범용성은 적으나 통계기능, 머신러닝은 더 좋음 (딥러닝은 파이썬)

## # 배경지식
: 사용량 적은 무료 통계 프로그램이었으나 오클랜드 대학 해들리 위컴이 시각화 패키지 등 다수 제작하여 인기 증가
https://3months.tistory.com/391


# R 설치
## R core 다운로드
https://www.r-project.org/ 공식페이지 접속
https://cran.r-project.org/mirrors.html 에 접속해 가까운 미러에서 다운로드
https://cran.seoul.go.kr/ 예) 서울시 빅데이터 캠퍼스

## R core 실행
R-for-Windows3.6.1 (core)
: 인터넷으로 패키지 다운로드 하면 자꾸 질문 >>  관리자 권한으로 실행
* 윈도우 유저명이나 디렉토리는 한글 대신 영어 사용 (패키지가 전세계에서 개발되어 에러 발생 가능)
* [편집]-[GUI설정] - 폰트조절

## R-studio 다운로드
https://www.rstudio.com/
* 데이터 많을 경우 대용량 메모리 필요 -> 서버용 이용

[RStudio 1.2.1335 - Windows 7+ (64-bit)] (https://download1.rstudio.org/desktop/windows/RStudio-1.2.1335.exe)

## R-studio 실행
* R-core가 설치된 상태여야 함(실행 시 코어 불러옴)
* 관리자권한 설정
  :[속성]-[호환성]-[고급]-[관리자 권한으로 실행하기] 체크
* 코드 실행
  + 편집창에 명령어 입력 후 ctrl+Enter
  + 여러줄 선택 후 실행 시 한꺼번에 실행 가능
 
## R-studio 내부 설정
* [Tools]-[Global Options]-[General]-[Basic]-[R Sessions]

  # Default Working Directory 설정
  getwd()         # 반영 여부 확인
  setwd("c:\\Rdata")  #
  setwd("c:/Rdata")   # 
  dir("c:/Rlab/data_kim")

* [Tools]-[Global Options]-[Code]-[Saving]-[Default Text Encoding] 
 :UTF-8 으로 설정 (한글처리)

* [Tools]-[Global Options]-[Panel Layout]
  :편집창 / 콘솔 / 정보패널/ 비주얼패널 
