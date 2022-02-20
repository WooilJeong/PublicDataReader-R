#' Transaction() Function
#'
#' 국토교통부 부동산 실거래가 Open API
#' @param serviceKey, prod, trans, LAWD_CD, DEAL_YMD
#' @keywords pdr
#' @export
#' @examples
#' Transaction("<service key>", "아파트", "매매", "41135", "202201")

Transaction <- function(serviceKey, prod, trans, LAWD_CD, DEAL_YMD) {

    ENDPOINT_LIST <- list(
                    "아파트" = list(
                                    "매매" = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev",
                                    "전월세" = "http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptRent"
                    ),
                    "오피스텔" = list(
                                    "매매" = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcOffiTrade",
                                    "전월세" = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcOffiRent"
                    ),
                    "단독다가구" = list(
                                    "매매" = "http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcSHTrade",
                                    "전월세" = "http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcSHRent"
                    ),
                    "연립다세대" = list(
                                    "매매" = "http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade",
                                    "전월세" = "http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHRent"
                    ),
                    "상업업무용" = list(
                                    "매매" = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcNrgTrade"
                    ),
                    "토지" = list(
                                    "매매" = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcLandTrade"
                    ),
                    "분양입주권" = list(
                                    "매매" = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcSilvTrade"
                    )
                    )

    # 엔드포인트 선택
    end_point <- ENDPOINT_LIST[[prod]][[trans]]

    # 요청
    res <- GET(url = end_point,
               query = list(LAWD_CD = LAWD_CD,
                            DEAL_YMD = DEAL_YMD,
                            serviceKey = serviceKey %>% I(),
                            numOfRows = 99999
                            ))

    # 응답 데이터에서 JSON 데이터 추출
    res %>% 
        content(as = 'text', encoding = "UTF-8") %>% 
        fromJSON() -> json

    # 데이터프레임을 df에 할당하고 출력
    df <- json$response$body$items$item
    return(df)
}