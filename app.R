if (interactive()) {
  
  ui <- fluidPage(
    textInput("seq", "Sequence", "ATCGNY"),
    verbatimTextOutput("value")
  )
  server <- function(input, output) {
    
    
    output$value <- renderText({ 
      codes<-list(A=c("A"),
                  B=c("C","G","T"),
                  C="C",
                  D=c("A","G","T"),
                  G="G",
                  H=c("A","C","T"),
                  K=c("G","T"),
                  M=c("A","C"),
                  N=c("A","T","C","G"),
                  R=c("A","G"),
                  S=c("C","G"),
                  T="T",
                  V=c("A","C","G"),
                  W=c("A","T"),
                  Y=c("C","T"),
                  ` `="")
      
     out<-paste0(unlist(sapply(unlist(strsplit(input$seq, split="")), function(x){
sample(codes[[x]], 1)
     })), collapse="")
     out
      })
  }
  shinyApp(ui, server)
}