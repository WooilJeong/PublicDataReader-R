# PublicDataReader

![PNG](./img_logo.png)


## Installation

```r
library("devtools")
devtools::install_github("WooilJeong/PublicDataReader-R/PublicDataReader", force=TRUE)
```


## 국토교통부 실거래가 데이터 조회 예시

```r
library("PublicDataReader")

serviceKey = "서비스 키"
prod = "아파트"
trans = "매매"
LAWD_CD = "41135"
DEAL_YMD = "202201"

df = Transaction(serviceKey = serviceKey,
                               prod = prod,
                               trans = trans,
                               LAWD_CD = LAWD_CD,
                               DEAL_YMD = DEAL_YMD)
```