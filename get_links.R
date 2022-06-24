library(rvest)

links <- "~/recovery-plan/recovery-plan-data.html" %>% 
    read_html() %>% 
    html_nodes("a") %>% 
    html_attrs() %>% 
    grep("infobar|mailto|#|^primarydata", ., invert = T, value = T)

download_files <- function(link){
    download.file(link, paste("~/recovery-plan/", basename(link)))
}

lapply(links, download_files)
