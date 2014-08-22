# Developing Data Products - Course Project - Shiny App

# ui.R

library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("How to Lose Weight"),
    sidebarPanel(
        h3('Please enter the following:'),
        numericInput('height', 'Height (inches):', 66, min = 24, max = 96, step = 1),
        numericInput('weight', 'Weight (pounds):', 150, min = 50, max = 500, step = 1),
        numericInput('age', 'Age (years):', 30, min = 1, max = 100, step = 1),
        radioButtons("sex", "Male or Female:", c("Male" = "0", "Female" = "1"), 
                           selected = "0", inline = TRUE),
        radioButtons("pal", "Your Physical Activity Level:", 
                     c("Inactive" = "0", "Sedentary" = "1", "Moderate" = "2", "Vigorous" = "3", "Extreme" = "4"), 
                     selected = "1"),
        sliderInput('consume', 'How many calories do you consume per day?:', min = 500, max = 5000, 2000, step = 50),
        p('Your results are automatically updated on the right.')
    ),
    mainPanel(
        h3('Do you need to lose weight?'),
        h4('Your current Body Mass Index (BMI):'),
        verbatimTextOutput("oBMI"),
        p("Judge your personal BMI result against the following scale:"),
        ("* A BMI of less than 18 means you are under weight."),
        br("* A BMI of less than 18.5 indicates you are thin for your height."),
        ("* A BMI between 18.6 and 24.9 indicates you are at a healthy weight."),
        br("* A BMI between 25 and 29.9 suggests you are overweight for your height."),
        ("* A BMI of 30 or greater indicates obesity. If you are obese, consider consulting a doctor or losing weight."),
        h3('Losing one pound per week requires that you burn approximately 3,500 more calories than you consume.'),
        h3('Calories Burned...'),
        h4('Resting Metabolic Rate (RMR):'),
        verbatimTextOutput("oRMR"),
        p("Resting metabolic rate is an estimate of how many calories you would burn if you were to do nothing but rest for 24 hours. It represents the minimum amount of energy required to keep your body functioning."),
        h4('Calories Burned through your activity:'),
        verbatimTextOutput("oPAL"),
        h3('Calories Consumed...'),
        verbatimTextOutput("oConsume"),
        h2('Calories Consumed - Calories Burned ='),
        verbatimTextOutput("oDiff"),
        h3('Weight Change per week (+/- pounds):'),
        verbatimTextOutput("oChg")
    )
))
