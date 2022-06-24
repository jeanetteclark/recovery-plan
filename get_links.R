library(rvest)

links <- "recovery-plan-data.html" %>% 
    read_html() %>% 
    html_nodes("a") %>% 
    html_attrs() %>% 
    grep("infobar|mailto|#|^primarydata", ., invert = T, value = T)

download_files <- function(link){
    download.file(link, basename(link))
}

lapply(links, download_files)
