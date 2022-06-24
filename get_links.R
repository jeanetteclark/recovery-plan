library(rvest)

# this downloads all of the files linked in the data page
# note that for this code to run, you need to be behind the NCEAS firewall

links <- "recovery-plan-data.html" %>% 
    read_html() %>% 
    html_nodes("a") %>% 
    html_attrs() %>% 
    grep("infobar|mailto|#|^primarydata", ., invert = T, value = T)

download_files <- function(link){
    download.file(link, basename(link))
}

lapply(links, download_files)
