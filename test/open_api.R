# 환경변수 설정
# usethis::edit_r_environ()

## 라이브러리 테스트
library("PublicDataReader")

# 서비스키
serviceKey = Sys.getenv("SERVICE_KEY")
prod = "상업업무용"
trans = "매매"
LAWD_CD = "41135"
DEAL_YMD = "202201"

df = PublicDataReader::Transaction(serviceKey = serviceKey,
                                   prod = prod,
                                   trans = trans,
                                   LAWD_CD = LAWD_CD,
                                   DEAL_YMD = DEAL_YMD)

df