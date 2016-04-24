shinyUI(
	pageWithSidebar(
	headerPanel("Shiny Golf Tournament"),

	sidebarPanel(
		h3('Design your shot'),
		'In order to win, modify the speed and angle of the shot and try to hit the red triangle.',
		#actionButton("newhole","Place hole"),
		numericInput(inputId = "angle",label="Angle", min=10, max=90, step=.25, value=25),
		numericInput(inputId = "speed",label="Velocity", min=0.5, max=50, step=.25, value=25),
		#actionButton("butt","Shoot!")
		submitButton("Shoot!")
	),

	mainPanel(
	plotOutput(outputId = "hist"),
	textOutput(outputId = "holeplace")
	# textOutput(outputId = "winlose")
	)
	)
)



