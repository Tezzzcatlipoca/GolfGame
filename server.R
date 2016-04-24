shinyServer(
	function(input, output) {

	#Assigning values of global variables	
	assign("coord", 0, pos=1)
	WINS<<-0
	lugar<<-rnorm(1,mean=30,sd=2.5)
	hole<<-c(lugar-.25,lugar+.25) #Setting the width of the hole
	sec<<-seq(0,5,0.01)
	if (hole[1]<coord & coord<hole[2]) { WINS<<-1}

	# Graficar linea ------------------
	output$hist<-renderPlot({
		angulo<-input$angle*pi/180 #Converting degrees to radians
		x<-sec*cos(angulo)*input$speed #Calculating component x of the vector
		vel<-input$speed-(sec*9.8) #Calculating vertical velocity (gravity=9.8m/s^2)
		y<-sec*sin(angulo)*vel #Calculating component y of vector
		plot(x,y,col="blue",ylim=c(0,40),xlim=c(0,40),pch='.') #Ploting shot
		points(lugar,0,col="red",pch=17) #Ploting place of the hole
		suelo<<-which(y<=0.01) #Detecting where ball hits ground
		if (length(suelo)==0) {primsuelo<<-1 #Checking whether ground is hit at place of hole
		} else {
		primsuelo<<-suelo[2]
		}
		#assign("coord", x[primsuelo],pos=1)
		#points(x[suelo],rep(0,length(suelo)),col="green")
		coord<<-x[primsuelo]

 	}) #output$hist

	output$holeplace<-renderText({
		input$speed
		input$angle
		if (hole[1]<coord & coord<hole[2]) { WINS<<-1} #If hole in 1 then Win
		if (WINS==1) { 'YOU WIN!!! Hole in 1. Refresh page to play again.'
		} else {
		'A higher angle will make the ball fall closer to 0. A higher speed will make it go farther.'
		}
		
	})

	} #function
) #server


