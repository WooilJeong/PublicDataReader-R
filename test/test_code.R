# 필수 패키지 설치
install.packages("devtools")
install.packages("roxygen2")

# 패키지 임포트
library(devtools)
library(roxygen2)

# 프로젝트 루트 경로 설정
setwd("D:/github/PublicDataReader-R")
getwd()

# 패키지 생성
devtools::create("PublicDataReader")

# 문서 작성
setwd("D:/github/PublicDataReader-R/PublicDataReader")
devtools::document()

# 로컬에 패키지 설치하기
devtools::install(pkg="R")

# 로컬에서 패키지 불러오기
base::require("PublicDataReader")
